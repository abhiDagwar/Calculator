//
//  ViewController.swift
//  Calculator
//
//  Created by Siya Dagwar on 26/04/22.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var resultLabel: UILabel!
    
    var leftSide: Double = 0
    var rightSide: Double = 0
    var resultSide: Double = 0
    var operatorVal: String = ""
    var appendedNumber: String = ""
    var plusMinus: String = "+"
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    @IBAction func numberKeyPadTapped(_ sender: UIButton) {
        let buttonTitle = sender.title(for: .normal)
        guard let buttonTitle = buttonTitle else {
            return
        }
        
        appendedNumber += buttonTitle
        resultLabel.text = appendedNumber
        showEffect()
    }
    
    
    @IBAction func operatorKeyPadTapped(_ sender: UIButton) {
        let buttonTitle = sender.title(for: .normal)
        guard let operatorValue = buttonTitle else {
            return
        }
        if leftSide > 0 && rightSide > 0 && !operatorVal.isEmpty {
            tallyResult()
        } else if leftSide > 0 && !appendedNumber.isEmpty {
            if let rightSideVal = Double(appendedNumber) {
                rightSide = rightSideVal
                tallyResult()
            }
        } else if resultSide > 0 && leftSide == 0 && rightSide == 0 {
            leftSide = resultSide
            if let rightSideVal = Double(appendedNumber) {
                rightSide = rightSideVal
                tallyResult()
            }
        } else {
            if let leftSideVal = Double(appendedNumber) {
                leftSide = leftSideVal
            }
        }
        
        showEffect()
        
        appendedNumber = ""
        
        operatorVal = operatorValue
        
        
//        switch operatorValue {
//        case "+":
//            operatorVal = "+"
//        case "-":
//            operatorVal = "-"
//        case "x":
//            operatorVal = "x"
//        case "÷":
//            operatorVal = "/"
//        default:
//            resultLabel.text = "ERROR"
//        }

    }
    
    @IBAction func resultKeyPadTapped(_ sender: UIButton) {
        let buttonTitle = sender.title(for: .normal)
        guard let buttonTitle = buttonTitle else {
            return
        }
        
        if leftSide > 0 && rightSide > 0 && !operatorVal.isEmpty {
            tallyResult()
        } else if leftSide > 0 && !appendedNumber.isEmpty {
            if let rightSideVal = Double(appendedNumber) {
                rightSide = rightSideVal
                tallyResult()
            }
        } else if resultSide > 0 && leftSide == 0 && rightSide == 0 {
            leftSide = resultSide
            if let rightSideVal = Double(appendedNumber) {
                rightSide = rightSideVal
                tallyResult()
            }
        } else {
            if let leftSideVal = Double(appendedNumber) {
                leftSide = leftSideVal
            }
        }
        
        if buttonTitle == "=" {
            let doubleAsStringResult = NumberFormatter.localizedString(from: NSNumber(value: resultSide), number: .decimal)
            resultLabel.text = doubleAsStringResult
            showEffect()
            clearAllFields(withKey: false)
        } else {
            //
        }
    }
    
    func tallyResult() {
        switch operatorVal {
        case "+":
            resultSide = leftSide + rightSide
        case "-":
            resultSide = leftSide - rightSide
        case "x":
            resultSide = leftSide * rightSide
        case "÷":
            resultSide = leftSide / rightSide
        case "%":
            resultSide = leftSide.truncatingRemainder(dividingBy: rightSide)
        default:
            resultLabel.text = "ERROR"
        }
        
        leftSide = 0
        rightSide = 0
    }
    
    @IBAction func clearKeyPadTapped(_ sender: UIButton) {
        clearAllFields(withKey: true)
    }
    
    func clearAllFields(withKey yes:Bool) {
        showEffect()
        if yes {
            resultSide = 0
            resultLabel.text = "0"
        }
        
        leftSide = 0
        rightSide = 0
        operatorVal = ""
        appendedNumber = ""
    }
    
    func showEffect() {
        self.resultLabel.alpha = 0.0
        UIView.animate(withDuration: 0.5, delay: 0.0,
            options: .curveEaseOut,
            animations: {
              self.resultLabel.alpha = 1.0
            },
            completion: nil
          )
    }
}
