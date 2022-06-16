//
//  OrderMenuDataModel.swift
//  Clone_Starbucks
//
//  Created by 장석우 on 2022/06/16.
//

import Foundation
struct OrderDetailMenuDataModel{
    let menu : String
    let image : String
    let detailMenu : String
    let englishMenu : String
    let price : String
    
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
    
    
    static var commendData : [OrderDetailMenuDataModel] = [
                            OrderDetailMenuDataModel(menu: "추천", image: "coffee1", detailMenu: "오늘의 추천 커피", englishMenu: "Random zz", price: "100,000원"),
                            OrderDetailMenuDataModel(menu: "추천", image: "coffee2", detailMenu: "오늘의 추천 커피", englishMenu: "Random zz", price: "100,000원")
    ]
    
    static var coldBrewData : [OrderDetailMenuDataModel] = [
                            OrderDetailMenuDataModel(menu: "콜드브루", image: "coffee2", detailMenu: "콜드브루 오드 라떼", englishMenu: "Cold Brew With Oat Milk", price: "4,500원"),
                            OrderDetailMenuDataModel(menu: "콜드브루", image: "coffee1", detailMenu: "콜드브루 오드 라떼", englishMenu: "Cold Brew With Oat Milk", price: "4,500원")
    ]
    
    static var blondeData : [OrderDetailMenuDataModel] = [
        OrderDetailMenuDataModel(menu: "블론드", image: "coffee3", detailMenu: "블론드 Ice", englishMenu: "Cold Brew With Oat Milk", price: "4,500원"),
        OrderDetailMenuDataModel(menu: "블론드", image: "coffee3", detailMenu: "블론드 Hot", englishMenu: "Cold Brew With Oat Milk", price: "4,500원")
    ]
    
    static var espressoData : [OrderDetailMenuDataModel] = [
        OrderDetailMenuDataModel(menu: "에스프레소", image: "coffee8", detailMenu: "아이스 카페 아메리카노", englishMenu: "Iced Caffe Americano", price: "4,500원"),
        OrderDetailMenuDataModel(menu: "에스프레소", image: "coffee4", detailMenu: "에스프레소 Hot", englishMenu: "Espresso", price: "5,500원")
    ]
    
    static var decafData : [OrderDetailMenuDataModel] = [
        OrderDetailMenuDataModel(menu: "디카페인 커피", image: "coffee5", detailMenu: "아이스 디카페인 스타벅스 돌체 라떼", englishMenu: "Iced DECAF Lattee", price: "6,200원")
    ]
    
    static var FrapupuccinoData : [OrderDetailMenuDataModel] = [
        OrderDetailMenuDataModel(menu: "프라푸치노", image: "coffee7", detailMenu: "딸기 크림 프라푸치노", englishMenu: "StarwBerry Yummy", price: "6,800원")
    ]
    
    
   
    
    
}
