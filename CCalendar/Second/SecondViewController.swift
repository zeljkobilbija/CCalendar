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
    @IBOutlet weak var gornjiPicker: MojPicker!
    @IBOutlet weak var donjiPicker: MojPicker!
    @IBOutlet weak var donjiLabel: MojLabel!
    
    var picker: MojPicker!
    var lokal: Locale!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        title = convertString
        lokal = Locale(identifier: Locale.preferredLanguages[0])
        
        picker = MojPicker()
        picker.pickerovModelPodataka = Podatci.getDate()
        
        gornjiPicker.dataSource = picker
        gornjiPicker.delegate = picker
        
        donjiPicker.dataSource = picker
        donjiPicker.delegate = picker
        
        NotificationCenter.default.addObserver(self, selector: #selector(metodZaNotifikaciju ), name: .mojPickerDidChange, object: nil)
        let calendarZaDatumPicker = picker.pickerovModelPodataka[gornjiPicker.selectedRow(inComponent: 0 )].CCkalendar
        
        datumPicker.calendar = calendarZaDatumPicker
        datumPicker.calendar.locale = lokal
        datumPicker.locale = lokal
        
        let kalendarZaDonjiLabel = picker.pickerovModelPodataka[donjiPicker.selectedRow(inComponent: 0)].CCkalendar
        
        let formater = DateFormatter()
        formater.calendar = kalendarZaDonjiLabel
        formater.dateStyle = .full
        formater.locale = lokal
        
        donjiLabel.text = formater.string(from: datumPicker.date).capitalized(with: lokal)
        

        
        
        
        datumPicker.setValue(UIColor(red: 2/255, green: 206/255, blue: 254/255, alpha: 1)  , forKey: "textColor")
        
    
    }
    @objc func metodZaNotifikaciju()
    {
        
    }


}
