//
//  main.swift
//  SwiftAlgorithms
//
//  Created by Khoa Le on 10/30/19.
//  Copyright © 2019 Khoa Le. All rights reserved.
//

import Foundation

public func printArray() {
    arrayTest()
}

public func printLinkedList() {
    let list = LinkedList<String>()
    list.append("Hello")
    list.append("World")
    list.append("!")
    list.append("and welcome")
    list.append("to swift")
    
    print("Initial list: \(list)")
    print("Initial Count: \(list.count)")
    
//    list.remove(node: list.first!)
//    list.removeLast()
//    list.removeAt(0)
    list.reverse()
    list.map { (s) in
        print(s.count)
    }
    print("List 2nd: \(list)")
    print("Count 2nd: \(list.count)")

}

public func printStack() {
    let stack = Stack<Character>()
    print(stack.isBalance("(("))
    print(stack.isBalance("()"))
    print(stack.isBalance("(]["))
    print(stack.isBalance("(){[}"))
    print(stack.isBalance("()[]{}"))
}

public func printQueueUsingArray() {
    var queue = QueueUsingArray<String>()
    queue.enqueue("Hi")
    queue.enqueue("Hello")
    queue.enqueue("Enqueue...")
    print(queue.count)
    print(queue)
    
    queue.dequeue()
    queue.dequeue()
    print(queue.isEmpty)
    print(queue.count)
    print(queue)
    
    var queue2 = QueueEfficiencyUsingArray<String>()
    queue2.enqueue("hihihihiih")
    queue2.enqueue("hohohohoho")
    queue2.enqueue("Khoa")
    print(queue2)
    
    queue2.dequeue()
    print(queue2)
}

public func printQueueUsingList() {
    var queue = QueueUsingLinkedList<Int>()
    queue.enqueue(1)
    queue.enqueue(5)
    queue.enqueue(4)
    queue.enqueue(3)
    print(queue.isEmpty)
    print(queue.count)
    print(queue)
    
    queue.dequeue()
    queue.dequeue()
    print(queue)
}

//printLinkedList()
//printStack()
printQueueUsingArray()
//printQueueUsingList()
