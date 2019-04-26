import UIKit

class CircuitsViewController: UIViewController {
    //Different Equation Label Outlets
    @IBOutlet weak var firstEquationLabel: UILabel!
    @IBOutlet weak var secondEquationLabel: UILabel!
    
    //Different Varible Text Fields Outlets
    @IBOutlet weak var firstVaribleTextField: UITextField!
    @IBOutlet weak var secondVaribleTextField: UITextField!
    @IBOutlet weak var thirdVaribleTextField: UITextField!
    
    //Equation Buttons Outlets
    @IBOutlet weak var firstEquationBut: UIButton!
    @IBOutlet weak var secondEquationBut: UIButton!
    
    //Answer Label Outlet
    @IBOutlet weak var answerLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = "Circuits"
        
        firstVaribleTextField.isHidden = true
        secondVaribleTextField.isHidden = true
        thirdVaribleTextField.isHidden = true
        answerLabel.isHidden = true
        // Do any additional setup after loading the view.
    }
    
    @IBAction func firstEquationButton(_ sender: UIButton) {
        secondEquationLabel.isHidden = true
        firstVaribleTextField.isHidden = false
        secondVaribleTextField.isHidden = false
        thirdVaribleTextField.isHidden = false
        answerLabel.isHidden = false
        
        firstVaribleTextField.placeholder = "Voltage"
        secondVaribleTextField.placeholder = "Current"
        thirdVaribleTextField.placeholder = "Resistence"
    }
    
    @IBAction func secondEquationButton(_ sender: UIButton) {
        firstEquationLabel.isHidden = true
        firstVaribleTextField.isHidden = false
        secondVaribleTextField.isHidden = false
        thirdVaribleTextField.isHidden = false
        answerLabel.isHidden = false
        
        firstVaribleTextField.placeholder = "Power"
        secondVaribleTextField.placeholder = "Current"
        thirdVaribleTextField.placeholder = "Voltage"
    }
    
    @IBAction func calculateButton(_ sender: UIButton) {
        firstEquationLabel.isHidden = false
        secondEquationLabel.isHidden = false
        firstVaribleTextField.isHidden = true
        secondVaribleTextField.isHidden = true
        thirdVaribleTextField.isHidden = true
        
        let answer = findAnswer(firstVar: firstVaribleTextField.text!, secondVar: secondVaribleTextField.text!, thirdVar: thirdVaribleTextField.text!)
        
        answerLabel.text = String("The missing varible is \(answer)")
    }
    
    func findAnswer(firstVar: String, secondVar: String, thirdVar: String) -> Double {
        var finalAnswer = Double()
        if firstEquationBut.isHidden == false {
            let voltage = firstVaribleTextField.text!
            let current = secondVaribleTextField.text!
            let resistence = thirdVaribleTextField.text!
            
            if  voltage ==  "" {
                let finalVoltage = Double(current)! * Double(resistence)!
                finalAnswer = finalVoltage
                answerLabel.text = "Voltage = \(String(finalAnswer))"
            }
            
            if current == "" {
                let finalCurrent = Double(voltage)! / Double(resistence)!
                finalAnswer = finalCurrent
                answerLabel.text = "Current = \(String(finalAnswer))"
            }
            
            if resistence == "" {
                let finalResistence = Double(voltage)! / Double(current)!
                finalAnswer  = finalResistence
                answerLabel.text = "Resistence = \(String(finalAnswer))"
            }
        }
        if secondEquationBut.isHidden == false {
            let power = firstVaribleTextField.text!
            let current = secondVaribleTextField.text!
            let voltage = thirdVaribleTextField.text!
            
            if  power == "" {
                let finalPower = Double(current)! * Double(voltage)!
                finalAnswer = finalPower
                answerLabel.text = "Power = \(String(finalAnswer))"
            }
            
            if current == "" {
                let finalCurrent = Double(power)! / Double(voltage)!
                finalAnswer = finalCurrent
                answerLabel.text = "Current = \(String(finalAnswer))"
            }
            
            if  voltage ==  ""  {
                let finalVoltage = Double(power)! / Double(current)!
                finalAnswer = finalVoltage
                answerLabel.text = "Voltage = \(String(finalAnswer))"
            }
        }
        return finalAnswer
    }
}
