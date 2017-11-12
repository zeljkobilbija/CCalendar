//
//  SecondViewController.swift
//  CCalendar
//
//  Created by Zeljko Bilbija on 05/11/17.
//  Copyright © 2017 Zeljko Bilbija. All rights reserved.
//

import UIKit

class SecondViewController: UIViewController {

    @IBOutlet weak var datumPicker: UIDatePicker!
    override func viewDidLoad() {
        super.viewDidLoad()
        title = convertString
        datumPicker.setValue(UIColor(red: 2/255, green: 206/255, blue: 254/255, alpha: 1)  , forKey: "textColor")
        
    
    }


}
