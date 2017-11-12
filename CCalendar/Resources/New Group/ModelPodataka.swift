
import Foundation

class ModelPodataka {

    var CCNazivKalendara: String!
    var CCkalendar: Calendar!
    var CCkalendarskiIdfentifer: Calendar.Identifier!

    init(CCNazivKalendara: String, CCkalendar: Calendar, CCkalendarskiIdentifer: Calendar.Identifier) {
        
        self.CCNazivKalendara = CCNazivKalendara
        self.CCkalendar = CCkalendar
        self.CCkalendarskiIdfentifer = CCkalendarskiIdentifer
        
    }

}
