//
//  ViewController.swift
//  Master Calculation
//
//  Created by R95 on 09/01/24.
//

import UIKit

class ViewController: UIViewController {

    
    @IBOutlet weak var startappOutlet: UILabel!
    
    @IBOutlet weak var aboutasOutlet: UILabel!
    
    @IBOutlet weak var shareappOutlet: UILabel!
    
    @IBOutlet weak var rateappOutlet: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
       fstpage()
        navigationItem.hidesBackButton = true
    }

    func fstpage() {
        let mycolor : UIColor = UIColor.white
        
        startappOutlet.layer.cornerRadius = 12
        startappOutlet.textColor = .white
        startappOutlet.layer.borderWidth = 1
        startappOutlet.layer.borderColor = mycolor.cgColor
        
        aboutasOutlet.layer.cornerRadius = 12
        aboutasOutlet.textColor = .white
        aboutasOutlet.layer.borderWidth = 1
        aboutasOutlet.layer.borderColor = mycolor.cgColor
        
        shareappOutlet.layer.cornerRadius = 12
        shareappOutlet.textColor = .white
        shareappOutlet.layer.borderWidth = 1
        shareappOutlet.layer.borderColor = mycolor.cgColor
        
        rateappOutlet.layer.cornerRadius = 12
        rateappOutlet.textColor = .white
        rateappOutlet.layer.borderWidth = 1
        rateappOutlet.layer.borderColor = mycolor.cgColor
    }
    
    
    @IBAction func startAppAction(_ sender: UIButton) {
        let navigate = storyboard?.instantiateViewController(identifier: "CalculationUtilitiesViewController") as! CalculationUtilitiesViewController
        navigationController?.pushViewController(navigate, animated: true)
    }
    
    
    @IBAction func aboutUsAction(_ sender: UIButton) {
        let navigate1 = storyboard?.instantiateViewController(identifier: "aboutasViewController") as! aboutasViewController
        navigationController?.pushViewController(navigate1, animated: true)
    }
    
}

//let myColor : UIColor = UIColor.white()
//    email.layer.borderColor = myColor.cgColor
//    pass.layer.borderColor = myColor.cgColor

