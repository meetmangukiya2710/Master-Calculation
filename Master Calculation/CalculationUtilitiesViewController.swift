//
//  CalculationUtilitiesViewController.swift
//  Master Calculation
//
//  Created by R95 on 10/01/24.
//

import UIKit

class CalculationUtilitiesViewController: UIViewController {
    
    
    @IBOutlet weak var fstUi: UIView!
    @IBOutlet weak var secUi: UIView!
    @IBOutlet weak var thdUi: UIView!
    @IBOutlet weak var fourUi: UIView!
    @IBOutlet weak var fiveUi: UIView!
    @IBOutlet weak var sixUi: UIView!

    
    @IBOutlet weak var fstUIview: UIView!
    
    @IBOutlet weak var secUIview: UIView!
    
    @IBOutlet weak var thdUIview: UIView!
    
    @IBOutlet weak var fourUIview: UIView!
    
    @IBOutlet weak var fiveUIview: UIView!
    
    @IBOutlet weak var sixUIview: UIView!
    
    @IBOutlet weak var backButtonOutlet: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        Calculation()
        navigationItem.hidesBackButton = true
    }
    
    func Calculation() {
        let mycolor: UIColor = .black
        
        fstUi.layer.cornerRadius = 15
        fstUIview.layer.cornerRadius = 6
        
        secUi.layer.cornerRadius = 15
        secUIview.layer.cornerRadius = 6
        
        thdUi.layer.cornerRadius = 15
        thdUIview.layer.cornerRadius = 6
        
        fourUi.layer.cornerRadius = 15
        fourUIview.layer.cornerRadius = 6
        
        fiveUi.layer.cornerRadius = 15
        fiveUIview.layer.cornerRadius = 6
        
        sixUi.layer.cornerRadius = 15
        sixUIview.layer.cornerRadius = 6
        
        backButtonOutlet.layer.cornerRadius = 8
        backButtonOutlet.layer.borderWidth = 1
        backButtonOutlet.layer.borderColor = mycolor.cgColor
    }
    
    
    @IBAction func mutualFundAction(_ sender: UIButton) {
        let navigateButton1 = storyboard?.instantiateViewController(identifier: "Mutual_FundViewController") as! Mutual_FundViewController
        navigationController?.pushViewController(navigateButton1, animated: true)
    }
    
    @IBAction func interestAction(_ sender: UIButton) {
        let navigateButton2 = storyboard?.instantiateViewController(identifier: "InterestViewController") as! InterestViewController
        navigationController?.pushViewController(navigateButton2, animated: true)
    }
    
    @IBAction func discountAction(_ sender: Any) {
        let navigateButton3 = storyboard?.instantiateViewController(identifier: "discountViewController") as! discountViewController
        navigationController?.pushViewController(navigateButton3, animated: true)
    }
    
    @IBAction func emiAction(_ sender: Any) {
        let navigateButton4 = storyboard?.instantiateViewController(identifier: "emiViewController") as! emiViewController
        navigationController?.pushViewController(navigateButton4, animated: true)
    }
    
    @IBAction func schoolResultAction(_ sender: Any) {
        let navigateButton5 = storyboard?.instantiateViewController(identifier: "school_resultViewController") as! school_resultViewController
        navigationController?.pushViewController(navigateButton5, animated: true)
    }
    
    @IBAction func squareOrHour(_ sender: Any) {
        let navigateButton6 = storyboard?.instantiateViewController(identifier: "Square_or_HourViewController") as! Square_or_HourViewController
        navigationController?.pushViewController(navigateButton6, animated: true)
    }
    

    @IBAction func viewController(_ sender: UIButton) {
        let navigateButton7 = storyboard?.instantiateViewController(identifier: "ViewController") as! ViewController

        navigationController?.popViewController(animated: true)
    }
    
}
