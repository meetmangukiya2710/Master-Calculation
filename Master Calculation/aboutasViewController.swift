//
//  aboutasViewController.swift
//  Master Calculation
//
//  Created by R95 on 10/01/24.
//

import UIKit

class aboutasViewController: UIViewController {
    
    
    @IBOutlet weak var sahreappOutlet: UIButton!
    
    @IBOutlet weak var rateappOutlet: UIButton!
    
    @IBOutlet weak var backButtonOutlet: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        aboutpage()
        navigationItem.hidesBackButton = true
    }
   
    func aboutpage() {
        let mycolor : UIColor = UIColor.white
        
        sahreappOutlet.layer.cornerRadius = 12
        sahreappOutlet.layer.borderWidth = 1
        sahreappOutlet.layer.borderColor = mycolor.cgColor
        
        rateappOutlet.layer.cornerRadius = 12
        rateappOutlet.layer.borderWidth = 1
        rateappOutlet.layer.borderColor = mycolor.cgColor
        
        backButtonOutlet.layer.cornerRadius = 8
        backButtonOutlet.layer.borderWidth = 1
        backButtonOutlet.layer.borderColor = mycolor.cgColor
    }
    
    @IBAction func backButtonAction(_ sender: UIButton) {
        let navigate1 = storyboard?.instantiateViewController(identifier: "ViewController") as! ViewController
        navigationController?.popViewController(animated: true)
    }
    
    
}
