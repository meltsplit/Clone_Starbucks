//
//  HomeVCModel.swift
//  Clone_Starbucks
//
//  Created by 장석우 on 2022/06/15.
//

import Foundation
struct HomeNewsDataModel{
    
    let image : String
    let title : String
    let description : String
}

extension HomeNewsDataModel{
    
    static var sampleData : [HomeNewsDataModel] = [
        
        HomeNewsDataModel(image: "news1", title: "미션 e- 스티커 추가 증정 이벤트", description: "어쩌구 저쩌구"),
        HomeNewsDataModel(image: "news2", title: "22서머 e-프리퀀시 이벤트 안내", description: "어쩌구 저쩌구"),
        HomeNewsDataModel(image: "news3", title:  "22서머 e-프리퀀시 증정품 안내", description: "어쩌구 저쩌구"),
        HomeNewsDataModel(image: "news4", title: "22서머 e-프리퀀시 예약시스템 안내", description: "어쩌구 저쩌구"),
        HomeNewsDataModel(image: "news5", title: "6월15일, 피낭시에 2종 출시", description: "어쩌구 저쩌구"),
        HomeNewsDataModel(image: "news6", title: "6월 14일, 한입에 쏙 고구마가 재출시 됩니다.", description: "어쩌구 저쩌구")
                                                    
        ]
}
