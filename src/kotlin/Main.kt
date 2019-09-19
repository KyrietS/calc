
import java.io.BufferedReader
import java.io.FileReader
import kotlin.system.exitProcess
import java_cup.runtime.ComplexSymbolFactory;


fun main(args: Array<String>) {
    if (args.isEmpty()) {
        println("Nie podano ścieżki do pliku źródłowego.")
        exitProcess(-1)
    }

    val reader = BufferedReader(FileReader(args[0]))
    val lexer = Lexer(reader)

    val symbolFactory = ComplexSymbolFactory()
    val parser = Parser(lexer, symbolFactory)
    val equation = parser.parse().value as Equation
    println("Result: ${equation.value}")
}