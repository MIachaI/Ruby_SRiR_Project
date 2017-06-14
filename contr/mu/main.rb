require_relative "code_tester"
require_relative "server"

port = 1999
server = Server.new(port)
puts "Zaczynam nowy serwer na porcie #{port}"
server.run
