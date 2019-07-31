//
//  ViewController.swift
//  colorGuessingGame
//
//  Created by Alexander George Legaspi on 7/30/19.
//  Copyright © 2019 Alexander George Legaspi. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    var counter = 0
    var highScore = 0

    @IBOutlet weak var showMeTheColor: UIImageView!
    @IBOutlet weak var winOrLose: UILabel!
    @IBOutlet weak var currentScore: UILabel!
    @IBOutlet weak var displayHighScore: UILabel!
    
    // persisting/saving the the color
    var colorToGuess: Color! {
        
        // updating the UI the link btwn M and VC
        didSet {
            self.showMeTheColor.backgroundColor = colorToGuess.toUIColor()
        }
    }
    
    @IBAction func guessColor(_ sender: UIButton) {
        
        // guard: make sure that we can make a user colortype if not fatal error
        guard let userGuessColorType = Color.ColorType(rawValue: sender.tag) else {
            fatalError("Unexpected color type number entered in the button tag")
        }
        print(colorToGuess!)
        print(userGuessColorType)
        
        if colorToGuess.isClosestTo(colorType: userGuessColorType) {
            self.winOrLose.text = "You Won"
            counter += 1
            
            if counter > highScore {
                highScore = counter
            }
            
        } else {
            self.winOrLose.text = "You Lost."
            counter = 0
        }
        
        
        
        displayHighScore.text = "High Score: \(highScore)"
        currentScore.text = "Current Score: \(counter)"
        
        updateColor()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // loads a color before the app fully loads
        updateColor()
    }
    func updateColor() {
        // updates a new color
        colorToGuess = Color.generateColor()
    }
}

