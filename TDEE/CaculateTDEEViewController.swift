//
//  CaculateTDEEViewController.swift
//  TDEE
//
//  Created by 劉子瑜 on 2019/8/5.
//  Copyright © 2019 劉子瑜. All rights reserved.
//

import UIKit

class CaculateTDEEViewController: UIViewController {
    
    let bodydetail:BodyDetail
    
    @IBOutlet weak var BMRLabel: UILabel!
    @IBOutlet weak var TDEELabel: UILabel!
    @IBOutlet weak var BMILabel: UILabel!
    
    init?(coder: NSCoder, detail: BodyDetail){
        bodydetail = detail
        super.init(coder: coder)
    }
    required init?(coder: NSCoder){
        fatalError()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        var BMR:Double = 0.0
        var TDEE:Double = 0.0
        var BMI:Double = 0.0
    print("sex:\(bodydetail.sex),age:\(bodydetail.age),weight:\(bodydetail.weight),height:\(bodydetail.height),motiontime:\(bodydetail.motionTime)")
        
        if(bodydetail.sex == "Man" ){
            BMR = (13.7 * bodydetail.weight) + (5 * bodydetail.height) - (6.0 * Double(bodydetail.age)) + 66
            
        }else{
            BMR = (9.6 * bodydetail.weight) + (1.8 * bodydetail.height) - (4.7 * Double(bodydetail.age)) + 655
        }
        
        if bodydetail.motionTime < 1 {
            TDEE = 1.2 * BMR
        } else if bodydetail.motionTime < 3 {
            TDEE = 1.375 * BMR
        } else if bodydetail.motionTime < 6 {
            TDEE = 1.55 * BMR
        } else {
            TDEE = 1.725 * BMR
        }
        
        BMI = bodydetail.weight / bodydetail.height / bodydetail.height * 10000
        
        BMRLabel.text = "\(BMR)"
        TDEELabel.text = "\(TDEE)"
        BMILabel.text = "\(BMI)"
        
        
        
    }

}
