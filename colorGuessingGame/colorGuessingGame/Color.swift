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
    
    func toUIColor() -> UIColor {
        return UIColor.init(red: self.red,
                            green: self.green,
                            blue: self.blue,
                            alpha: 1.0)
    }
    
    func isClosestTo(colorType: ColorType) -> Bool {
        return getDominantColorType() == colorType
    }
    
    static func generateColor() -> Color {
        var colorsArr = [CGFloat.random(in: 0.9...1.0),
                         CGFloat.random(in: 0.0...0.1),
                         CGFloat.random(in: 0.0...0.1)]
        colorsArr.shuffle()
        // Randomly ID dominant color
        // Assign it a value between .6 and 1
        // Assign values randomly between .0 and .4 to other colors
        
        return Color.init(red: colorsArr[0],
                          green: colorsArr[1],
                          blue: colorsArr[2])
    }
    
    enum ColorType: Int {
        case red = 1
        case green = 2
        case blue = 3
    }
    
    func getDominantColorType() -> ColorType {
        let colorType: ColorType
        let rgbArray: [CGFloat] = [red,green,blue]
        
        if red == rgbArray.max() {
            colorType = .red
        } else if green == rgbArray.max() {
            colorType = .green
        } else {
            colorType = .blue
        }
        return colorType
    }
}

