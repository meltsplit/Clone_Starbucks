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
        layer.cornerRadius = frame.height / radius
        layer.masksToBounds = false
        clipsToBounds = true
        
    }
}

extension UITableViewCell{
    static var cellIdentifier : String{return String(describing: self)}
}

extension UICollectionViewCell{
    static var cellIdentifier : String{return String(describing: self)}
}
