//
//  Square_or_HourViewController.swift
//  Master Calculation
//
//  Created by R95 on 11/01/24.
//

import UIKit

class Square_or_HourViewController: UIViewController {
    
    @IBOutlet weak var numberOutlet: UITextField!
    
    @IBOutlet weak var suareOrHourOutlet: UITextField!
    
    @IBOutlet weak var backButtonOutlet: UIButton!
    
    @IBOutlet weak var resultOutlet: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        Square_Or_Hour()
        navigationItem.hidesBackButton = true
    }
    
    func Square_Or_Hour() {
        let mycolor : UIColor = UIColor.black
        
        numberOutlet.layer.cornerRadius = 5
        numberOutlet.layer.borderWidth = 1
        numberOutlet.layer.borderColor = mycolor.cgColor
        
        suareOrHourOutlet.layer.cornerRadius = 5
        suareOrHourOutlet.layer.borderWidth = 1
        suareOrHourOutlet.layer.borderColor = mycolor.cgColor
        
        backButtonOutlet.layer.cornerRadius = 8
        backButtonOutlet.layer.borderWidth = 1
        backButtonOutlet.layer.borderColor = mycolor.cgColor
    }
    
    @IBAction func squareOrHourButton(_ sender: Any) {
        if let number = Double(numberOutlet.text!), let suareOrhour = Double(suareOrHourOutlet.text!) {
            var ans = 1
            for i in 0..<Int(suareOrhour) {
                ans = ans * Int(number)
                
                resultOutlet.text = String(ans)
            }
        }
        else if numberOutlet.text == "" && suareOrHourOutlet.text == "" {
            error(title: "Error!", message: "Enter the Details")
        }
        else if numberOutlet.text == "" {
            error(title: "Error!", message: "Enter the Monthly Amount")
        }
        else if suareOrHourOutlet.text == "" {
            error(title: "Error!", message: "Enter the Return in (%)")
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
