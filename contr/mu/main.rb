require_relative "code_tester"
require_relative "server"

# przykład odczytania kodu i wykonania go z argumentami
# code = Code.new(File.read "test_file.rb")
# puts code.code_output [1,3]
# code.save_code_to_file("teset.rb")

port = 1999
server = Server.new(port)
puts "Zaczynam nowy serwer na porcie #{port}"
server.run
