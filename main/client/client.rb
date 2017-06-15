require "xmlrpc/client"

if ARGV.empty?
  puts "Podaj nazwę pliku z kodem"
  filename = gets.chomp
else
  filename = ARGV[0]
end

server = XMLRPC::Client.new("127.0.0.1", "/RPC2", 8080)
begin
  param = server.call("mu.check_syntax", File.new(filename).read)
  puts "Poprawność składni: #{param}"
rescue XMLRPC::FaultException => e
  puts "Error:"
  puts e.faultCode
  puts e.faultString
end
