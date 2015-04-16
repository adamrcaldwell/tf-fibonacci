//
//  FibonacciSequence.swift
//  FibonacciApp
//
//  Created by Adam Caldwell on 4/14/15.
//  Copyright (c) 2015 Adam Caldwell. All rights reserved.
//

import Foundation
import UIKit

class FibonacciSequence {
    
    let includesZero: Bool
    let values: [UInt]
    
    init(maxNumber: UInt, includesZero: Bool) {
        
        self.includesZero = includesZero
        
        var tempArray = [UInt]()
        
        var numOne:UInt = 0
        var numTwo:UInt = 1
        var (numSum:UInt, didOverflow:Bool) = (0, false)
        
        if !includesZero {
            numOne = 1
        }
        
        if !includesZero && maxNumber == 0 {
            self.values = []
        } else if includesZero == true && maxNumber == 0 {
            self.values = [0]
        } else {
            
            tempArray.append(numOne)
            tempArray.append(numTwo)
            
            while numSum <= maxNumber {
                
                (numSum, didOverflow) = UInt.addWithOverflow(numOne, numTwo)
                numOne = numTwo
                numTwo = numSum
                if didOverflow == true {
                    println("Overflow!")
                    break
                }
                tempArray.append(numSum)
            }
            
            self.values = tempArray
        }
    }
    
    init(numberOfItemsInSequence: UInt, includesZero: Bool) {
        
        self.includesZero = includesZero
        
        var tempArray = [UInt]()
        
        var numOne:UInt = 0
        var numTwo:UInt = 1
        var (numSum:UInt, didOverflow:Bool) = (0, false)
        
        if !includesZero {
            numOne = 1
        }
        
        if !includesZero && numberOfItemsInSequence == 0 {
            self.values = []
        } else if includesZero == true && numberOfItemsInSequence == 0 {
            self.values = [0]
        } else {
            
            tempArray.append(numOne)
            tempArray.append(numTwo)
            
            for var count:UInt = 2; count < numberOfItemsInSequence; ++count {
                (numSum, didOverflow) = UInt.addWithOverflow(numOne, numTwo)
                numOne = numTwo
                numTwo = numSum
                if didOverflow == true {
                    println("Overflow!")
                    break
                }
                tempArray.append(numSum)
            }
            
            self.values = tempArray
        }
    }
}