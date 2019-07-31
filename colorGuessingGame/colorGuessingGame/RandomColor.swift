//  RandomColor.swift
//  colorGuessingGame

//  Created by Alexander George Legaspi on 7/30/19.
//  Copyright © 2019 Alexander George Legaspi. All rights reserved.

import Foundation
import UIKit

func randomFloat() -> CGFloat {
    return CGFloat.random(in: 0.0...1.0)
}

struct Color {
    var red: CGFloat
    var green: CGFloat
    var blue: CGFloat
    
    func changeColor() -> UIColor {
        return UIColor.init(red: self.red, green: self.green, blue: self.blue, alpha: 1.0)
    }
    
    static func generateColor() -> Color {
        return Color.init(red: randomFloat(), green: randomFloat(), blue: randomFloat())
    }
    
    func compareValues() -> Int {
        let rgbArray: [CGFloat] = [red,green,blue]
        
        for (x,y) in rgbArray.enumerated() {
            
            if y == rgbArray.max() {
                print("At the index: \(x)")
                print("Highest current value is \(y)")
                switch x {
                case 0:
                    return 1
                case 1:
                    return 2
                case 2:
                    return 3
                default:
                    return 0
                }
            }
            
        }
        return 0
    }
    
}




