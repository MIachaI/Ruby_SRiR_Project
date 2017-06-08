require_relative "code_tester.rb"

code = Code.new(File.read "test_file.rb")
puts code.code_output [1,3]
