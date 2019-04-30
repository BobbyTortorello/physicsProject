//
//  MomentumViewController.swift
//  Physics Project
//
//  Created by Bobby Tortorello on 4/26/19.
//  Copyright © 2019 Baller Inc. All rights reserved.
//

import UIKit

class MomentumViewController: UIViewController {
    
    @IBOutlet weak var explosiveLabel: UILabel!
    @IBOutlet weak var inelasticLabel: UILabel!
    @IBOutlet weak var elasticLabel: UILabel!
    
    @IBOutlet weak var firstVaribleTextField: UITextField!
    @IBOutlet weak var secondVariableTextField: UITextField!
    @IBOutlet weak var thirdVariableTextField: UITextField!
    @IBOutlet weak var fourthVariableTextField: UITextField!
    
    @IBOutlet weak var answerLabel: UILabel!
    
    @IBOutlet weak var explosiveButton: UIButton!
    @IBOutlet weak var inelasticButton: UIButton!
    @IBOutlet weak var elasticButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = "Momentum"
        
        firstVaribleTextField.isHidden = true
        secondVariableTextField.isHidden = true
        thirdVariableTextField.isHidden = true
        fourthVariableTextField.isHidden = true
        answerLabel.isHidden = true
    }
    
    @IBAction func explosiveButtonAct(_ sender: UIButton) {
        inelasticLabel.isHidden = true
        elasticLabel.isHidden = true
        
        firstVaribleTextField.isHidden = false
        secondVariableTextField.isHidden = false
        thirdVariableTextField.isHidden = false
        fourthVariableTextField.isHidden = false
        answerLabel.isHidden = false
        
        firstVaribleTextField.text = ""
        secondVariableTextField.text = ""
        thirdVariableTextField.text = ""
        fourthVariableTextField.text = ""
        
        firstVaribleTextField.placeholder = "Mass One"
        secondVariableTextField.placeholder = "Mass Two"
        thirdVariableTextField.placeholder = "Velocity One"
        fourthVariableTextField.placeholder = "Velocity Two"
    }
    
    @IBAction func inelasticButtonAct(_ sender: UIButton) {
        explosiveLabel.isHidden = true
        elasticLabel.isHidden = true
        
        firstVaribleTextField.isHidden = false
        secondVariableTextField.isHidden = false
        thirdVariableTextField.isHidden = false
        fourthVariableTextField.isHidden = false
        answerLabel.isHidden = false
        
        firstVaribleTextField.text = ""
        secondVariableTextField.text = ""
        thirdVariableTextField.text = ""
        fourthVariableTextField.text = ""
        
        firstVaribleTextField.placeholder = "Mass One"
        secondVariableTextField.placeholder = "Mass Two"
        thirdVariableTextField.placeholder = "Velocity One"
        fourthVariableTextField.placeholder = "Velocity Two"
    }
    
    @IBAction func elasticButtonAct(_ sender: UIButton) {
        explosiveLabel.isHidden = true
        inelasticLabel.isHidden = true
        
        firstVaribleTextField.isHidden = false
        secondVariableTextField.isHidden = false
        thirdVariableTextField.isHidden = false
        fourthVariableTextField.isHidden = false
        answerLabel.isHidden = false
        
        firstVaribleTextField.text = ""
        secondVariableTextField.text = ""
        thirdVariableTextField.text = ""
        fourthVariableTextField.text = ""
        
        firstVaribleTextField.placeholder = "Mass One"
        secondVariableTextField.placeholder = "Mass Two"
        thirdVariableTextField.placeholder = "Velocity One"
        fourthVariableTextField.placeholder = "Velocity Two"

    }
    
    @IBAction func calculateButton(_ sender: UIButton) {
        explosiveLabel.isHidden = false
        inelasticLabel.isHidden = false
        elasticLabel.isHidden = false
        
        firstVaribleTextField.isHidden = true
        secondVariableTextField.isHidden = true
        thirdVariableTextField.isHidden = true
        fourthVariableTextField.isHidden = true
        
        let answer = findAnswer(firstVar: firstVaribleTextField.text!, secondVar: secondVariableTextField.text!, thirdVar: thirdVariableTextField.text!, fourthVar: fourthVariableTextField.text!)
        
        answerLabel.text = "The answer is \(String(answer))"
    }
    
    func findAnswer(firstVar: String, secondVar: String, thirdVar: String, fourthVar: String) -> Double {
        var finalAnswer = Double()
        if explosiveButton.isHidden == false {
            let massOne = firstVaribleTextField.text!
            let massTwo = secondVariableTextField.text!
            let velocityOne = thirdVariableTextField.text!
            let velocityTwo = fourthVariableTextField.text!
            let negative = -1.0
            if velocityOne == "" {
                let secondObject = Double(massTwo)! * Double(velocityTwo)!
                let negativeObject = secondObject * negative
                let finalVeloctiy = negativeObject / Double(massOne)!
                finalAnswer = finalVeloctiy
            }
            if velocityTwo == "" {
                let firstObject = Double(massOne)! * Double(velocityOne)!
                let negativeObject = firstObject * negative
                let finalVelocity = negativeObject / Double(massTwo)!
                finalAnswer = finalVelocity
            }
        }
        
        if inelasticButton.isHidden == false {
            let massO = firstVaribleTextField.text!
            let massT = secondVariableTextField.text!
            let velocityO = thirdVariableTextField.text!
            let velocityT = fourthVariableTextField.text!
            var finalVelocity = Double()
            var momentumI = Double()

            let firstObject = Double(massO)! * Double(velocityO)!
            let secondObject = Double(massT)! * Double(velocityT)!
            momentumI = firstObject + secondObject

            let finalMass = Double(massO)! + Double(massT)!
            finalVelocity = momentumI / finalMass

            finalAnswer = finalVelocity
        }
        
        if elasticButton.isHidden == false {
            
        }
        return finalAnswer
    }
}
