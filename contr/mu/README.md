:zzz:

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

## unit testy
Testy sprawdzają:
* pusty kod (poprawność składni: *true*, zwracana odpowiedź: `""`)
* *null* jako argument do konstruktora Code (poprawność składni: *false*)
* prosty kod z command line argumentami - plik `mu/tests/test_files/simple_code.rb` (poprawność składni: *true*)
* czy kod wymaga wprowadzenia danych w ciągu wykonania programu (poprawność składni powinna być wtedy *false*)

### Źródełka

* [How to check ruby syntax error in ruby code](https://stackoverflow.com/questions/27272463/how-to-check-ruby-syntax-error-in-ruby-code)
* [Output of system calls in ruby](https://stackoverflow.com/questions/690151/getting-output-of-system-calls-in-ruby)
* [Sockeciki](https://www.tutorialspoint.com/ruby/ruby_socket_programming.htm)
* Unit testy
  * [1](https://ruby-doc.org/stdlib-1.8.7/libdoc/test/unit/rdoc/Test/Unit.html)
  * [2](https://en.wikibooks.org/wiki/Ruby_Programming/Unit_testing)
