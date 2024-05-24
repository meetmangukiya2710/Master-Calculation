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
    
    class EmiCalculatorWorker
    {
        // MARK: Business Logic
        func calculateEmi(_ loanAmount : Double, loanTenure : Double, interestRate : Double) -> Double {
            let interestRateVal = interestRate / 1200
            let loanTenureVal = loanTenure * 12
            return loanAmount * interestRateVal / (1 - (pow(1/(1 + interestRateVal), loanTenureVal)))
        }
        
        func calculateTotalPayment(_ emi : Double, loanTenure : NSInteger) -> Double {
            let totalMonth = loanTenure * 12
            return emi * Double(totalMonth)
        }
        
        func calculateTotalInterestPayable(_ totalPayment : Double, loanAmount : Double) -> Double {
            return totalPayment - loanAmount
        }
    }
    
    
    @IBAction func mutualFundButton(_ sender: Any) {
        if let investement = Double(monthlyAmountOutlet.text!), let Expected = Double(returnOutlet.text!), let TP = Double(timeOutlet.text!) {
            
            totalValueLabelOutlet.text = String(futurevalue(monthly: Double(investement ?? 0), ExReturn: Double(Expected ?? 0), Time: Double(TP ?? 0)))
            let totalvalue = (futurevalue(monthly: Double(investement ?? 0), ExReturn: Double(Expected ?? 0), Time: Double(TP ?? 0))) - Double(investement ?? 0)
            
            est_ReturnLabel.text = String(totalvalue)
            
            investedLabelOutlet.text = String(investement)
        }
        else if monthlyAmountOutlet.text == "" && returnOutlet.text == "" && timeOutlet.text == "" {
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
        a.addAction(UIAlertAction(title: "Cancel", style: .destructive))
        present(a, animated: true)
    }
    
    
    @IBAction func backButtonAction(_ sender: Any) {
        let navigate = storyboard?.instantiateViewController(identifier: "CalculationUtilitiesViewController") as! CalculationUtilitiesViewController
        navigationController?.popViewController(animated: true)
    }
    
    func futurevalue(monthly: Double, ExReturn: Double, Time: Double) -> Double{
        let value = monthly * pow(1 + ExReturn / 100, Time)
        return value
        
    }
    
}
