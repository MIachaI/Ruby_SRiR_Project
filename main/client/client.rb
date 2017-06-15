require "xmlrpc/client"

ip = "127.0.0.1"
if !ARGV.empty?
  ip = ARGV[0]
  ARGV.clear
end

puts "Podaj nazwę pliku z kodem"
filename = gets.chomp
parameters = nil
puts "Podaj parametry do wywołania kodu: "
parameters = gets.split(" ")

server = XMLRPC::Client.new(ip, "/RPC2", 8080)
begin
  code = File.new(filename).read
  param = server.call("mu.check_syntax", code)
  puts "Poprawność składni: #{param}"
  if param
    prog_resp = server.call("mu.code_output", code, parameters)
    report = server.call("mp.collect_and_compare_programs", "files")
    puts report
    puts "Odpowiedź programu: #{prog_resp}"
  else
    puts "Nie udało się wykonać kodu"
  end
rescue XMLRPC::FaultException => e
  puts "Error:"
  puts e.faultCode
  puts e.faultString
end
