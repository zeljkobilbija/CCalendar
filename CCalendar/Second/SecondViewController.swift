//
//  SecondViewController.swift
//  CCalendar
//
//  Created by Zeljko Bilbija on 05/11/17.
//  Copyright © 2017 Zeljko Bilbija. All rights reserved.
//

import UIKit

class SecondViewController: UIViewController {
//MARK:-
    //MARK:-
    //MARK:  OUTLETS
    @IBOutlet weak var datumPicker: UIDatePicker!
    @IBOutlet weak var gornjiPicker: MojPicker!
    @IBOutlet weak var donjiPicker: MojPicker!
    @IBOutlet weak var donjiLabel: MojLabel!
    //MARK:-
    //MARK:-
    //MARK: PROPERTIES
    var picker: MojPicker!
    var lokal: Locale!
    var globalniDatumM: Date!
    var datumPickerDatum = "datumPickerdatum"
    var datumPickerCalendar = "datumPickerCalendar"
    var donjiLabelText = "donjiLabelText"
    var gornjiPickerRow = "gornjiPickerRow"
    var donjiPickerRow = "donjiPickerRow"
    //MARK:-
     //MARK:-
    //MARK: OVERRIDE VIEWCONTROLLER FUNC
  
    override func viewDidLoad() {
        super.viewDidLoad()
        //title = convertString
        //let danasnjidatum = Date()
        //globalniDatumM = danasnjidatum
    
        if let startniGlobalnidatum = UserDefaults.standard.value(forKey: datumPickerDatum) {
            globalniDatumM = startniGlobalnidatum as! Date
            
        }else{
            globalniDatumM = Date()
        }
        
        datumPicker.date = globalniDatumM
        
        lokal = Locale(identifier: Locale.preferredLanguages[0])
        
        picker = MojPicker()
        picker.pickerovModelPodataka = Podatci.getDate()
        
        gornjiPicker.dataSource = picker
        gornjiPicker.delegate = picker
        
        donjiPicker.dataSource = picker
        donjiPicker.delegate = picker
        
        

        if let pickerDatum = UserDefaults.standard.value(forKey: datumPickerDatum){
            datumPicker.date = pickerDatum as! Date
        }
        
        if let pickerCalendar = UserDefaults.standard.value(forKey: datumPickerCalendar) {
            datumPicker.calendar = pickerCalendar as! Calendar
        }

        if let label = UserDefaults.standard.value(forKey: donjiLabelText) {
            donjiLabel.text = label as? String
        }

        if let gornjiRow = UserDefaults.standard.value(forKey: gornjiPickerRow) {
            gornjiPicker.selectRow(gornjiRow as! Int, inComponent: 0, animated: true)
        }

        if let donjiRow = UserDefaults.standard.value(forKey: donjiPickerRow) {
            donjiPicker.selectRow(donjiRow as! Int, inComponent: 0, animated: true)
        }

        
        
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
  
        datumPicker.setValue(UIColor.cyan , forKey: "textColor")
        
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
  
    override func viewWillAppear(_ animated: Bool) {

                if let pickerDatum = UserDefaults.standard.value(forKey: datumPickerDatum){
                    datumPicker.date = pickerDatum as! Date
                }
        
                if let pickerCalendar = UserDefaults.standard.value(forKey: datumPickerCalendar) {
                    datumPicker.calendar = pickerCalendar as! Calendar
                }
        
                if let label = UserDefaults.standard.value(forKey: donjiLabelText) {
                    donjiLabel.text = label as? String
                }
        
                if let gornjiRow = UserDefaults.standard.value(forKey: gornjiPickerRow) {
                    gornjiPicker.selectRow(gornjiRow as! Int, inComponent: 0, animated: true)
                }
        
                if let donjiRow = UserDefaults.standard.value(forKey: donjiPickerRow) {
                    donjiPicker.selectRow(donjiRow as! Int, inComponent: 0, animated: true)
                }
        

    }
    //MARK:-
    
     //MARK:-
    //MARK: MOJ PICKER PROMENA ROWA
    @objc func metodZaNotifikaciju(){
        
        lokal = Locale(identifier: Locale.preferredLanguages[0])
        datumPicker.locale = lokal
        datumPicker.calendar = picker.pickerovModelPodataka[gornjiPicker.selectedRow(inComponent: 0)].CCkalendar
        
        let datum = datumPicker.date
       // globalniDatumM = datumPicker.date
        
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
        
        donjiLabel.text = formater.string(from: globalniDatumM).capitalized(with: lokal)

        UserDefaults.standard.set(gornjiPicker.selectedRow(inComponent: 0), forKey: gornjiPickerRow)
        UserDefaults.standard.set(donjiPicker.selectedRow(inComponent: 0), forKey: donjiPickerRow)

    }
     //MARK:-
    //MARK:-
    //MARK: DATUM PICKER JE PROMERNJEN
    @IBAction func datumPickerDidChanged(_ sender: UIDatePicker){
        
        lokal = Locale(identifier: Locale.preferredLanguages[0])
        let kalendar = picker.pickerovModelPodataka[gornjiPicker.selectedRow(inComponent: 0 )].CCkalendar

        
        sender.calendar = kalendar
        sender.calendar.locale = lokal
        
        if let startniGlobalnidatum = UserDefaults.standard.value(forKey: datumPickerDatum) {
            globalniDatumM = startniGlobalnidatum as! Date
            
        }else{
            globalniDatumM = Date()
        }
        
        //datumPicker.date = globalniDatumM
        
        
        //globalniDatumM = datumPicker.date
        var komponenteDatuma = DateComponents()
        komponenteDatuma.calendar = kalendar
        
        let dan = kalendar?.component(.day, from: globalniDatumM)
        let mesec = kalendar?.component(.month, from: globalniDatumM)
        let godina = kalendar?.component(.year, from: globalniDatumM)
        
        komponenteDatuma.day = dan
        komponenteDatuma.month = mesec
        komponenteDatuma.year = godina
        
        let formater = DateFormatter()
        formater.dateStyle = .full
        formater.locale = lokal
        formater.calendar = picker.pickerovModelPodataka[donjiPicker.selectedRow(inComponent: 0)].CCkalendar
        
        donjiLabel.text = formater.string(from: globalniDatumM).capitalized(with: lokal)
        globalniDatumM = datumPicker.date
        
        UserDefaults.standard.set(datumPicker.date, forKey: datumPickerDatum)
        
        donjiLabel.text = formater.string(from: datumPicker.date).capitalized(with: lokal)
    }
    //MARK:-
    //MARK:-
    //MARK: SWIPE GESTURES
    @objc func leviSwipeFunkcija(seipe: UISwipeGestureRecognizer){
        
        let kalendar = picker.pickerovModelPodataka[gornjiPicker.selectedRow(inComponent: 0)].CCkalendar
        let noviDatum = kalendar?.date(byAdding: .day, value: 1, to: globalniDatumM)
        datumPicker.date = noviDatum!
        globalniDatumM = noviDatum!
        datumPickerDidChanged(datumPicker)
 
    }
    
    @objc func desniSwipeFunkcija(swipe: UISwipeGestureRecognizer){
        
        let kalendar = picker.pickerovModelPodataka[gornjiPicker.selectedRow(inComponent: 0)].CCkalendar
        let noviDatum = kalendar?.date(byAdding: .day, value: -1, to: globalniDatumM)
        datumPicker.date = noviDatum!
        globalniDatumM = noviDatum!
        datumPickerDidChanged(datumPicker)

    }
    
    @objc func dupliTapFunkcija( tap: UITapGestureRecognizer){
        
        let danasnjiDatum = Date()
        datumPicker.date = danasnjiDatum
        globalniDatumM = danasnjiDatum
        datumPickerDidChanged(datumPicker)

    }
    //MARK:-
    //MARK:-
}
