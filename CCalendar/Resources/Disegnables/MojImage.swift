//
//  MojImage.swift
//  WorldCalendar
//
//  Created by Zeljko Bilbija on 01/10/17.
//  Copyright © 2017 Zeljko Bilbija. All rights reserved.
//

import UIKit

@IBDesignable
class MojImage: UIImageView
{
    
    
    @IBInspectable var cornerRadius: CGFloat = 0
        {
        didSet
        {
            self.layer.cornerRadius = cornerRadius
        }
    }

    
    @IBInspectable var borderWidth: CGFloat = 0
        {
        didSet
        {
            self.layer.borderWidth = borderWidth
        }
    }
    
    @IBInspectable var borderColor: UIColor = UIColor.clear
        {
        didSet
        {
            self.layer.borderColor = borderColor.cgColor
        }
    }
    
    
    
    @IBInspectable var alphaView: CGFloat = 0
        {
        didSet
        {
            self.alpha = alphaView
        }
    }
    
    @IBInspectable var clip: Bool = true
        {
        didSet
        {
            
            self.clipsToBounds = clip
            
        }
    }
    
    
}
