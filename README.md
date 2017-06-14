# Ruby_SRiR_Project
Ruby RPC Project
1)    O projekcie
 
2)    Analiza dostępności
RPC (Remote Procedure Call) to mechanizm komunikowania międzyprocesowego (IPC), który umożliwia wymianę danych oraz wywoływanie funkcji działających w innym procesie. Proces ten może znajdować się na tym samym komputerze, w sieci lokalnej (LAN), lub w Internecie. W przypadku RPC, istotna logika programu oraz odpowiedni kod procedury mogą istnieć na innych komputerach, co jest ważne dla aplikacji rozproszonych.
RPC może używać dwóch odmiennych protokołów (TCP albo UDP), stąd istnieją dwa typy klientów i warstw transportowych serwera. Warstwa transportowa pośredniczy między pojedynczym gniazdem a serwerem. Serwer RPC może obsługiwać  jednocześnie kilka warstw transportowych – po jednej na każde aktywne połączenie TCP, każde oczekiwanie połączenia TCP oraz każde gniazdo UDP.
Porównując RPC do kontroli przez przeglądarkę internetową, RPC jest przeznaczone do sytuacji, w których jeden program może korzystać z metod i procedur udostępnianych przez inne. Ruby ma wbudowane wsparcie dla dwóch najpopularniejszych protokołów RPC, XML-RPC oraz SOAP, a także specjalnego systemu o nazwie DRb (Distributed Ruby).
XMLRPC to lekki protokół umożliwiający zdalne wywoływanie procedur HTTP. Umożliwia on tworzenie prostych rozwiązań dla rozproszonych systemów informatycznych, w porównaniu do innych rozwiązań (np. SOAP czy COBRA).
Standardowy pakiet biblioteki Ruby „XMLRPC” pozwala na stworzenie serwera, który implementuje zdalne procedury oraz klienta, który je wywołuje.
DRb to biblioteka RPC tylko dla języka Ruby. Z zewnątrz nie różni się wiele od XML-RPC, jednakże jest on o wiele silniejszy. Jest zorientowany obiektowo, a połączenie z serwerem DRb dale klientowi instancję klasy znajdującej się na serwerze DRb. Następnie można użyć metod udostępnianych przez klasę, jakby były metodami lokalnymi.
SOAP jest to kolejny popularny protokół RPC, jednak jest on bardziej złożony. 
Socket to oprogramowanie umożliwiające nawiązywanie połączeń z innymi komputerami, które są połączone z Internetem. The Ruby Socket Library est standardową biblioteką dystrybuowaną z Ruby. Zapewnia grupę klas, które obsługują komunikację na poziomie socketów w Internecie.
Sockety mogą być użyte w technologii RPC, aby zapewnić komunikację z serwerem.
 
3)    Diagramy UML
 
4)    Testy oprogramowania
 
 
5)    Kody źródłowe oraz skrypty
 
6)    Analiza porównawcza
 
7)    Bibliografia:
[1] Introduction to Distributed Systems. Arpaci-Dusseau, Remzi H., Andrea C. (2014), Arpaci-Dusseau Books

[2] www.students.mimuw.edu.pl - Laboratorium Komputerowe Wydziału MIM UW (dostęp 06.06.2017 r.)

[3] www.ruby-doc.org – Pomoc i dokumentacja dla języka programowania Ruby (dostęp 06.06.2017 r.)

[4] Beginning Ruby: From Novice to Professional. Peter Cooper. (2007), Apress [strony 303-308]

[5] Ruby Programmin for Medicine and Biology. Jules J. Berman (2008), Jones and Bartlett Publishers [strona 55]

[6] Programowanie równoległe i rozproszone, praca zbiorowa pod redakcją Andrzeja Karbowskiego i Ewy Niewiadomskiej-Szynkiewicz, Oficyna wydawnicza Politechniki Warszawskiej, Warszawa 2009, ISBN 978-83-7207-803-2 [strony 242-261]
