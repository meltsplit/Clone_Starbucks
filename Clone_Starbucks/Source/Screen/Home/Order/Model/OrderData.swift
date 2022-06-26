//
//  OrderData.swift
//  Clone_Starbucks
//
//  Created by 장석우 on 2022/06/23.
//

import Foundation
import RealmSwift

class OrderData: Object {
    @Persisted var select : Bool = false
    
    @Persisted var image : String = ""
    
    @Persisted var menu : String = ""
    @Persisted var engMenu : String = ""
    @Persisted var price : Int = 0
    
    @Persisted var heat : String = "ICED"
    @Persisted var size : String = "Tall"
    @Persisted var cup : String = "일회용컵"
    
    @Persisted var count : Int = 1
}
