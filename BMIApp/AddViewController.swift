//
//  ViewController.swift
//  BMIApp
//
//  Created by Sreeram Ramakrishnan on 2018-12-13.
//  Copyright © 2018 Centennial College. All rights reserved.
//

import UIKit

class AddViewController: UIViewController, UITextFieldDelegate {
    
    var bmicalc = 0

    @IBOutlet weak var unitSwitch: UISwitch!
    @IBOutlet weak var heightText: UITextView!
    @IBOutlet weak var weightText: UITextView!
    
    @IBOutlet weak var BMIValue: UITextField!
    
    @IBOutlet weak var heightSlider: UISlider!
    @IBOutlet weak var weightSlider: UISlider!

    
    @IBOutlet weak var statusLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
    
    }
    
    @IBAction func heightValueDidChange(_ sender: UISlider) {
        
        let currentValue = Float(sender.value)
        if unitSwitch.isOn{
            heightText.text = "\(currentValue) inches"
        }
        else{
            heightText.text = "\(currentValue) centimetres"
        }
        self.calculateBMI()
    }
    
    
    @IBAction func weightValueDidChange(_ sender: UISlider) {
        let currentValue = Float(sender.value)
        if unitSwitch.isOn{
            weightText.text = "\(currentValue) lbs"
        }
        else{
            weightText.text = "\(currentValue) kgs"
        }
        self.calculateBMI()
    }
    
    
    
    private func calculateBMI() {
        
        if unitSwitch.isOn{
            let htimp: Float = heightSlider.value
            let height = htimp/2.54
            let wtimp: Float = weightSlider.value
            let weight = wtimp*2.205
            let bmi: Float = (weight / (height*height))*703
            BMIValue.text = "\(bmi)"
            self.changeStatus(bmi: bmi)
            
            bmicalc = Int(Float(bmi))
        }
        else{
            let htcm: Float = heightSlider.value
            let height = htcm/100
            let weight: Float = weightSlider.value
            
            let bmi: Float = (weight / (height*height))
            BMIValue.text = "\(bmi)"
            self.changeStatus(bmi: bmi)
            
            bmicalc = Int(Float(bmi))
        }
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


    @IBAction func AddRecord(_ sender: UIButton) {
        if let context = (UIApplication.shared.delegate as? AppDelegate)?.persistentContainer.viewContext
        {
            let bmi = BMICoreData(entity: BMICoreData.entity(), insertInto: context)
            
            bmi.height = Double(heightSlider.value)
            bmi.weight = Double(weightSlider.value)
            bmi.bmival = Double(bmicalc)

            try? context.save()
        }
    }
    
    
}

