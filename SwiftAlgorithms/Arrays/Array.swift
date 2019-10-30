//
//  Array.swift
//  SwiftAlgorithms
//
//  Created by Khoa Le on 10/30/19.
//  Copyright © 2019 Khoa Le. All rights reserved.
//

import Foundation

var array = [3, 2, 4, 6, 10]

func arrayTest() {
    array.removeLast()
    array.append(9)
    
    print(array)
    print("Index of 4: \(array[4])")
    
    array.remove(at: 4)
    print("Remove index 4: \(array)")
    
    array.reverse()
    print("Reversed: \(array)")
    
    array.sort()
    print("Array after sort: \(array)")
}




