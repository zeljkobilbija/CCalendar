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
    var globalniDatumM = Date()
    
    
    
    
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
        
        
        let leviSwipe = UISwipeGestureRecognizer(target: self, action: #selector(leviSwipeFunkcija(seipe:)))
        leviSwipe.direction = UISwipeGestureRecognizerDirection.left
        self.view.addGestureRecognizer(leviSwipe)
        
        let desniSwipe = UISwipeGestureRecognizer(target: self, action: #selector(desniSwipeFunkcija(swipe:)))
        desniSwipe.direction = UISwipeGestureRecognizerDirection.right
        self.view.addGestureRecognizer(desniSwipe)
        
        let dupliTap = UITapGestureRecognizer(target: self, action: #selector(dupliTapFunkcija(tap:)))
        dupliTap.numberOfTapsRequired = 2
        self.view.addGestureRecognizer(dupliTap)
        
    }
    
    
    @objc func metodZaNotifikaciju()
    {
        lokal = Locale(identifier: Locale.preferredLanguages[0])
        datumPicker.locale = lokal
        datumPicker.calendar = picker.pickerovModelPodataka[gornjiPicker.selectedRow(inComponent: 0)].CCkalendar
        
        let datum = datumPicker.date
        
        var komponenteDatuma = DateComponents()
        komponenteDatuma.calendar = datumPicker.calendar
        komponenteDatuma.calendar?.locale = lokal
        
        let dan = datumPicker.calendar.component(.day, from: datum)
        let mesec = datumPicker.calendar.component(.month, from: datum)
        let godina = datumPicker.calendar.component(.year, from: datum)
        
        komponenteDatuma.day = dan
        komponenteDatuma.month = mesec
        komponenteDatuma.year = godina
        
        let formater = DateFormatter()
        formater.dateStyle = .full
        formater.locale = lokal
        formater.calendar = picker.pickerovModelPodataka[donjiPicker.selectedRow(inComponent: 0)].CCkalendar
        
        donjiLabel.text = formater.string(from: datum).capitalized(with: lokal)
        
    }
    
    
    
    @IBAction func datumPickerDidChanged(_ sender: UIDatePicker)
    {
        lokal = Locale(identifier: Locale.preferredLanguages[0])
        let kalendar = picker.pickerovModelPodataka[gornjiPicker.selectedRow(inComponent: 0 )].CCkalendar

        
        sender.calendar = kalendar
        sender.calendar.locale = lokal
        
        let datum = datumPicker.date
        
        var komponenteDatuma = DateComponents()
        komponenteDatuma.calendar = kalendar
        
        let dan = kalendar?.component(.day, from: datum)
        let mesec = kalendar?.component(.month, from: datum)
        let godina = kalendar?.component(.year, from: datum)
        
        komponenteDatuma.day = dan
        komponenteDatuma.month = mesec
        komponenteDatuma.year = godina
        
        let formater = DateFormatter()
        formater.dateStyle = .full
        formater.locale = lokal
        formater.calendar = picker.pickerovModelPodataka[donjiPicker.selectedRow(inComponent: 0)].CCkalendar
        
        donjiLabel.text = formater.string(from: datum).capitalized(with: lokal)
        
    }
    
    
    @objc func leviSwipeFunkcija(seipe: UISwipeGestureRecognizer)
    {
        //var datekomponents = DateComponents()
//        datekomponents.day = -1
//        let calendar = picker.pickerovModelPodataka[gornjiPicker.selectedRow(inComponent: 0)].CCkalendar
//        let lokal = Locale(identifier: Locale.preferredLanguages[0])
//
//        let formater = DateFormatter()
//        formater.calendar = calendar
//
//
//        let noviDatum = calendar?.date(byAdding: datekomponents, to: globalniDatumM)
//        globalniDatumM = noviDatum!
    }
    
    @objc func desniSwipeFunkcija(swipe: UISwipeGestureRecognizer)
    {
        
    }
    
    @objc func dupliTapFunkcija( tap: UITapGestureRecognizer)
    {
        let danasnjiDatum = Date()
        datumPicker.date = danasnjiDatum
        globalniDatumM = danasnjiDatum
    }
    
    
    
    
    


}
