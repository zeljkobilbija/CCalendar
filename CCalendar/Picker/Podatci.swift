


import Foundation

class Podatci{
    class func getDate() -> [ModelPodataka]  {
        var data = [ModelPodataka]()
        let lokal = Locale(identifier: Locale.preferredLanguages[0])
        
        data.append(ModelPodataka(nazivKalendara: NSLocalizedString("Buddhist", comment: "Buddhist")))
        data.append(ModelPodataka(nazivKalendara: NSLocalizedString("Chinese", comment: "Chinese")))
        data.append(ModelPodataka(nazivKalendara: NSLocalizedString("Coptic", comment: "Coptic")))
        data.append(ModelPodataka(nazivKalendara: NSLocalizedString("Ethiopic Amete Alem", comment: "Ethiopic Amete Alem")))
        data.append(ModelPodataka(nazivKalendara: NSLocalizedString("Ethiopic Amete Mihret", comment: "Ethiopic Amete Mihret")))
        data.append(ModelPodataka(nazivKalendara: NSLocalizedString("Gregorian", comment: "Gregorian")))
        data.append(ModelPodataka(nazivKalendara: NSLocalizedString("Hebrew", comment: "Hebrew")))
        data.append(ModelPodataka(nazivKalendara: NSLocalizedString("Indian", comment: "Indian")))
        data.append(ModelPodataka(nazivKalendara: NSLocalizedString("Islamic", comment: "Islamic")))
        data.append(ModelPodataka(nazivKalendara: NSLocalizedString("Islamic Civil", comment: "Islamic Civil")))
        data.append(ModelPodataka(nazivKalendara: NSLocalizedString("Islamic Tabular", comment: "Islamic Tabular")))
        data.append(ModelPodataka(nazivKalendara: NSLocalizedString("Islamic Umm AlQura", comment: "Islamic Umm AlQura")))
        data.append(ModelPodataka(nazivKalendara: NSLocalizedString("Japanese", comment: "Japanese")))
        data.append(ModelPodataka(nazivKalendara: NSLocalizedString("Persian", comment: "Persian")))
        data.append(ModelPodataka(nazivKalendara: NSLocalizedString("Republik Of China", comment: "Republik Of China")))
//        data.append(ModelPodataka(nazivKalendara: NSLocalizedString("Julijanski", comment: "julijanski")))
        
        return data
        
    }
    
    func preracunatiKalendar(kalendar: Int) -> Calendar.Identifier {
        switch kalendar {
        case 0:
            let cal = Calendar.Identifier.buddhist
            return cal
            
        default:
            let cal  = Calendar.Identifier.buddhist
            return cal 
            
        }
    }
}
