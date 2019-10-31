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
    
    

//    list.insert("swift", atIndex: 1)
    
    
    
//    print(list.nodeAt(0).value)
//    print(list[1])
//    print(list.isEmpty, list.first!.value, list.last!.value)

}

printLinkedList()
