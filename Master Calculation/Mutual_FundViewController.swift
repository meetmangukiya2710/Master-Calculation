//
//  Mutual_FundViewController.swift
//  Master Calculation
//
//  Created by R95 on 10/01/24.
//

import UIKit

class Mutual_FundViewController: UIViewController {
    
    
    @IBOutlet weak var monthlyAmountOutlet: UITextField!
    
    @IBOutlet weak var returnOutlet: UITextField!
    
    @IBOutlet weak var timeOutlet: UITextField!
    
    @IBOutlet weak var investedLabelOutlet: UILabel!
    
    @IBOutlet weak var est_ReturnLabel: UILabel!
    
    @IBOutlet weak var totalValueLabelOutlet: UILabel!
    
    @IBOutlet weak var backButtonOutlet: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        mutualfund()
        navigationItem.hidesBackButton = true
    }
    
    func mutualfund() {
        let mycolor : UIColor = UIColor.black
        
        monthlyAmountOutlet.layer.cornerRadius = 5
        monthlyAmountOutlet.layer.borderWidth = 1
        monthlyAmountOutlet.layer.borderColor = mycolor.cgColor
        
        returnOutlet.layer.cornerRadius = 5
        returnOutlet.layer.borderWidth = 1
        returnOutlet.layer.borderColor = mycolor.cgColor
        
        timeOutlet.layer.cornerRadius = 5
        timeOutlet.layer.borderWidth = 1
        timeOutlet.layer.borderColor = mycolor.cgColor
        
        backButtonOutlet.layer.cornerRadius = 8
        backButtonOutlet.layer.borderWidth = 1
        backButtonOutlet.layer.borderColor = mycolor.cgColor
    }
    
    
    @IBAction func mutualFundButton(_ sender: Any) {
//        if let monthlyInvestment = Double(monthlyAmountOutlet.text!), let interestRate = Double(returnOutlet.text!), let timePeriod = Double(timeOutlet.text!) {
            
//            let numberOfPayments = Int(timePeriod * 12)
//            let investedAmount = monthlyInvestment * Double(numberOfPayments)
//            let interestGain = investedAmount * (1 - pow(1 + expectedReturn, 1/12)) / (1/12)
//            let totalValue = investedAmount + interestGain
//
//            let totalMonths = timePeriod * MONTHS_IN_YEAR
//            let totalInvestment = monthlyInvestment * totalMonths
//            let growthFactor = pow(1.0 + expectedReturn, MONTHS_IN_YEAR)
//            let futureValue = totalInvestment * growthFactor
            
//            let monthlyInterestRate = interestRate / 12 / 100
//            let numberOfPayments = timePeriod * 12
//            let numerator = monthlyInterestRate * monthlyInterestRate
//            let denominator = 1 - pow(1 + monthlyInterestRate, -numberOfPayments)
//            let emi = (numerator / denominator).rounded(toPlaces: 2)
//
//
//            investedLabelOutlet.text = String(investedAmount)
//            est_ReturnLabel.text = String(interestGain)
//            totalValueLabelOutlet.text = String(totalValue)
//        }
//        else
        if monthlyAmountOutlet.text == "" && returnOutlet.text == "" && timeOutlet.text == "" {
            error(title: "Error!", message: "Enter the Details")
        }
        else if monthlyAmountOutlet.text == "" {
            error(title: "Error!", message: "Enter the Monthly Amount")
        }
        else if returnOutlet.text == "" {
            error(title: "Error!", message: "Enter the Return in (%)")
        }
        else if timeOutlet.text == "" {
            error(title: "Error!", message: "Enter the Time Period")
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
 import Foundation

 // Mutual Fund Calculator

 // User inputs
 let monthlyInvestment = 100.0 // in dollars
 let expectedReturn = 0.06 // in decimal form (6% -> 0.06)
 let timePeriod = 10.0 // in years

 // Calculations
 let numberOfPayments = Int(timePeriod * 12)
 let investedAmount = monthlyInvestment * Double(numberOfPayments)
 let interestGain = investedAmount * (1 - pow(1 + expectedReturn, 1/12)) / (1/12)
 let totalValue = investedAmount + interestGain

 // Display results
 print("Invested: $\(investedAmount)")
 print("Interest Gain: $\(interestGain)")
 print("Total Value: $\(totalValue)")
 
 
 
 
 
 
 */
