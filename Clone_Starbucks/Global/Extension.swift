//
//  Extension.swift
//  Clone_Starbucks
//
//  Created by 장석우 on 2022/06/16.
//

import Foundation
import UIKit

extension UIView{
    
    func makeShadow(radius : CGFloat, offset : CGSize, opacity : Float){
        layer.shadowColor = UIColor.darkGray.cgColor
        layer.shadowOffset = offset
        layer.shadowRadius = radius
        layer.shadowOpacity = opacity
        layer.masksToBounds = false
    }
    
    func makeCornerRound (radius : CGFloat){
        layer.cornerRadius = frame.height / radius
        layer.masksToBounds = false
        clipsToBounds = true
    }
    
    func makeBorder(width : CGFloat , cgColor : CGColor ){
    layer.borderWidth = width
    layer.borderColor = cgColor
    }
}



extension UITableViewCell{
    static var cellIdentifier : String{return String(describing: self)}
}

extension UICollectionViewCell{
    static var cellIdentifier : String{return String(describing: self)}
}

