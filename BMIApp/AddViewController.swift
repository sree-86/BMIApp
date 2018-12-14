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
    }
    
    
    @IBAction func weightValueDidChange(_ sender: UISlider) {
        
        let currentValue = Float(sender.value)
        weightText.text = "\(currentValue) kilograms"
    }
    
    
    


}

