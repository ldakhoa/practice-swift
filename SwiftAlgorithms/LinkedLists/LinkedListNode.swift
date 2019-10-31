//
//  Node.swift
//  SwiftAlgorithms
//
//  Created by Khoa Le on 10/30/19.
//  Copyright © 2019 Khoa Le. All rights reserved.
//

import Foundation

public class LinkedListNode<T> {
    var value: T
    var next: LinkedListNode?
    weak var previous: LinkedListNode?
    
    public init(value: T) {
        self.value = value
    }
}
