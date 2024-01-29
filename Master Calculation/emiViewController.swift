//
//  emiViewController.swift
//  Master Calculation
//
//  Created by R95 on 11/01/24.
//

import UIKit

class emiViewController: UIViewController {
    
    @IBOutlet weak var loanAmountOutlet: UITextField!
    
    @IBOutlet weak var interestRateOutlet: UITextField!
    
    @IBOutlet weak var timePeriodOutlet: UITextField!
    
    @IBOutlet weak var backButtonOutlet: UIButton!
    
    @IBOutlet weak var interest_Amount: UILabel!
    
    @IBOutlet weak var total_Interest: UILabel!
    
    @IBOutlet weak var Total_Payable_Amount: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        EMI()
        navigationItem.hidesBackButton = true
    }
    
    func EMI() {
        let mycolor : UIColor = UIColor.black
        
        loanAmountOutlet.layer.cornerRadius = 5
        loanAmountOutlet.layer.borderWidth = 1
        loanAmountOutlet.layer.borderColor = mycolor.cgColor
        
        interestRateOutlet.layer.cornerRadius = 5
        interestRateOutlet.layer.borderWidth = 1
        interestRateOutlet.layer.borderColor = mycolor.cgColor
        
        timePeriodOutlet.layer.cornerRadius = 5
        timePeriodOutlet.layer.borderWidth = 1
        timePeriodOutlet.layer.borderColor = mycolor.cgColor
        
        backButtonOutlet.layer.cornerRadius = 8
        backButtonOutlet.layer.borderWidth = 1
        backButtonOutlet.layer.borderColor = mycolor.cgColor
    }
    
    @IBAction func EMIButton(_ sender: Any) {
        if let interestRate = Double(interestRateOutlet.text!),
            let timePeriod = Double(timePeriodOutlet.text!),
            let loanAmount = Double(loanAmountOutlet.text!){
            
            var monthlyInterestRate = interestRate * 12 / 100
            var time = timePeriod * 12
            var divisor = pow(1 + monthlyInterestRate, Double(time)) - 1
            var emi = (loanAmount * monthlyInterestRate * divisor) / (divisor - 1)
            var totalInterest = emi * Double(time) - loanAmount
            
            interest_Amount.text = "Rs \(Int(emi))"
            total_Interest.text = "Rs \(Int(totalInterest))"
            Total_Payable_Amount.text = "Rs  \(Int(emi * time))"
        }
        else if loanAmountOutlet.text == "" && interestRateOutlet.text == "" && timePeriodOutlet.text == "" {
            error(title: "Error!", message: "Enter the Details")
        }
        else if loanAmountOutlet.text == "" {
            error(title: "Error!", message: "Enter the Monthly Amount")
        }
        else if interestRateOutlet.text == "" {
            error(title: "Error!", message: "Enter the Return in (%)")
        }
        else if timePeriodOutlet.text == "" {
            error(title: "Error!", message: "Enter the Time Period")
        }
    }
    
    func error(title: String,message: String) {
        let a = UIAlertController(title: title, message: message, preferredStyle: .alert)
        a.addAction(UIAlertAction(title: "Ok", style: .default))
        a.addAction(UIAlertAction(title: "Cansel", style: .destructive))
        present(a, animated: true)
    }
    
    @IBAction func BackButtonAction(_ sender: Any) {
        let navigate = storyboard?.instantiateViewController(identifier: "CalculationUtilitiesViewController") as! CalculationUtilitiesViewController
        navigationController?.popViewController(animated: true)
    }

}
