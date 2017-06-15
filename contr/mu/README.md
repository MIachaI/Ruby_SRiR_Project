## class *Code*
*check_syntax* sprawdza poprawność składni <br/>
*save_code_to_file(name)* zapisuje kod do pliku o wskazanej nazwie <br/>
*code_output(parameters)* zwraca odpowiedź konsoli po wykonaniu programu <br/>

## class *Server*
odbiera tylko 1000 znakow (do poprawy)
```ruby
server = TCPServer.open(@port)
    loop {
      client = server.accept
      codex = client.recv(1000)
      }
```
to co [wyszło](http://imgur.com/a/qAR8Z)

## class *Message*
Za zadanie ma wygenerować tekst à la XML zawierający informacje o kodzie do wykonania oraz parametry z jakimi ma być wywołany.
Przykładowo
```ruby
msg = Message.new("puts \"Hello \#{ARGV[0]}\"", ["Brian"])
puts msg.generate_message
```
wypisze następującą odpowiedź
```xml
<text>puts "Hello #{ARGV[0]}"</text>
<param>Brian</param>

```
Następnie z wiadomości w takim formacie można uzyskać dostęp do zmienncyh `text` i `parameters[]` za pomocą odpowiadających im accessorów oraz metody `get_vals(message)`.

## unit testy
Testy sprawdzają:
* pusty kod (poprawność składni: *true*, zwracana odpowiedź: `""`)
* *null* jako argument do konstruktora Code (poprawność składni: *false*)
* prosty kod z command line argumentami - plik `mu/tests/test_files/simple_code.rb` (poprawność składni: *true*)
* czy kod wymaga wprowadzenia danych w ciągu wykonania programu (poprawność składni powinna być wtedy *false*)
* poprawność działania klasy `Message`
  * poprawna wiadomość
  * niedomknięte/puste tagi

### Źródełka

* [How to check ruby syntax error in ruby code](https://stackoverflow.com/questions/27272463/how-to-check-ruby-syntax-error-in-ruby-code)
* [Output of system calls in ruby](https://stackoverflow.com/questions/690151/getting-output-of-system-calls-in-ruby)
* [Sockeciki](https://www.tutorialspoint.com/ruby/ruby_socket_programming.htm)
* Unit testy
  * [1](https://ruby-doc.org/stdlib-1.8.7/libdoc/test/unit/rdoc/Test/Unit.html)
  * [2](https://en.wikibooks.org/wiki/Ruby_Programming/Unit_testing)
* [XML-RPC](https://www.tutorialspoint.com/xml-rpc/xml_rpc_intro.htm) -
