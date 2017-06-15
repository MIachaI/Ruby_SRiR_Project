require_relative "client"

port = 1999
client = Client.new(port)
puts "Jestem klientem, probuje sie polaczyc z serwerem na porcie #{port}"
client.run
