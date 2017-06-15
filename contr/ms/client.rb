#ms
require "xmlrpc/client"

kod = "puts 'Hello, world!'"
server = XMLRPC::Client.new("127.0.0.1", "/RPC2", 1999)
begin
  param = server.call("mu.send_program", kod)
  puts "kod = #{param}"
rescue XMLRPC::FaultException => e
  puts "Error:"
  puts e.faultCode
  puts e.faultString
end