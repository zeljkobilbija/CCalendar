

import Foundation


class FormatizovaniDatum {
    
    enum TipFormata: Int{
        case DATUM = 1
        case NAZIV_DANA = 2
        case NAZIV_MESECA = 3
        case GODINA = 4
        case FULL = 5
    }

    
    func lokalizovanaFormatizovanaStringa(kalendar: Calendar, segmentDatuma: TipFormata, datum: Date) -> String {
        
        let dateFormatter = DateFormatter()
        let lokalGlobalni = Locale(identifier: Locale.preferredLanguages[0])
        dateFormatter.calendar = kalendar
        dateFormatter.locale = lokalGlobalni
        
        
        switch segmentDatuma {
        case .DATUM :
            
            dateFormatter.setLocalizedDateFormatFromTemplate("d")
            return dateFormatter.string(from: datum).capitalized(with: lokalGlobalni)
        case .NAZIV_DANA:
            dateFormatter.setLocalizedDateFormatFromTemplate("EEEE")
            return dateFormatter.string(from: datum).capitalized(with: lokalGlobalni)
        case .NAZIV_MESECA:
            dateFormatter.setLocalizedDateFormatFromTemplate("MMMM")
            return dateFormatter.string(from: datum).capitalized(with: lokalGlobalni)
        case .GODINA:
            dateFormatter.setLocalizedDateFormatFromTemplate("y")
            return dateFormatter.string(from: datum).capitalized(with: lokalGlobalni)
        case .FULL:
            dateFormatter.dateStyle = .full
            return dateFormatter.string(from: datum).capitalized(with: lokalGlobalni)
        }

        
    }
    
    func NElokalizovanaFormatizovanaStringa(lokal: Locale, kalendar: Calendar, segmentdatuma: TipFormata, datum: Date) -> String {
        
        let dateFormatter = DateFormatter()
        dateFormatter.calendar = kalendar
        dateFormatter.locale = lokal
        
        switch segmentdatuma {
        case .DATUM:
            dateFormatter.setLocalizedDateFormatFromTemplate("d")
            return dateFormatter.string(from: datum).capitalized(with: lokal)
            
        case .NAZIV_DANA:
            dateFormatter.setLocalizedDateFormatFromTemplate("EEEE")
            return dateFormatter.string(from: datum).capitalized(with: lokal)
        case .NAZIV_MESECA:
            dateFormatter.setLocalizedDateFormatFromTemplate("MMMM")
            return dateFormatter.string(from: datum).capitalized(with: lokal)
        case .GODINA:
            dateFormatter.setLocalizedDateFormatFromTemplate("y")
            return dateFormatter.string(from: datum).capitalized(with: lokal)
        case .FULL:
            dateFormatter.dateStyle = .full
            return dateFormatter.string(from: datum).capitalized(with: lokal)
        }
        
    }
    
    
    
}
