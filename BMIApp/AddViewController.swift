//
//  ViewController.swift
//  BMIApp
//
//  Created by Sreeram Ramakrishnan on 2018-12-13.
//  Copyright © 2018 Centennial College. All rights reserved.
//

import UIKit

class AddViewController: UIViewController, UITextFieldDelegate {

    @IBOutlet weak var heightText: UITextView!
    @IBOutlet weak var weightText: UITextView!
    
    @IBOutlet weak var BMIValue: UITextField!
    @IBOutlet weak var BMIButton: UIButton!
    
    @IBOutlet weak var heightSlider: UISlider!
    @IBOutlet weak var weightSlider: UISlider!

    
    @IBOutlet weak var statusLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
    
    }
    
    @IBAction func heightValueDidChange(_ sender: UISlider) {
        
        let currentValue = Float(sender.value)
        heightText.text = "\(currentValue) centimetres"
        self.calculateBMI()
    }
    
    
    @IBAction func weightValueDidChange(_ sender: UISlider) {
        
        let currentValue = Float(sender.value)
        weightText.text = "\(currentValue) kilograms"
        self.calculateBMI()
    }
    
    
    
    private func calculateBMI() {
        let height: Float = heightSlider.value
        let htmetre = height/100
        let weight: Float = weightSlider.value
        let bmi: Float = (weight / (htmetre*htmetre))
        
        BMIValue.text = "\(bmi)"
        self.changeStatus(bmi: bmi)
    }
    
    private func changeStatus(bmi: Float) {
        if (bmi < 16) {
            statusLabel.text = "Severe Thinness"
        } else if (bmi >= 16 && bmi < 17) {
            statusLabel.text = "Moderate Thinness"
        } else if (bmi >= 17 && bmi < 18.5) {
            statusLabel.text = "Mild Thinness"
        } else if (bmi >= 18.5 && bmi < 25) {
            statusLabel.text = "Normal"
        } else if (bmi >= 25 && bmi < 30) {
            statusLabel.text = "Overweight"
        } else if (bmi >= 30 && bmi < 35) {
            statusLabel.text = "Obese Class I"
        } else if (bmi >= 35 && bmi < 40) {
            statusLabel.text = "Obese Class II"
        }  else {
            statusLabel.text = "Obese Class III"
        }
    }


}

