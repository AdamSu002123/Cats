//
//  CatJson.swift
//  Cats
//
//  Created by gih96984 on 2022/10/12.
//

import Foundation

struct Cat: Codable{
    let id : String     //品種
    let name: String    //學名
    let childFriendly: Int //對小孩的友善程度
    let lifeSpan: String   //壽命life_span
    let origin: String      //原生國家
    let image: Image?       //圖片
    let temperament: String //習性
}

struct Image: Codable{
    let id: String
    let url: String
}
