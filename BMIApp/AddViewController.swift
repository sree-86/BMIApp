//
//  ViewController.swift
//  BMIApp
//
//  Created by Sreeram Ramakrishnan on 2018-12-13.
//  Copyright © 2018 Centennial College. All rights reserved.
//

import UIKit

class AddViewController: UIViewController, UITextFieldDelegate {

    
    
    

    

    
    @IBOutlet weak var heightLabel: UILabel!
    @IBOutlet weak var weightLabel: UILabel!
    
    @IBOutlet weak var Value: UILabel!
    @IBOutlet weak var BMIButton: UIButton!
    
    @IBOutlet weak var heightSlider: UISlider!
    @IBOutlet weak var weightSlider: UISlider!

    
    @IBOutlet weak var statusLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        // Status Label
        statusLabel.layer.masksToBounds = true
        statusLabel.layer.cornerRadius = 5
    }
    



}

