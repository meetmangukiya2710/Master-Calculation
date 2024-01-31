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
        if let Rate = Double(interestRateOutlet.text!),
            let Years = Double(timePeriodOutlet.text!),
            let loanAMount = Double(loanAmountOutlet.text!){
            
            var Emi = String(EMI(loanAMount: Double(loanAmountOutlet.text!) ?? 0, Rate: Double(interestRateOutlet.text!) ?? 0, Years: Double(timePeriodOutlet.text!)!))
            
            Total_Payable_Amount.text = String(TotalPayment(Emi: Double(Emi) ?? 0, Years: Int(Double(timePeriodOutlet.text!) ?? 0)))
            
            var TotalPayment = (TotalPayment(Emi: Double(Emi) ?? 0, Years: Int(Double(timePeriodOutlet.text!) ?? 0)))
            
            total_Interest.text = String(interest(TotalPayment: Double(TotalPayment), loanAMount: Double(loanAmountOutlet.text!) ?? 0))
            
            interest_Amount.text = String(InterestRate(loanAmount: Double(loanAMount ?? 0), Years: Double(Years ?? 0)))
            
            
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
    
    func EMI(loanAMount : Double, Rate: Double, Years: Double)->Double{
        let interestvalue = Rate / 1200
        let monthly = Years * 12
        let Total = loanAMount * interestvalue / (1 - (pow(1/(1 + interestvalue), monthly)))
        return Total

    }
    
    func TotalPayment( Emi: Double, Years: Int  )-> Double{
        let totalMonth = Years * 12
        let Total = Emi * Double(totalMonth)
        return Total
        
    }
    
    func interest(TotalPayment: Double, loanAMount: Double) -> Double {
        let FinalInterest = TotalPayment - loanAMount
        return FinalInterest
        
    }
    
    func InterestRate(loanAmount: Double, Years: Double) -> Double {
        let InterestAmount = loanAmount * (Years/12)
        return InterestAmount
        
    }

}
