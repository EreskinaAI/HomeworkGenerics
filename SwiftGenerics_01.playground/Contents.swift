import UIKit

// MARK: - Задача 1 "Сделать так, чтобы закомментированный код работал"


/// Тип, который можно складывать с помощью оператора +
protocol Addable {
    static func +(_ lhs: Self, _ rhs: Self) -> Self
}

//MARK: - Addable
extension Double: Addable {}

//MARK: - Addable
extension String: Addable {}

/// Метод который складывает два значения
/// - Parameters:
///   - a: первое значение
///   - b: второе значение
/// - Returns: результат сложения
func sumTwoValues<T : Addable >(_ a: T, _ b: T) -> T {
	let result = a + b
	return result
}

let a = 25.0
let b = 34.0

let resultDouble = sumTwoValues(a, b)
print(resultDouble)

let c = "ABC"
let d = "DEF"

let resultString = sumTwoValues(c, d)
print(resultString)
