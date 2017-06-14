require 'socket'
require_relative 'code_tester'
require_relative '../mp/collect_and_compare_programs'

class Server
  attr_accessor :port, :server_response
  def initialize(port=1999)
    @port = port
  end

  def run
    server = TCPServer.open(@port)
    loop {
      Thread.start(server.accept) do |client|
        # odbiera tylko 1000 znakow (do poprawy)
        codex = client.recv(1000)
        code = Code.new codex

        @server_response = code.check_syntax
        if @server_response
          time = Time.new
          filename = time.year.to_s + "_" + time.month.to_s + "_" + time.day.to_s + "_" + time.hour.to_s + time.min.to_s + time.sec.to_s + ".rb"
          puts "Zapisano kod klienta do pliku #{filename}"
          code.save_code_to_file(filename)
          @server_response = "\rKod poprawny"
          @server_response += "\nOutput programu: \n"
          @server_response += code.code_output
        else
          @server_response = "\nBłąd. Opis: \n"
          @server_response += code.syntax_error_msg
        end
        client.print(@server_response)
        client.close
      end
    }
  end
end
