## Client
Należy przygotować plik z kodem, który ma być wykonany na serwerze (przykładowy kod znajduje się w pliku `code.rb`).
Uruchamiając program klienta należy podać adres serwera (domyślnym adresem jest `127.0.0.1`).

Przykład uruchomienia klienta
```sh
$ ruby client.rb 127.0.0.1
```
Program następnie prosi o podanie nazwy pliku, w którym znajduje się kod oraz podanie parametrów, z jakimi ten kod ma zostać wykonany.

## Server
Uruchomienie serwera
```sh
$ ruby xmlrpc_server.rb <port_num>
```

Zdalne procedury znajdujące się na serwerze:
* `mu.check_syntax` - sprawdzenie składni przesłanego kodu. Zwracany typ: boolean
* `mp.collect_and_compare_programs`
* `bs.code_output`- zwraca wydruk będący wynikiem działania przesłanego kodu
