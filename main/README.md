## Client
Należy przygotować plik z kodem, który ma być wykonany na serwerze (przykładowy kod znajduje się w pliku `code.rb`).
Uruchamiając program klienta należy podać ścieżkę do pliku z kodem.

Przykład uruchomienia programu w celu zdalnego wykonania kodu zawartego w pliku `code.rb`
```sh
$ ruby client.rb code.rb
```

## Server
Uruchomienie serwera
```sh
$ ruby xmlrpc_server.rb <port_num>
```

Zdalne procedury znajdujące się na serwerze:
* `mu.check_syntax` - sprawdzenie składni przesłanego kodu. Zwracany typ: boolean
* `mp.collect_and_compare_programs`
