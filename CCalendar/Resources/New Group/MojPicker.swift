
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
       // lokal = Locale(identifier: Locale.preferredLanguages[0])

        let view = UIView(frame: CGRect(x: 0, y: 0, width: pickerView.bounds.width, height: 30))
        
        let label = UILabel(frame: CGRect(x: 15, y: 0, width: pickerView.bounds.width - 30, height: 30 ))

        
        label.text = pickerovModelPodataka[row].CCNazivKalendara
        label.textColor = UIColor.white
        label.textAlignment = .center
        label.font = UIFont.systemFont(ofSize: 22, weight: UIFont.Weight.ultraLight)

        view.addSubview(label)
        
        return view
    }
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {

            NotificationCenter.default.post(name: .mojPickerDidChange, object: self)
   
        }
    
    
 }

    















