require "xmlrpc/server"
require_relative 'code_tester'
require_relative '../mp/../../contr/mp/collect_and_compare_programs'

port = 8080
if ARGV[0] != nil
  port = ARGV[0]
end

s = XMLRPC::Server.new(port)

program= ""

s.add_handler("mu.check_syntax") do |code|
  cd = Code.new(code)
  result = cd.check_syntax
  # jeśli kod poprawny - zapisz do pliku
  if result
    time = Time.new
    filename = time.year.to_s + "_" + time.month.to_s + "_" + time.day.to_s + "_" + time.hour.to_s + time.min.to_s + time.sec.to_s + ".rb"
    cd.save_code_to_file(filename)
  end
  result
end

s.add_handler("mp.collect_and_compare_programs") do |folderName|
  report = CollectAndComparePrograms.new
  result = report.checkFolder(folderName)
  result
end

#ms
s.add_handler("ms.send_program") do |receivecode|
  program = receivecode
  check_syntax(program)
end

s.set_default_handler do |name, *args|
  raise XMLRPC::FaultException.new(-99, "Method #{name} missing or wrong number of parameters!")
end



s.serve
