//
//  WorkAndEnergyViewController.swift
//  Physics Project
//
//  Created by Bobby Tortorello on 4/29/19.
//  Copyright © 2019 Baller Inc. All rights reserved.
//

import UIKit

class WorkAndEnergyViewController: UIViewController {
    @IBOutlet weak var workLabel: UILabel!
    @IBOutlet weak var kineticEnergyLabel: UILabel!
    @IBOutlet weak var potentialEnergyLabel: UILabel!
    @IBOutlet weak var totalEnergyLabel: UILabel!
    
    @IBOutlet weak var firstVariableTextField: UITextField!
    @IBOutlet weak var secondVariableTextField: UITextField!
    @IBOutlet weak var thirdVariableTextField: UITextField!
    
    @IBOutlet weak var answerLabel: UILabel!
    
    @IBOutlet weak var workButton: UIButton!
    @IBOutlet weak var kineticEnergyButton: UIButton!
    @IBOutlet weak var potentialEnergyButton: UIButton!
    @IBOutlet weak var totalEnergyButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        firstVariableTextField.isHidden = true
        secondVariableTextField.isHidden = true
        thirdVariableTextField.isHidden = true
        answerLabel.isHidden = true
        
        self.title = "Work and Energy"
    }
    
    @IBAction func workBut(_ sender: UIButton) {
        kineticEnergyLabel.isHidden = true
        potentialEnergyLabel.isHidden = true
        totalEnergyLabel.isHidden = true
        
        firstVariableTextField.isHidden = false
        secondVariableTextField.isHidden = false
        thirdVariableTextField.isHidden = false
        
        answerLabel.isHidden = false
        
        firstVariableTextField.text = ""
        secondVariableTextField.text = ""
        thirdVariableTextField.text = ""
        
        firstVariableTextField.placeholder = "Work"
        secondVariableTextField.placeholder = "Force"
        thirdVariableTextField.placeholder = "Distance"
    }
    
    @IBAction func kineticEnergyBut(_ sender: UIButton) {
        workLabel.isHidden = true
        potentialEnergyLabel.isHidden = true
        totalEnergyLabel.isHidden = true
        
        firstVariableTextField.isHidden = false
        secondVariableTextField.isHidden = false
        thirdVariableTextField.isHidden = false
        
        answerLabel.isHidden = false
        
        firstVariableTextField.text = ""
        secondVariableTextField.text = ""
        thirdVariableTextField.text = ""
        
        firstVariableTextField.placeholder = "Kinetic Energy"
        secondVariableTextField.placeholder = "Mass"
        thirdVariableTextField.placeholder = "Velocity"
    }
    
    @IBAction func potentialEnergyBut(_ sender: UIButton) {
        workLabel.isHidden = true
        kineticEnergyLabel.isHidden = true
        totalEnergyLabel.isHidden = true
        
        firstVariableTextField.isHidden = false
        secondVariableTextField.isHidden = false
        thirdVariableTextField.isHidden = false
        
        answerLabel.isHidden = false
        
        firstVariableTextField.text = ""
        secondVariableTextField.text = ""
        thirdVariableTextField.text = ""
        
        firstVariableTextField.placeholder = "Potential Energy"
        secondVariableTextField.placeholder = "Mass"
        thirdVariableTextField.placeholder = "Height"
    }
    
    @IBAction func totalEnergyBut(_ sender: UIButton) {
        workLabel.isHidden = true
        kineticEnergyLabel.isHidden = true
        potentialEnergyLabel.isHidden = true
        
        firstVariableTextField.isHidden = false
        secondVariableTextField.isHidden = false
        thirdVariableTextField.isHidden = false
        
        answerLabel.isHidden = false
        
        firstVariableTextField.text = ""
        secondVariableTextField.text = ""
        thirdVariableTextField.text = ""
        
        firstVariableTextField.placeholder = "Total Energy"
        secondVariableTextField.placeholder = "Kinetic Energy"
        thirdVariableTextField.placeholder = "Potential Energy"
    }
    
    @IBAction func calculateButton(_ sender: UIButton) {
        firstVariableTextField.isHidden = true
        secondVariableTextField.isHidden = true
        thirdVariableTextField.isHidden = true
        
        workLabel.isHidden = false
        kineticEnergyLabel.isHidden = false
        potentialEnergyLabel.isHidden = false
        totalEnergyLabel.isHidden = false
        
        let answer = findAnswer(firstVar: firstVariableTextField.text!, secondVar: secondVariableTextField.text!, thirdVar: thirdVariableTextField.text!)
        
        answerLabel.text = "The missing variable is \(String(answer))"
        
        self.resignFirstResponder()
    }
    
    func findAnswer(firstVar: String, secondVar: String, thirdVar: String) -> Double {
        var finalAnswer = Double()
        
        if workButton.isHidden == false {
            let work = firstVariableTextField.text!
            let force = secondVariableTextField.text!
            let distance = thirdVariableTextField.text!
            
            if  work == "" {
                let answer = Double(force)! * Double(distance)!
                finalAnswer = answer
            }
            
            if force == "" {
                let answer = Double(work)! / Double(distance)!
                finalAnswer = answer
            }
            
            if distance == "" {
                let answer = Double(work)! / Double (force)!
                finalAnswer = answer
            }
        }
        
        if kineticEnergyButton.isHidden == false {
            let kineticEnergy = firstVariableTextField.text!
            let mass = secondVariableTextField.text!
            let velocity = thirdVariableTextField.text!
            
            if kineticEnergy == "" {
                let vSquared = Double(velocity)! * Double(velocity)!
                let answer = 0.5 * Double(mass)! * vSquared
                finalAnswer = answer
            }
            
            if velocity == "" {
                let halfKinetic = Double(kineticEnergy)! / 0.5
                let kineticMass = halfKinetic / Double(mass)!
                let answer = sqrt(kineticMass)
                finalAnswer = answer
            }
        }
        
        if potentialEnergyButton.isHidden == false {
            let potentialEnergy = firstVariableTextField.text!
            let mass = secondVariableTextField.text!
            let height = thirdVariableTextField.text!
            let gravity = 9.8
            
            if potentialEnergy == "" {
                let answer = Double(mass)! * gravity * Double(height)!
                finalAnswer = answer
            }
        }
        
        if totalEnergyButton.isHidden == false {
            let totalEnergy = firstVariableTextField.text!
            let kineticEnergy = secondVariableTextField.text!
            let potentialEnergy = thirdVariableTextField.text!
            
            if totalEnergy == "" {
                let answer = Double(kineticEnergy)! + Double(potentialEnergy)!
                finalAnswer = answer
            }
            
            if kineticEnergy == "" {
                let answer =  Double(totalEnergy)! - Double(potentialEnergy)!
                finalAnswer = answer
            }
        }
        return finalAnswer
    }
}
