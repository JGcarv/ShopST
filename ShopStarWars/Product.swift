//
//  Product.swift
//  ShopStarWars
//
//  Created by Joao Gabriel Carvalho on 27/03/17.
//  Copyright © 2017 Joao Gabriel Carvalho. All rights reserved.
//

import Foundation

class Product
{
    
//    required init() {
//                self.title = nil
//                self.price = nil
//                self.zipcode = nil
//                self.seller = nil
//                self.thumbnailHD = nil
//                self.date = nil
//    }
    init(title: String, price: Double, zipcode: String, seller: String, thumbnailHD: String, date: String) {
        self.title = title
        self.price = price
        self.zipcode = zipcode
        self.seller = seller
        self.thumbnailHD = thumbnailHD
        self.date = date
    }
    
    var title: String!
    var price: Double!
    var zipcode: String!
    var seller: String!
    var thumbnailHD: String!
    var date: String!

}
//
//extension Product : ArrowParsable {
//    
//      func deserialize(_ json: JSON) {
//        
//        title <-- json["title"]
//        price <-- json["price"]
//        zipcode <-- json["zipcode"]
//        seller <-- json["seller"]
//        thumbnailHD <-- json["thumbnailHd"]
//        date <-- json["date"]
//
//    }
//}
