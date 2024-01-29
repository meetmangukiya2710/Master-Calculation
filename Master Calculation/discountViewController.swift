//
//  discountViewController.swift
//  Master Calculation
//
//  Created by R95 on 10/01/24.
//

import UIKit

class discountViewController: UIViewController {
    
    @IBOutlet weak var priceAmountOutlet: UITextField!
    
    @IBOutlet weak var discountOutlet: UITextField!
    
    @IBOutlet weak var priceOutlet: UILabel!
    
    @IBOutlet weak var saveamountOutlet: UILabel!
    
    @IBOutlet weak var backButtonOutlet: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        Discount()
        navigationItem.hidesBackButton = true
    }

    func Discount() {
        let mycolor : UIColor = UIColor.black
        
//        priceAmountOutlet.layer.cornerRadius = 5
//        priceAmountOutlet.layer.borderWidth = 1
//        priceAmountOutlet.layer.borderColor = mycolor.cgColor
//        
//        discountOutlet.layer.cornerRadius = 5
//        discountOutlet.layer.borderWidth = 1
//        discountOutlet.layer.borderColor = mycolor.cgColor
        
        backButtonOutlet.layer.cornerRadius = 8
        backButtonOutlet.layer.borderWidth = 1
        backButtonOutlet.layer.borderColor = mycolor.cgColor
    }
    
    @IBAction func discountButton(_ sender: Any) {
        if let amount = Double(priceAmountOutlet.text!), let dicount = Double(discountOutlet.text!){
            let price = (amount * dicount) / 100
            let after_Discount_Price = (amount - price)
            
            priceOutlet.text = String(after_Discount_Price)
            saveamountOutlet.text = String(price)
        }
        else if priceAmountOutlet.text == "" && discountOutlet.text == "" {
            error(title: "Error!", message: "Enter the Details")
        }
        else if priceAmountOutlet.text == "" {
            error(title: "Error!", message: "Enter the Price")
        }
        else if discountOutlet.text == "" {
            error(title: "Error!", message: "Enter the Discount in (%)")
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
