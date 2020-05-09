//
//  ViewController.swift
//  EggTimer
//
//  Created by Angela Yu on 08/07/2019.
//  Copyright © 2019 The App Brewery. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet weak var progressBar: UIProgressView!
    let eggTimes = ["Soft" : 300.0, "Medium" : 480.0, "Hard" : 720.0]
    var counter = 0.0 //make float, correct math
    var hardness = "not selected"
    

    //when click on an egg
    @IBAction func hardnessSelected(_ sender: UIButton) {
        hardness = sender.currentTitle!
        print("Egg Timer")
        print(hardness)
        //update variable for our timer function definition
        counter = eggTimes[hardness]!
        
        //click -> initiates timer
        // second intervals
        Timer.scheduledTimer(timeInterval: 1.0, target: self, selector: #selector(updateCounter), userInfo: nil, repeats: true)
        
        //***CONTINUE HERE***
        //math formula correct
        // why printing my float as 0.0? / rounding?
    }
    
    //timer defined
    @objc func updateCounter() {
        let totalCookTime = eggTimes[hardness]!
        if counter > 0 {
            print(counter)//, totalCookTime, //counter/totalCookTime)
        counter -= 1
        
        //progress bar
        progressBar.progress = 1-(Float(counter/totalCookTime))
            // remove 1- to count down backwards
        //progressBar.progress = 0.5
            
        //bonus: print countdown to screen
        PrintTime.text = "Time Remaining: " + String(counter)
        }
        
    }
    @IBOutlet weak var PrintTime: UITextField!
    
        
    
}
