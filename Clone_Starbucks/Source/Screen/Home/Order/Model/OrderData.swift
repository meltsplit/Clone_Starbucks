//
//  OrderData.swift
//  Clone_Starbucks
//
//  Created by 장석우 on 2022/06/23.
//

import Foundation
import RealmSwift

class OrderData: Object {
    
    @Persisted var menu : String = ""
    @Persisted var engMenu : String = ""
    @Persisted var price : Int = 0
    
    @Persisted var ice : Bool = true
    @Persisted var size : String = ""
    @Persisted var cup : String = ""
    
    @Persisted var count : String = ""
    
    
}
