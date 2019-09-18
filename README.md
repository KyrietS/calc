# Prosty kalkulator

Kalkulator rozwiązuje równanie z pliku podanego jako pierwszy argument wywołania programu.

## Używane programy

* [JFlex](https://jflex.de/)
* [CUP](http://www2.cs.tum.edu/projects/cup/)
* [Kotlin Command Line Compiler](https://kotlinlang.org/docs/tutorials/command-line.html)

Z powodu tego, że określone wersje **Jflex'a** współpracują tylko z określonymi wesjami **CUP'a** oba programy zostały dołączone do projektu (katalog `build`)i przystosowane do działania razem. Można je ręcznie uruchomić poprzez dołączone skrypty `jflex` i `cup`.

## Przykładowa instalacja niezbędnych kompontentów w celu skompilowania projektu na Ubuntu
```
sudo apt update
sudo apt install default-jdk
sudo snap install --classic kotlin
```

## Uruchomienie

```
make build
./calc.sh test.in
```

## Wygenerowanie JAR i dodatkowe zależności

Wszystkie dodatkowe zależności niezbędne do uruchomienia kompilatora znajdują się w katalogu `lib` projektu.

Aby utworzyć pojedynczy plik JAR z kompilatorem należy zatem dołączyć wszystkie zależności z `bin` oraz `lib`.