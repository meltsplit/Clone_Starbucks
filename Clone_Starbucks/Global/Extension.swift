//
//  Extension.swift
//  Clone_Starbucks
//
//  Created by 장석우 on 2022/06/16.
//

import Foundation
import UIKit

extension UIView{
    
    func makeShadow(radius : CGFloat){
        layer.shadowColor = UIColor.darkGray.cgColor
        layer.shadowOffset = CGSize(width: 0, height: 4)
        layer.shadowRadius = radius
        layer.shadowOpacity = 0.3
        layer.masksToBounds = false
    }
    
    func makeCornerRound (radius : CGFloat){
        layer.cornerRadius = bounds.size.height / radius
        clipsToBounds = true
    }
}
