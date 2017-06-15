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
  prog_resp = server.call("mu.code_output", File.new(filename).read, [10,43])
  puts "Poprawność składni: #{param}"
  puts "Odpowiedź programu: #{prog_resp}"
rescue XMLRPC::FaultException => e
  puts "Error:"
  puts e.faultCode
  puts e.faultString
end
