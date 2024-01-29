//
//  school_resultViewController.swift
//  Master Calculation
//
//  Created by R95 on 11/01/24.
//

import UIKit

class school_resultViewController: UIViewController {
    
    @IBOutlet weak var totalmarksOutlet: UITextField!
    
    @IBOutlet weak var yourMakrOutlet: UITextField!

    @IBOutlet weak var percentagelabel: UILabel!
    
    @IBOutlet weak var backButtonOutlet: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        school_Result()
        navigationItem.hidesBackButton = true
    }
    
    func school_Result() {
        let mycolor : UIColor = UIColor.black
        
        totalmarksOutlet.layer.cornerRadius = 5
        totalmarksOutlet.layer.borderWidth = 1
        totalmarksOutlet.layer.borderColor = mycolor.cgColor
        
        yourMakrOutlet.layer.cornerRadius = 5
        yourMakrOutlet.layer.borderWidth = 1
        yourMakrOutlet.layer.borderColor = mycolor.cgColor
        
        backButtonOutlet.layer.cornerRadius = 8
        backButtonOutlet.layer.borderWidth = 1
        backButtonOutlet.layer.borderColor = mycolor.cgColor
    
    }
    
    @IBAction func SchoolResultAction(_ sender: Any) {
        if let totalMarks = Double(totalmarksOutlet.text!), let yourMarks = Double(yourMakrOutlet.text!) {
            let percentage = (yourMarks / totalMarks) * 100
            percentagelabel.text = "\(String(percentage)) %"
        }
        else if totalmarksOutlet.text == "" && yourMakrOutlet.text == "" {
            error(title: "Error!", message: "Enter the All Detials")
        }
        else if totalmarksOutlet.text == "" {
            error(title: "Error!", message: "Enetr the Total Marks")
        }
        else if yourMakrOutlet.text == "" {
            error(title: "Error!", message: "Enter the Yout Total Marks")
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

//Calucate percentage based on given values
//public func calculatePercentage(value:Double,percentageVal:Double)->Double{
//    let val = value * percentageVal
//    return val / 100.0
//}
//
//We can use this function like:
//
// let value = calculatePercentage(value: 500,percentageVal: 20)
// print(value)
