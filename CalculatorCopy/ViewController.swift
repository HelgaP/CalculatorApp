//
//  ViewController.swift
//  CalculatorCopy
//
//  Created by Irina Perepelkina on 04.05.2021.
//  Copyright © 2021 Irina Perepelkina. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITextFieldDelegate {
    
    
    @IBOutlet weak var numerTextField: UITextField!
    @IBOutlet weak var answerField: UILabel!
    
    var numberInput1: Double?
    var numberInput2: Double?
    var operationChosen: Operations?
    
    enum Operations {
        case addition
        case subtraction
        case deletion
        case multiplication
    }
    
    
    @IBAction func clearFunction(_ sender: UIButton) {
        
        clearAll()
        answerField.text = "Answer"
        numerTextField.text = ""
    }
    
    
    @IBAction func additionFunction(_ sender: UIButton) {
        
        // read a value from textField when button is pressed in a var
        guard let input = getInput() else {return}
        // if this is the first input, store it in numberInput1 and choose the next operation
        // if this is not the first input, store in in numberInput2, make calculation based on previously chosen operation and update numberInput1 with this result
        operationExecution(input: input)
        operationChosen = .addition // set the next operation
    }
    
    @IBAction func subtractionFunction(_ sender: UIButton) {
        guard let input = getInput() else {return}
        operationExecution(input: input)
        operationChosen = .subtraction
  
    }
    
    
    @IBAction func multiplicationFunction(_ sender: Any) {
        guard let input = getInput() else {return}
        operationExecution(input: input)
        operationChosen = .multiplication

    }
    
    
    @IBAction func deletionFunction(_ sender: UIButton) {
        guard let input = getInput() else {return}
        operationExecution(input: input)
        operationChosen = .deletion
  
    }
    
    
    @IBAction func resultFunction(_ sender: UIButton) {
        guard let input = getInput() else {return}
        operationExecution(input: input)
        answerField.text! = String (numberInput1!)
        clearAll()
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    
    func getInput() -> Double? {
        if numerTextField.text != nil {
            guard var number = Double (numerTextField.text!) else {
                print("Invalid conversion string into double")
                return nil
            }
            numerTextField.text?.removeAll()
            return number
        }
        print("Nil input in numberTextField")
        return nil
    }
    
    func operationExecution (input: Double) {
        if numberInput1 == nil {
            numberInput1 = input
            print("numberInput1 is ", numberInput1)
        }
        else {
            numberInput2 = input
            print("numberInput2 is ", numberInput2)
            switch operationChosen {
                case .addition:
                    numberInput1 = numberInput1! + numberInput2!
                case .deletion:
                    numberInput1 = numberInput1! / numberInput2!
                case .multiplication:
                    numberInput1 = numberInput1! * numberInput2!
                case .subtraction:
                    numberInput1 = numberInput1! - numberInput2!
            default:
                numberInput1 = nil
            }
        }
    }
    
    func clearAll () {
        numberInput1 = nil
        numberInput2 = nil
    }
    
}

