//
//  Cart.swift
//  ShopStarWars
//
//  Created by Joao Gabriel Carvalho on 31/03/17.
//  Copyright © 2017 Joao Gabriel Carvalho. All rights reserved.
//

import Foundation

class Cart {
    
    static var itensInCart: [Item] = []
    static var lastTransactions: [Transaction] = []
    
    static func addToCart(item: Item) {
        itensInCart.append(item)
    }
    
    
    static func calculateTotal() -> Double{
        var total = 0.0
        for item in itensInCart {
            total += item.product.price * Double(item.quantity)
        }
        return total
    }
    
    static func addTransaction(transaction: Transaction){
        lastTransactions.append(transaction)
    }
    
    static func RemoveAll() {
        itensInCart = []
    }
}
