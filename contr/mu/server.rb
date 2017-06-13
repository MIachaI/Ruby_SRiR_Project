require 'socket'
require_relative 'code_tester'

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
        code = Code.new(codex)

        @server_response = code.check_syntax
        if @server_response
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
