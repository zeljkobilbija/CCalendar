
import Foundation

class Podatci{
//
//    enum CCTipFormata: Int{
//        case DATUM = 1
//        case NAZIV_DANA = 2
//        case NAZIV_MESECA = 3
//        case GODINA = 4
//    }
    
    class func getDate() -> [ModelPodataka]  {
        var data = [ModelPodataka]()
        
        
        let lokal = Locale(identifier: Locale.preferredLanguages[0])
        
        data.append(ModelPodataka(CCNazivKalendara: (lokal.localizedString(for: Calendar.Identifier.buddhist)?.capitalized(with: lokal))!, CCkalendar: Calendar(identifier: .buddhist), CCkalendarskiIdentifer: .buddhist))
        
        data.append(ModelPodataka(CCNazivKalendara: (lokal.localizedString(for: Calendar.Identifier.chinese)?.capitalized(with: lokal))!, CCkalendar: Calendar(identifier: .chinese), CCkalendarskiIdentifer: .chinese))
        
        data.append(ModelPodataka(CCNazivKalendara: (lokal.localizedString(for: Calendar.Identifier.coptic)?.capitalized(with: lokal))!, CCkalendar: Calendar(identifier: .coptic), CCkalendarskiIdentifer: .coptic))
       
        data.append(ModelPodataka(CCNazivKalendara: (lokal.localizedString(for: Calendar.Identifier.ethiopicAmeteAlem)?.capitalized(with: lokal))!, CCkalendar: Calendar(identifier: .ethiopicAmeteAlem), CCkalendarskiIdentifer: .ethiopicAmeteAlem))
        
        data.append(ModelPodataka(CCNazivKalendara: (lokal.localizedString(for: Calendar.Identifier.ethiopicAmeteMihret)?.capitalized(with: lokal))!, CCkalendar: Calendar(identifier: .ethiopicAmeteMihret), CCkalendarskiIdentifer: .ethiopicAmeteMihret))
        
        data.append(ModelPodataka(CCNazivKalendara: (lokal.localizedString(for: Calendar.Identifier.gregorian)?.capitalized(with: lokal))!, CCkalendar: Calendar(identifier: .gregorian), CCkalendarskiIdentifer: .gregorian))
        
        data.append(ModelPodataka(CCNazivKalendara: (lokal.localizedString(for: Calendar.Identifier.hebrew)?.capitalized(with: lokal))!, CCkalendar: Calendar(identifier: .hebrew), CCkalendarskiIdentifer: .hebrew))
        
        data.append(ModelPodataka(CCNazivKalendara: (lokal.localizedString(for: Calendar.Identifier.indian)?.capitalized(with: lokal))!, CCkalendar: Calendar(identifier: .indian), CCkalendarskiIdentifer: .indian))
        
        data.append(ModelPodataka(CCNazivKalendara: (lokal.localizedString(for: Calendar.Identifier.islamic)?.capitalized(with: lokal))!, CCkalendar: Calendar(identifier: .islamic), CCkalendarskiIdentifer: .islamic))
        
        data.append(ModelPodataka(CCNazivKalendara: (lokal.localizedString(for: Calendar.Identifier.islamicCivil)?.capitalized(with: lokal))!, CCkalendar: Calendar(identifier: .islamicCivil), CCkalendarskiIdentifer: .islamicCivil))
        
//        data.append(ModelPodataka(CCNazivKalendara: (lokal.localizedString(for: Calendar.Identifier.islamicTabular)?.capitalized(with: lokal))!, CCkalendar: Calendar(identifier: .islamicTabular), CCkalendarskiIdentifer: .islamicTabular))
        
        data.append(ModelPodataka(CCNazivKalendara: (lokal.localizedString(for: Calendar.Identifier.islamicUmmAlQura)?.capitalized(with: lokal))!, CCkalendar: Calendar(identifier: .islamicUmmAlQura), CCkalendarskiIdentifer: .islamicUmmAlQura))
        
        data.append(ModelPodataka(CCNazivKalendara: (lokal.localizedString(for: Calendar.Identifier.japanese)?.capitalized(with: lokal))!, CCkalendar: Calendar(identifier: .japanese), CCkalendarskiIdentifer: .japanese))
        
        data.append(ModelPodataka(CCNazivKalendara: (lokal.localizedString(for: Calendar.Identifier.persian)?.capitalized(with: lokal))!, CCkalendar: Calendar(identifier: .persian), CCkalendarskiIdentifer: .persian))
        
        data.append(ModelPodataka(CCNazivKalendara: (lokal.localizedString(for: Calendar.Identifier.republicOfChina)?.capitalized(with: lokal))!, CCkalendar: Calendar(identifier: .republicOfChina), CCkalendarskiIdentifer: .republicOfChina))
        
        return data
        
    }
    
    
}
