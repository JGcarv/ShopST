//
//  Services.swift
//  ShopStarWars
//
//  Created by Joao Gabriel Carvalho on 27/03/17.
//  Copyright © 2017 Joao Gabriel Carvalho. All rights reserved.
//

import Foundation
import Alamofire
import AlamofireImage
import SwiftyJSON

struct Service {
    
    static let sharedInstance = Service()

    func fetchProducts(completion: @escaping ([Product]) -> ()){
        let url = "https://raw.githubusercontent.com/stone-pagamentos/desafio-mobile/master/products.json"
        
        Alamofire.request(url, method: .get).validate().responseJSON { response in
            switch response.result {
            case .failure(let erro):
                print(erro)
            case.success(let value):
                let productsJSON = JSON(value)
                var products: [Product] = []
                for productJSON in productsJSON {
                    
                    let seller = productJSON.1["seller"].stringValue
                    let title = productJSON.1["title"].stringValue
                    let price = productJSON.1["price"].intValue
                    let zipcode = productJSON.1["zipcode"].stringValue
                    let thumbnailHd = productJSON.1["thumbnailHd"].stringValue
                    let date = productJSON.1["date"].stringValue
                    
                    products.append(Product(title: title, price: Double(price) / 100.00, zipcode: zipcode, seller: seller, thumbnailHD: thumbnailHd, date: date))
                    
                }
                
                completion(products)
            }
        }
    }
    
    
    
    func makeTransction(trasaction: [String: Any]){
        
        let url = "http://private-926595-shopsw1.apiary-mock.com/shopsw/payment"
        let parameters = trasaction
        
        Alamofire.request(url, method: .post, parameters: parameters, encoding: JSONEncoding.default).responseJSON { response in
            switch response.result {
            case .failure(let erro):
                print(erro)
            case .success(let value):
                let statusJSON = JSON(value)
                print(statusJSON)
            }
        }
        
    }
    
    
    func getImageFrom(url: String, completion: @escaping(UIImage?) -> ()) {
        var returnImage: UIImage? = nil
        Alamofire.request(url).responseImage { (response) in
            switch response.result {
            case .failure(let erro):
                print(erro)
            case .success( _):
                if let image = response.result.value {
                    print("image downloaded: \(image)")
                    returnImage = image
                }
                
            }
        }
        completion(returnImage)
    }
}











