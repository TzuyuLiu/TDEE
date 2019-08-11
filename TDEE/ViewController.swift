//
//  ViewController.swift
//  TDEE
//
//  Created by 劉子瑜 on 2019/7/26.
//  Copyright © 2019 劉子瑜. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var heightTextField: UITextField!
    @IBOutlet weak var weightTextField: UITextField!
    @IBOutlet weak var ageTextFiled: UITextField!
    @IBOutlet weak var motionTextField: UITextField!
    var gender:String?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        
    }
    
    @IBSegueAction func cacTDEE(coder: NSCoder) -> CaculateTDEEViewController?{
        
        //取出數字
        if let weightText = weightTextField.text , let heightText = heightTextField.text , let ageText = ageTextFiled.text,let motionText = motionTextField.text , let weight = Double(weightText), let heigh = Double(heightText),let age = Int(ageText), let motion = Int(motionText)
            {
                let controller = CaculateTDEEViewController(coder: coder, detail: BodyDetail(weight: weight, height: heigh, age: age, motionTime: motion,sex: gender ?? "Man"))
            
            return controller
            } else{
                return nil
            }
        
    }
    @IBAction func sexSegmentedControl(_ sender: UISegmentedControl) {
        if sender.selectedSegmentIndex == 0 {
            gender = "Man"
        } else {
            gender = "Female"
        }
    }
    
    @IBAction func clearFunction(_ sender: Any) {
        heightTextField.text = ""
        weightTextField.text = ""
        ageTextFiled.text = ""
        motionTextField.text = ""
        
        
    }
    
    
}

