//
//  LinkedList.swift
//  SwiftAlgorithms
//
//  Created by Khoa Le on 10/30/19.
//  Copyright © 2019 Khoa Le. All rights reserved.
//

import Foundation

public final class LinkedList<T> {
    public typealias Node = LinkedListNode<T>
    
    private(set) var head: Node?
    
    public var isEmpty: Bool {
        return head == nil
    }
    
    public var first: Node? {
        return head
    }
    
    public var last: Node? {
        guard var node = head else { return nil }
        while let next = node.next {
            node = next
        }
        return node
    }
    
    public var count: Int {
        guard var node = head else { return 0 }
        var count = 1
        while let next = node.next {
            node = next
            count += 1
        }
        return count
    }
}

// MARK: - Append, Insert, etc...

extension LinkedList {
    public func append(_ value: T) {
        let newNode = Node(value: value)
        
        if let lastNode = last {
            newNode.previous = lastNode
            lastNode.next = newNode
        } else {
            head = newNode
        }
    }
    
    public func nodeAt(_ index: Int) -> Node {
        if index == 0 {
            return head!
        } else {
            var node = head!.next
            for _ in 1..<index {
                node = node?.next
                if node == nil {
                    break
                }
            }
            return node!
        }
    }
    
    public func insert(_ node: Node, atIndex index: Int) {
        let newNode = node
        if index == 0 {
            newNode.next = head
            head?.previous = newNode
            head = newNode
        } else {
            let prev = self.nodeAt(index - 1)
            let next = prev.next
            
            newNode.previous = prev
            newNode.next = prev.next
            prev.next = newNode
            next?.previous = newNode
        }
    }
}

// MARK: - Delete

extension LinkedList {
    public func remove(node: Node) -> T {
        let prev = node.previous
        let next = node.next
        
        if let prev = prev {
            prev.next = next
        } else {
            head = next
        }
        
        next?.previous = prev
        
        node.previous = nil
        node.next = nil
        
        return node.value
    }
    
    public func removeLast() -> T {
        assert(!isEmpty, "is empty!")
        return remove(node: last!)
    }
    
    public func removeAt(_ index: Int) -> T {
        let node = nodeAt(index)
        assert(node != nil)
        return remove(node: node)
    }
}

// MARK: - Reverse

extension LinkedList {
    public func reverse() {
        var node = head 
        while let currentNode = node {
            node = currentNode.next
            swap(&currentNode.next, &currentNode.previous)
            head = currentNode
        }
    }

}

// MARK: - Use map and filter with linked list

extension LinkedList {
    public func map<U>(transform: (T) -> U) -> LinkedList<U> {
        let result = LinkedList<U>()
        var node = head
        while node != nil {
            result.append(transform(node!.value))
            node = node?.next
        }
        
        return result
    }
}

// MARK: - Custom subscript

extension LinkedList {
    public subscript(index: Int) -> T {
        let node = nodeAt(index)
        return node.value
    }
}

// MARK: - Custom string to print

extension LinkedList: CustomStringConvertible {
    public var description: String {
        var text = "["
        var node = head
        
        while node != nil {
            text += "\(node!.value)"
            node = node!.next
            if node != nil {
                text += ", "
            }
        }
        return text + "]"
    }
}
