# to jest testowy plik do przesłania na serwer

puts "Hello"

def square(x)
  x*x
end

puts square(square(2))
if !ARGV.empty?
  puts "Parametr 1: #{ARGV[0]}"
  puts "Parametr 2: #{ARGV[1]}"
  sum = ARGV[0].to_i + ARGV[1].to_i
  puts "Dodawanie: #{ARGV[0]} + #{ARGV[1]} = " + sum.to_s
end
