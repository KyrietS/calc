class Equation(private val expression: Expression) {
    val value: Int
        get() = expression.value
}