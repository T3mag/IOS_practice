import UIKit

var home = hw1()

print(home.fibonacci(n: 1))

protocol HomeworkService {
    // Функция деления с остатком, должна вернуть в первой части результат деления, во второй части остаток.
    func divideWithRemainder(_ x: Int, by y: Int) -> (Int, Int)

    // Функция должна вернуть числа фибоначчи.
    func fibonacci(n: Int) -> [Int]

    // Функция должна выполнить сортировку пузырьком.
    func sort(rawArray: [Int]) -> [Int]

    // Функция должна преобразовать массив строк в массив первых символов строки.
    func firstLetter(strings: [String]) -> [Character]

    // Функция должна отфильтровать массив по условию, которое приходит в параметре `condition`. (Нельзя юзать `filter` у `Array`)
    func filter(array: [Int], condition: ((Int) -> Bool)) -> [Int]
}

struct hw1: HomeworkService {
    func divideWithRemainder(_ x: Int, by y: Int) -> (Int, Int)
    {
        let result = x/y
        let remainder = x % y
        return (result,remainder)
    }
    
    func fibonacci(n: Int) -> [Int]
    {
        var fib = [0, 1]
        guard n > 2 else
        {
            return Array(fib.prefix(n))
        }
        
        for _ in 2..<n
        {
            let nextNumber = fib[fib.count - 1] + fib[fib.count - 2]
            fib.append(nextNumber)
        }
        return fib
    }
    
    func sort(rawArray: [Int]) -> [Int]
    {
        var array = rawArray
        for i in 0..<array.count
        {
            for j in 0..<array.count - i - 1
            {
                if array[j] > array[j + 1]
                {
                    array.swapAt(j, j + 1)
                }
            }
        }
        return array
    }
    
    func firstLetter(strings: [String]) -> [Character]
    {
        var firstsElements: [Character] = []
        for string in strings
        {
            if let first = string.first
            {
                firstsElements.append(first)
            }
        }
        return firstsElements
    }
    
    func filter(array: [Int], condition: ((Int) -> Bool)) -> [Int]
    {
        var filtered: [Int] = []
        for el in array
        {
            if(condition(el))
            {
                filtered.append(el)
            }
        }
        return filtered
    }
}
