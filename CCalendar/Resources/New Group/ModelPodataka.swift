
import Foundation

class ModelPodataka {
    
    
//    enum CCTipFormata: String{
//        case DATUM = "dd"
//        case NAZIV_DANA = "EEEE"
//        case NAZIV_MESECA = "MMMM"
//        case GODINA = "yyyy"
//    }
    
    
    var CCNazivKalendara: String!
    var CCkalendar: Calendar!
    var CCkalendarskiIdfentifer: Calendar.Identifier!
//    var CCDatum: String!
//    var CCNazivDana: String!
//    var CCNazivMeseca: String!
//    var CCGodina: String!
    
    

    init(CCNazivKalendara: String, CCkalendar: Calendar, CCkalendarskiIdentifer: Calendar.Identifier) {
        self.CCNazivKalendara = CCNazivKalendara
        self.CCkalendar = CCkalendar
        self.CCkalendarskiIdfentifer = CCkalendarskiIdentifer
//        self.CCDatum = CCDatum
//        self.CCNazivDana = CCNazivDana
//        self.CCNazivMeseca = CCNazivMeseca
//        self.CCGodina = CCGodina
        
        
    }
    
    
}
