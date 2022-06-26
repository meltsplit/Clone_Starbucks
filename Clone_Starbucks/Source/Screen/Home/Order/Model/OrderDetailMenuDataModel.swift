//
//  OrderMenuDataModel.swift
//  Clone_Starbucks
//
//  Created by 장석우 on 2022/06/16.
//

import Foundation
import UIKit
struct OrderDetailMenuDataModel{
    let menu : String
    let image : String
    let detailMenu : String
    let englishMenu : String
    let price : Int
    
}
extension OrderDetailMenuDataModel{
    static var menu_DetailMenu : Dictionary<String,[OrderDetailMenuDataModel]> = [
        "추천": commendData,
        "콜드 브루": coldBrewData,
        "블론드": blondeData,
        "에스프레소":espressoData,
        "디카페인 커피":decafData,
        "프라푸치노":FrapupuccinoData
    ]
}

extension OrderDetailMenuDataModel{
    
    static var commendData : [OrderDetailMenuDataModel] = [
        OrderDetailMenuDataModel(menu: "추천", image: Image.coldbrew1, detailMenu: "오늘의 추천 커피", englishMenu: "Random zz", price: 4500),
        OrderDetailMenuDataModel(menu: "추천", image: Image.decaf1, detailMenu: "오늘의 추천 커피", englishMenu: "Random zz", price: 4500)
        
    ]
    
    static var coldBrewData : [OrderDetailMenuDataModel] = [
        OrderDetailMenuDataModel(menu: "콜드브루", image: Image.coldbrew1, detailMenu: "콜드브루 오드 라떼", englishMenu: "Cold Brew With Oat Milk", price: 4500),
        OrderDetailMenuDataModel(menu: "콜드브루", image: Image.coldbrew2, detailMenu: "돌체 콜드 브루", englishMenu: "Cold Brew With Oat Milk", price: 4500)
    ]
    
    static var blondeData : [OrderDetailMenuDataModel] = [
        OrderDetailMenuDataModel(menu: "블론드", image: Image.blonde1, detailMenu: "라벤더 블론드 스타벅스 더블 샷", englishMenu: "Cold Brew With Oat Milk", price: 4500),
        OrderDetailMenuDataModel(menu: "블론드", image: Image.blonde2, detailMenu: "아이스 블론드 바닐라 더블샷 마키야또", englishMenu: "Cold Brew With Oat Milk", price: 4500)
    ]
    
    static var espressoData : [OrderDetailMenuDataModel] = [
        OrderDetailMenuDataModel(menu: "에스프레소", image: Image.espresso1, detailMenu: "바닐라 플랫 화이트", englishMenu: "Iced Caffe Americano", price: 4500),
        OrderDetailMenuDataModel(menu: "에스프레소", image: Image.espresso2, detailMenu: "아이스 스타벅스 돌체 라떼", englishMenu: "Espresso", price: 5500)
    ]
    
    static var decafData : [OrderDetailMenuDataModel] = [
        OrderDetailMenuDataModel(menu: "디카페인 커피", image: Image.decaf1, detailMenu: "아이스 디카페인 스타벅스 돌체 라떼", englishMenu: "Iced DECAF Lattee", price: 6200),
        OrderDetailMenuDataModel(menu: "디카페인 커피", image: Image.decaf2, detailMenu: "아이스 디카페인 카라멜 마키야또", englishMenu: "Iced DECAF Lattee", price: 7400)
    ]
    
    static var FrapupuccinoData : [OrderDetailMenuDataModel] = [
        OrderDetailMenuDataModel(menu: "프라푸치노", image: Image.frappucino1, detailMenu: "커피 드로잉 말차 프라푸치노", englishMenu: "StarwBerry Yummy", price: 7200),
        OrderDetailMenuDataModel(menu: "프라푸치노", image: Image.frappucino2, detailMenu: "더블 에스프레소 칩 프라푸치노", englishMenu: "StarwBerry Yummy", price: 6800)
    ]
    
    
   
    
    
}
