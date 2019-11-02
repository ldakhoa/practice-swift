//
//  Stack.swift
//  SwiftAlgorithms
//
//  Created by Khoa Le on 10/31/19.
//  Copyright © 2019 Khoa Le. All rights reserved.
//

import Foundation

public struct Stack<T> {
    fileprivate var array = [T]()
    
    public var isEmpty: Bool {
        return array.isEmpty
    }
    
    public var count: Int {
        return array.count
    }
    
    public mutating func push(_ element: T) {
        array.append(element)
    }
    
    public mutating func pop() -> T? {
        return array.popLast()
    }
    
    public var top: T? {
        return array.last
    }
    
}

// MARK: - Algorithms - check parentheses

extension Stack {
    public func isBalance(_ str: String) -> Bool {
        var stack = Stack<Character>()
        let rule = Array("()[]{}")
//        var stack = Stack()
        for (_, char) in str.enumerated() {
            if rule.firstIndex(of: char)! % 2 == 0 { // open brackets
                stack.push(char)
            } else {
                if stack.isEmpty {
                    return false
                } else {
                    if rule.firstIndex(of: char)! - rule.lastIndex(of: stack.top!)! == 1 {
                        stack.pop()
                    } else {
                        return false
                    }
                }
            }
        }
        
        return stack.isEmpty
    }
}
