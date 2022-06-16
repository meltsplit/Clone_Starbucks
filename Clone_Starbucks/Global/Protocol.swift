//
//  Protocol.swift
//  Clone_Starbucks
//
//  Created by 장석우 on 2022/06/17.
//

import Foundation


protocol SendMenuDataDelegate {
   func sendData(data : OrderMenuDataModel)
}

protocol SendDetailMenuDataDelegate {
   func sendData(data : OrderDetailMenuDataModel)
}

