//
//  CartControllerExt.swift
//  ShopStarWars
//
//  Created by Joao Gabriel Carvalho on 03/04/17.
//  Copyright © 2017 Joao Gabriel Carvalho. All rights reserved.
//

import UIKit
import TinyConstraints

extension CartController {
    
    func placeAndConstrainSubviews(){
        
        self.view.addSubview(containerCart)
        //container.clipsToBounds = true
        
        containerCart.edges(to: self.view, insets: UIEdgeInsets(top: 80, left: 24, bottom: -10, right: -24))
        containerCart.left(to: self.view, offset: 24)
        containerCart.width(self.view.bounds.width - 48, priority: .high, isActive: true)
        containerCart.right(to: self.view, offset: -24)
        
        //let itemsInCart = SWListView()
        itemsInCart.titleLabel.text = "Resumo de items"
        itemsInCart.setEmptyLabelText(newText: "Não há produtos no carrinho")
        lastTx.titleLabel.text = "Histórico de Compras"
        lastTx.setEmptyLabelText(newText: "Ainda não há transações")
        
        
        
        totalLabel.text = "Total: R$00,00"
        totalLabel.textAlignment = NSTextAlignment.right
        totalLabel.font = UIFont(name: "Avenir-Book", size: 20)
        
        
        buyButton.setTitle("Finalizar Pagamento", for: .normal)
        buyButton.setTitleColor(.white, for: .normal)
        buyButton.titleLabel?.font = UIFont(name: "Avenir-Medium", size: 18)
        buyButton.setBackgroundColor(color: .SWRedDisabled, forState: .disabled)
        buyButton.setBackgroundColor(color: .SWRed, forState: .normal)
        buyButton.addTarget(self, action: #selector(launchPaymentView), for: .touchUpInside)
        buyButton.layer.cornerRadius = 8
        
        containerCart.translatesAutoresizingMaskIntoConstraints = false
        itemsInCart.translatesAutoresizingMaskIntoConstraints = false
        lastTx.translatesAutoresizingMaskIntoConstraints = false
        totalLabel.translatesAutoresizingMaskIntoConstraints = false
        buyButton.translatesAutoresizingMaskIntoConstraints = false
        
        containerCart.addSubview(itemsInCart)
        containerCart.addSubview(totalLabel)
        containerCart.addSubview(lastTx)
        containerCart.addSubview(buyButton)
        
        itemsInCart.top(to: containerCart)
        itemsInCart.right(to: containerCart)
        itemsInCart.left(to: containerCart)
        itemsInCart.height(min: 200)
        
        totalLabel.top(to: itemsInCart, itemsInCart.bottomAnchor)
        totalLabel.left(to: containerCart)
        totalLabel.right(to: containerCart)
        totalLabel.height(40)
        
        lastTx.top(to: totalLabel, totalLabel.bottomAnchor)
        lastTx.left(to: containerCart)
        lastTx.right(to: containerCart)
        lastTx.height(min: 200)
        
        //buyButton.top(to: lastTx, lastTx.bottomAnchor)
        buyButton.height(50)
        buyButton.left(to: containerCart, offset:25)
        buyButton.right(to: containerCart, offset: -25)
        buyButton.bottom(to: containerCart)
        
        buyButton.isEnabled = false
    }
}
