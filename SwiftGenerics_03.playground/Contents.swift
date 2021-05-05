import UIKit

// MARK: - Задача 3*. К выполнению необязательна. 

/// Связанный список
struct LinkedList<T> {
    var head: LinkedListNode<T>
    
    /// Количество элементов в списке
    var count: Int {
        self.reduce(0) { (total, number) in total + 1 }
    }
    
    init(head: LinkedListNode<T>) {
        self.head = head
    }
    
    /// Добавление нового элемента в список
    /// - Parameter item: новый элемент
    mutating func append(_ item: T) {
        var newNode: LinkedListNode<T> = .value(element: item, next: .end)
        
        for var element in self.reversed() {
            element.editNext(newNode)
            newNode = element
        }
        
        head = newNode
    }
    
    ///Получение элемента по индексу
    subscript (_ i: Int) -> LinkedListNode<T>? {
        for (index, element) in self.enumerated() {
            if index == i {
                return element
            }
        }
        return nil
    }
}

/// Элемент списка
indirect enum LinkedListNode<T> {
    case value(element: T, next: LinkedListNode<T>)
    case end
    
    mutating func editNext(_ newValue: LinkedListNode<T>) {
        switch self {
        case let .value(element, _):
            self = .value(element: element, next: newValue)
        case .end:
            print("Not edit")
        }
    }
}

//MARK: - Sequence
extension LinkedList: Sequence {
    func makeIterator() -> LinkedListIterator<T> {
        return LinkedListIterator(current: head)
    }
}

struct LinkedListIterator<T>: IteratorProtocol {
    var current: LinkedListNode<T>
    
    mutating func next() -> LinkedListNode<T>? {
        switch current {
        case let .value(_, next):
            let preItem = current
            current = next
            return preItem
        case .end: return nil
        }
    }
}

var list = LinkedList(head: LinkedListNode.value(element: "A", next: .end))
list.append("B")
list.append("C")

list.count
list.append("44")
list.count

print(list[0])
