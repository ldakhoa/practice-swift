//
//  Queue.swift
//  SwiftAlgorithms
//
//  Created by Khoa Le on 11/1/19.
//  Copyright © 2019 Khoa Le. All rights reserved.
//

import Foundation

public struct QueueUsingArray<T> {
    fileprivate var array = [T]()
    fileprivate var head = 0
    
    public var isEmpty: Bool {
        return array.isEmpty
    }
    
    public var count: Int {
        return array.count
    }
    
    public mutating func enqueue(_ element: T) {
        array.append(element)
    }
    
    public mutating func dequeue() -> T? {
        return isEmpty ? nil : array.removeFirst()
    }
    
    public var front: T? {
        return array.first
    }
    
    
}

extension QueueUsingArray: CustomStringConvertible {
    public var description: String {
        return array.description
    }
}

// MARK: - Dequeue efficiency

public struct QueueEfficiencyUsingArray<T> {
    fileprivate var array = [T?]()
    fileprivate var head = 0
    
    public var isEmpty: Bool {
        return count == 0
    }
    
    public var count: Int {
        return array.count - head
    }
    
    public mutating func enqueue(_ element: T) {
        array.append(element)
    }
    
    // To make dequeuing efficient, we can also reserve some extra free space but this time
    // at the front of the array. We must write this code ourselves because the built-in
    // Swift array does not support it.
    // O(1) operation
    public mutating func dequeue() -> T? {
        guard head < array.count, let element = array[head] else { return nil }
        
        array[head] = nil
        head += 1
        
        let percentage = Double(head) / Double(array.count)
        
        //This calculates the percentage of empty spots at the beginning as a ratio of the
        // total array size. If more than 25% of the array is unused, we chop off that
        // wasted space. However, if the array is small we do not resize it all the time, so
        // there must be at least 50 elements in the array before we try to trim it.
        if array.count > 50 && percentage > 0.25 {
            // To test behavior
            // replace if array.count > 50 && percentage > 0.25
            // with if head > 2
            array.removeFirst(head)
            head = 0
        }
        return element
    }
    
    public var front: T? {
        
        return isEmpty ? nil : array[head]
    }
}

extension QueueEfficiencyUsingArray: CustomStringConvertible {
    public var description: String {
        return array.description
    }
}
