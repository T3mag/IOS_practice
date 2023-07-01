import UIKit

// Это первая часть домашки

//var home = hw1()
//
//print(home.fibonacci(n: 1))
//
//protocol HomeworkService {
//    // Функция деления с остатком, должна вернуть в первой части результат деления, во второй части остаток.
//    func divideWithRemainder(_ x: Int, by y: Int) -> (Int, Int)
//
//    // Функция должна вернуть числа фибоначчи.
//    func fibonacci(n: Int) -> [Int]
//
//    // Функция должна выполнить сортировку пузырьком.
//    func sort(rawArray: [Int]) -> [Int]
//
//    // Функция должна преобразовать массив строк в массив первых символов строки.
//    func firstLetter(strings: [String]) -> [Character]
//
//    // Функция должна отфильтровать массив по условию, которое приходит в параметре `condition`. (Нельзя юзать `filter` у `Array`)
//    func filter(array: [Int], condition: ((Int) -> Bool)) -> [Int]
//}
//
//struct hw1: HomeworkService {
//    func divideWithRemainder(_ x: Int, by y: Int) -> (Int, Int)
//    {
//        let result = x/y
//        let remainder = x % y
//        return (result,remainder)
//    }
//
//    func fibonacci(n: Int) -> [Int]
//    {
//        var fib = [0, 1]
//        guard n > 2 else
//        {
//            return Array(fib.prefix(n))
//        }
//
//        for _ in 2..<n
//        {
//            let nextNumber = fib[fib.count - 1] + fib[fib.count - 2]
//            fib.append(nextNumber)
//        }
//        return fib
//    }
//
//    func sort(rawArray: [Int]) -> [Int]
//    {
//        var array = rawArray
//        for i in 0..<array.count
//        {
//            for j in 0..<array.count - i - 1
//            {
//                if array[j] > array[j + 1]
//                {
//                    array.swapAt(j, j + 1)
//                }
//            }
//        }
//        return array
//    }
//
//    func firstLetter(strings: [String]) -> [Character]
//    {
//        var firstsElements: [Character] = []
//        for string in strings
//        {
//            if let first = string.first
//            {
//                firstsElements.append(first)
//            }
//        }
//        return firstsElements
//    }
//
//    func filter(array: [Int], condition: ((Int) -> Bool)) -> [Int]
//    {
//        var filtered: [Int] = []
//        for el in array
//        {
//            if(condition(el))
//            {
//                filtered.append(el)
//            }
//        }
//        return filtered
//    }
//}

// Это вторая часть домашки

protocol User
{
    func Take(item: LibraryItem)
    func Return(item: LibraryItem)
}

struct Author
{
    let name: String
}

struct Number
{
    let number: Int
}

class LibraryItem
{
    var name: String
    private(set) var availability: Bool
    
    init(n: String){
        name = n
        availability = true
    }
    
    func Takeitem(){
        guard availability else{
            print("\(name) уже был взят.")
            return
        }
        
        availability = false
        print("Вы взяли \(name). Приятного пользования!")
    }
    
    func Returnitem(){
        guard !availability else
        {
            print("Вы не можете вернуть то, что и так есть")
            return
        }
        
        availability = true
        print("\(name) успешно вовращен в родные края!")
    }
}

class Book: LibraryItem
{
    var author: Author
    var genre: Genre
    
    init(name: String, author: Author, genre: Genre)
    {
        self.author = author
        self.genre = genre
        super.init(n: name)
    }
    
    override func Takeitem()
    {
        super.Takeitem()
        print("Автор: \(author)")
    }
    
}

class Magazine: LibraryItem
{
    var number: Number
    var category: Category
    
    init(name: String, number: Number, category: Category)
    {
        self.number = number
        self.category = category
        super.init(n: name)
    }
    
    override func Takeitem()
    {
        super.Takeitem()
        print("Номер: \(number)")
    }
}

class Film: LibraryItem
{
    var durationInMinutes: Int
    
    init(name: String, durationInMinutes: Int) {
        self.durationInMinutes = durationInMinutes
        super.init(n: name)
    }
    
    override func Takeitem()
    {
        super.Takeitem()
        print("Длительность: \(durationInMinutes)")
    }
}

class People: User
{
    var fio: String
    private(set) var ListOfLibraryObjects: [LibraryItem]
    
    init(fio: String)
    {
        self.fio = fio
        ListOfLibraryObjects = []
    }
    
    func Take(item: LibraryItem)
    {
        guard !ListOfLibraryObjects.contains(where: {$0.name == item.name}) else
        {
            print("Ты уже взял это")
            return
        }

        guard item.availability else
        {
            print("Увы, \(item.name) уже взяли")
            return
        }

        item.Takeitem()
        ListOfLibraryObjects.append(item)
    }
    
    func Return(item: LibraryItem)
    {
        guard ListOfLibraryObjects.contains(where: {$0.name == item.name}) else
        {
            print("Ты не можешь вернуть то, чего нет")
            return
        }
        
        guard !item.availability else
        {
            print("Кто уже вернул то, что взял")
            return
        }
        
        item.Returnitem()
        
        for i in 0..<ListOfLibraryObjects.count
        {
            if(ListOfLibraryObjects[i].name == item.name)
            {
                ListOfLibraryObjects.remove(at: i)
            }
        }
    }

}

enum Genre
{
    case love
    case scary
    case comedy
    case Scientific
}

enum Category
{
    case fashion
    case sports
    case Culinary
}

