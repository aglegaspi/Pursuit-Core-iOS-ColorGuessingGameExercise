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
    
    @IBOutlet weak var showMeTheColor: UIImageView!
    @IBOutlet weak var winOrLose: UILabel!
    
    @IBAction func guessColor(_ sender: UIButton) {
        let selection = Color.generateColor().compareValues()
        
        self.showMeTheColor.backgroundColor = Color.generateColor().changeColor()
        
        if sender.tag == selection {
            self.winOrLose.text = "You Won"
            counter += 1
            
        } else {
            self.winOrLose.text = "You Lost."
            counter = 0
            //Game.resetGame()
        }
        
        self.currentScore.text = "Current Score: \(counter)"
    }
    

    @IBOutlet weak var currentScore: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // loads a color before the app fully loads
        self.showMeTheColor.backgroundColor = Color.generateColor().changeColor()
        
    
    }


}

