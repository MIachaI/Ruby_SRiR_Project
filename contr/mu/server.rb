require 'socket'
require_relative 'code_tester'
require_relative '../mp/collect_and_compare_programs'
require_relative 'comm'

class Server
  attr_accessor :port, :server_response
  def initialize(port=1999)
    @port = port
  end

  def run
    server = TCPServer.open(@port)
    loop {
      Thread.start(server.accept) do |client|
        puts "Polaczono:"
        # odbiera tylko 1000 znakow (do poprawy)
        msg = client.recv(1000)
        message = Message.new()
        message.get_vals(msg)
        code = Code.new(message.text)

        @server_response = code.check_syntax
        if @server_response
          time = Time.new
          filename = time.year.to_s + "_" + time.month.to_s + "_" + time.day.to_s + "_" + time.hour.to_s + time.min.to_s + time.sec.to_s + ".rb"
          puts "Zapisano kod klienta do pliku #{filename}"
          code.save_code_to_file(filename)
          cdcmppr = CollectAndComparePrograms.new
          @server_response = "\rKod poprawny"
          @server_response += "\nOutput programu: \n"
          @server_response += code.code_output message.parameters
          # @server_response += cdcmppr.compareFiles
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
