//
//  InterestViewController.swift
//  Master Calculation
//
//  Created by R95 on 10/01/24.
//

import UIKit

class InterestViewController: UIViewController {
    
    @IBOutlet weak var principalAmountOutlet: UITextField!
    
    @IBOutlet weak var interestOutlet: UITextField!
    
    @IBOutlet weak var totalyearOutlet: UITextField!
    
    @IBOutlet weak var backButtonOutlet: UIButton!
    
    @IBOutlet weak var invested_Amount: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        interest()
        navigationItem.hidesBackButton = true
    }
    
    func interest() {
        let mycolor : UIColor = UIColor.black
        
        principalAmountOutlet.layer.cornerRadius = 5
        principalAmountOutlet.layer.borderWidth = 1
        principalAmountOutlet.layer.borderColor = mycolor.cgColor
        
        interestOutlet.layer.cornerRadius = 5
        interestOutlet.layer.borderWidth = 1
        interestOutlet.layer.borderColor = mycolor.cgColor
        
        totalyearOutlet.layer.cornerRadius = 5
        totalyearOutlet.layer.borderWidth = 1
        totalyearOutlet.layer.borderColor = mycolor.cgColor
        
        backButtonOutlet.layer.cornerRadius = 8
        backButtonOutlet.layer.borderWidth = 1
        backButtonOutlet.layer.borderColor = mycolor.cgColor
    }
    
    @IBAction func interestButton(_ sender: Any) {
        if let interestRate = Double(interestOutlet.text!), let totalTime = Double(totalyearOutlet.text!), let principalAmount = Double(principalAmountOutlet.text!) {
            
            let investedAmount = principalAmount
            let interest = principalAmount * (interestRate / 100) * totalTime
            let totalPayment = investedAmount + interest
            let amountDue = totalPayment
            
            invested_Amount.text = String(amountDue)
             
        }
        else if principalAmountOutlet.text == "" && interestOutlet.text == "" && totalyearOutlet.text == "" {
            error(title: "Error!", message: "Enter the Details")
        }
        else if principalAmountOutlet.text == "" {
            error(title: "Error!", message: "Enter the Principal Amount")
        }
        else if interestOutlet.text == "" {
            error(title: "Error!", message: "Enter the Interest Rate in (%)")
        }
        else if totalyearOutlet.text == "" {
            error(title: "Error!", message: "Enter the Total Time")
        }
    }
    
    func error(title: String,message: String) {
        let a = UIAlertController(title: title, message: message, preferredStyle: .alert)
        a.addAction(UIAlertAction(title: "Ok", style: .default))
        a.addAction(UIAlertAction(title: "Cansel", style: .destructive))
        present(a, animated: true)
    }

    
    @IBAction func backButtonAction(_ sender: Any) {
        let navigate = storyboard?.instantiateViewController(identifier: "CalculationUtilitiesViewController") as! CalculationUtilitiesViewController
        navigationController?.popViewController(animated: true)
    }
    
}

/*
 @IBAction func calculateButtonTapped(_ sender: UIButton) {
     guard
         let principalAmountText = principalAmountTextField.text,
         let principalAmount = Double(principalAmountText),
         let interestRateText = interestRateTextField.text,
         let interestRate = Double(interestRateText),
         let totalTimeText = totalTimeTextField.text,
         let totalTime = Double(totalTimeText)
     else {
         // Display an alert or error message for invalid input
         return
     }

     let investedAmount = principalAmount
     let interest = principalAmount * (interestRate / 100) * totalTime
     let totalPayment = investedAmount + interest
     let amountDue = totalPayment

     investedAmountLabel.text = "$\(investedAmount)"
     interestLabel.text = "$\(interest)"
     totalPaymentLabel.text = "$\(totalPayment)"
     amountDueLabel.text = "$\(amountDue)"
 }
 */
