//
//  ViewController.swift
//  Calculator
//
//  Created by Рамазан Юсупов on 2/20/21.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet var displayLabel: UILabel!
    
    private var isFinishTyping:Bool = true
    
    // creating new computed property
    var displayValue:Double{
        get{
            guard let number = Double(displayLabel.text!) else {fatalError("Error in converting to double")}
            return number
        }
        set{
            displayLabel.text = String(newValue)
        }
    }
    // creating new object from CalculatorBrain
    var calculator = calculatorBrain()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    
    @IBAction func calculationMethods(_ sender: UIButton) {
        isFinishTyping = true
        calculator.setNumber(displayValue)
        if let symbol = sender.currentTitle{
            if let result = calculator.calculate(symbol: symbol){
                displayValue = result
            }
        }
    }
    
    @IBAction func numberPressed(_ sender: UIButton) {
        if let number = sender.currentTitle{
            if isFinishTyping {
                displayLabel.text = number
                isFinishTyping = false
            }else{
                if number == "."{
                    let isInt = floor(displayValue) == displayValue
                    if !isInt{
                        return
                    }
                };displayLabel.text?.append(number)
            }
        }
    }
}

