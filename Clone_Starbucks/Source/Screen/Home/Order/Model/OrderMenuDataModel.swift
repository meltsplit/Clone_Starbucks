//
//  OrderMenuDataModel.swift
//  Clone_Starbucks
//
//  Created by 장석우 on 2022/06/16.
//

import Foundation
import UIKit
struct OrderMenuDataModel{
    
    let image : String
    let menu : String
    let englishMenu : String
    
}
extension OrderMenuDataModel{
    
    static var sampleData : [OrderMenuDataModel] = [
        OrderMenuDataModel(image: Image.frappucino1, menu: "추천", englishMenu: "Recommend"),
        OrderMenuDataModel(image: Image.coldbrew1, menu: "콜드 브루", englishMenu: "Cold Brew"),
        OrderMenuDataModel(image: Image.blonde1, menu: "블론드", englishMenu: "Blonde Coffee"),
        OrderMenuDataModel(image: Image.espresso1, menu: "에스프레소", englishMenu: "Espresso"),
        OrderMenuDataModel(image: Image.decaf1, menu: "디카페인 커피", englishMenu: "Decaf coffee"),
        OrderMenuDataModel(image: Image.frappucino2, menu: "프라푸치노", englishMenu: "Frappuccino")
    ]
    
}
