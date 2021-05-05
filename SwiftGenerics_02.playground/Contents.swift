import UIKit

// MARK: - Задача 2

/// Протокол Контейнера
protocol ContainerProtocol {
    
    /// Ассоциативный тип
    associatedtype Item

    /// Количество элементов в контейнере
    var count: Int { get }
    
    /// Добавление элемента в контейнер
    /// - Parameter item: добавляемый элемент
    mutating func append(_ item: Item)
    
    /// Полечение элемента по индексу из контейнера
    subscript(i: Int) -> Item? { get }
}

/// Элемент последовательности
class Node<T> {
    var value: T
    var next: Node?
    
    init(value: T, next: Node?) {
        self.value = value
        self.next = next
    }
}

/// Связанный список
struct LinkedList<T> {
    var head: Node<T>
}

//MARK: - Container
extension LinkedList: ContainerProtocol {
    var count: Int {
        var counter = 1
        var node: Node? = head

        while node?.next != nil {
            counter += 1
            node = node?.next
        }
        
        return counter
    }
    
    func append(_ item: Node<T>) {
        
        var node: Node? = head
        
        while node?.next != nil {
            node = node?.next
        }
        
        node?.next = item
    }
    
    subscript(i: Int) -> Item? {
        
        if i == 0 { return head }
        
        var counter = 0
        var node: Node? = head
        var searchNode: Node<T>?

        while node?.next != nil {
            counter += 1
            node = node?.next
            
            if counter == i {
                searchNode = node
                break
            }
        }
    
        return searchNode 
    }
}

let myList = LinkedList(head: Node(value: 0, next: nil))
myList.count
myList[0]

myList.append(Node(value: 1, next: nil))
myList.count
myList[1]

/// Очередь
struct Queue<T> {
    private var elements: [T] = []
    
    mutating func push(_ element: T) {
        elements.append(element)
    }
    
    mutating func pop() -> T {
        return elements.removeFirst()
    }
    
}

extension Queue: ContainerProtocol {
    typealias Item = T
    
    var count: Int {
        return elements.count
    }
    
    mutating func append(_ item: Item) {
        push(item)
    }
    
    subscript(i: Int) -> Item? {
        if elements.indices.contains(i) {
            return elements[i]
        } else {
            return nil
        }
    }
}

var myQueue = Queue<Int>()
myQueue.push(5)
myQueue.append(7)
myQueue.count
myQueue.pop()
myQueue.count
myQueue[0]
myQueue[5]
