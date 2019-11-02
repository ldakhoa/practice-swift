//
//  QueueUsingLinkedList.swift
//  SwiftAlgorithms
//
//  Created by Khoa Le on 11/2/19.
//  Copyright © 2019 Khoa Le. All rights reserved.
//

import Foundation

public struct QueueUsingLinkedList<T> {
    fileprivate var list = LinkedList<T>()
    
    public var isEmpty: Bool {
        return list.isEmpty
    }
    
    public var count: Int {
        return list.count
    }
    
    public func peek() -> T? {
        return list.first?.value
    }
    
    public mutating func enqueue(_ element: T) {
        list.append(element)
    }
    
    public mutating func dequeue() -> T? {
        guard !list.isEmpty, let element = list.first else { return nil }
        list.remove(node: element)
        return element.value
    }
}

extension QueueUsingLinkedList: CustomStringConvertible {
    public var description: String {
        return list.description
    }
}
