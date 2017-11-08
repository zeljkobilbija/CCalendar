//
//  MojLabel.swift
//  Big Mountain
//
//  Created by Zeljko Bilbija on 09/10/17.
//  Copyright © 2017 Zeljko Bilbija. All rights reserved.
//

import UIKit


@IBDesignable
class MojLabel: UILabel {

    
    @IBInspectable var clip: Bool = true{
        didSet{
            self.clipsToBounds = clip
        }
    }
    
    @IBInspectable var lukUgla: CGFloat = 0{
        didSet{
            self.layer.cornerRadius = lukUgla
        }
    }
    
    @IBInspectable var debljinaIvice: CGFloat = 0{
        didSet{
            self.layer.borderWidth = debljinaIvice
        }
    }
    
    @IBInspectable var bojaIvice: UIColor = UIColor.clear{
        didSet{
            self.layer.borderColor = bojaIvice.cgColor
            
        }
    }
    
    @IBInspectable var mojFont: UIFont = UIFont.init(){
        didSet{
            self.font = mojFont
        }
    }
    

}
