 //
//  MojPicker.swift
//  World Calendars
//
//  Created by Zeljko Bilbija on 17/10/17.
//  Copyright © 2017 Zeljko Bilbija. All rights reserved.
//

import UIKit

class MojPicker: UIPickerView {

    var pickerovModelPodataka: [ModelPodataka]!
    var lokal: Locale!

}

extension MojPicker: UIPickerViewDataSource
{
    func numberOfComponents(in pickerView: UIPickerView) -> Int
    {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int
    {
        return 15
    }
}

extension MojPicker: UIPickerViewDelegate
{
    func pickerView(_ pickerView: UIPickerView, rowHeightForComponent component: Int) -> CGFloat {
        return 30
    }
    
    func pickerView(_ pickerView: UIPickerView, widthForComponent component: Int) -> CGFloat {
        return 290
    }
    
    func pickerView(_ pickerView: UIPickerView, viewForRow row: Int, forComponent component: Int, reusing view: UIView?) -> UIView
    {
        lokal = Locale(identifier: Locale.preferredLanguages[0])

        let view = UIView(frame: CGRect(x: 0, y: 0, width: pickerView.bounds.width, height: 30))
        
        let label = UILabel(frame: CGRect(x: 15, y: 0, width: pickerView.bounds.width - 30, height: 30 ))
        //label.text = pickerovModelPodataka[row].nazivKalendara
        

       // label.text = lokal.localizedString(for: ViewController.preracunatiKalendar(kalendar: row ))?.capitalized(with: lokal)
        
        
        label.text = kalendarLokalizovani(index: row)
        
        label.textColor = UIColor.white
        label.textAlignment = .center
        
        label.font = UIFont.systemFont(ofSize: 18, weight: UIFont.Weight.ultraLight)

        
        view.addSubview(label)
        
        
        return view
    }
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {

           // NotificationCenter.default.post(name: .mojPickerDidChange, object: self)
   
        }
    
    
    func kalendarLokalizovani(index: Int) -> String {
        
        lokal = Locale(identifier: Locale.preferredLanguages[0])
        
        switch index {
        case 0:
            let cal = Calendar.Identifier.buddhist

            return (lokal.localizedString(for: cal)?.capitalized(with: lokal))!
        case 1:
            let cal = Calendar.Identifier.chinese
            return (lokal.localizedString(for: cal)?.capitalized(with: lokal))!
        case 2:
            let cal = Calendar.Identifier.coptic
            return (lokal.localizedString(for: cal)?.capitalized(with: lokal))!
        case 3:
            let cal = Calendar.Identifier.ethiopicAmeteAlem
            return (lokal.localizedString(for: cal)?.capitalized(with: lokal))!
        case 4:
            let cal = Calendar.Identifier.ethiopicAmeteMihret
            return (lokal.localizedString(for: cal)?.capitalized(with: lokal))!
        case 5:
            let cal = Calendar.Identifier.gregorian
            return (lokal.localizedString(for: cal)?.capitalized(with: lokal))!
        case 6:
            let cal = Calendar.Identifier.hebrew
            return (lokal.localizedString(for: cal)?.capitalized(with: lokal))!
        case 7:
            let cal = Calendar.Identifier.indian
            return (lokal.localizedString(for: cal)?.capitalized(with: lokal))!
        case 8:
            let cal = Calendar.Identifier.islamic
            return (lokal.localizedString(for: cal)?.capitalized(with: lokal))!
        case 9:
            let cal = Calendar.Identifier.islamicCivil
            return (lokal.localizedString(for: cal)?.capitalized(with: lokal))!
        case 10:
            let cal = Calendar.Identifier.islamicTabular
            return (lokal.localizedString(for: cal)?.capitalized(with: lokal))!
        case 11:
            let cal = Calendar.Identifier.islamicUmmAlQura
            return (lokal.localizedString(for: cal)?.capitalized(with: lokal))!
        case 12:
            let cal = Calendar.Identifier.japanese
            return (lokal.localizedString(for: cal)?.capitalized(with: lokal))!
        case 13:
            let cal = Calendar.Identifier.persian
            return (lokal.localizedString(for: cal)?.capitalized(with: lokal))!
        case 14:
            let cal = Calendar.Identifier.republicOfChina
            return (lokal.localizedString(for: cal)?.capitalized(with: lokal))!
        default:
            let cal = Calendar.Identifier.buddhist
            return (lokal.localizedString(for: cal)?.capitalized(with: lokal))!
        }
    }
 
 
    
 }

    















