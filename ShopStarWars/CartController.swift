//
//  CartController.swift
//  ShopStarWars
//
//  Created by Joao Gabriel Carvalho on 23/03/17.
//  Copyright © 2017 Joao Gabriel Carvalho. All rights reserved.
//

import UIKit
import TinyConstraints

class CartController: UIViewController, CartFooterDelegate {
    
    let cartView: CartView = CartView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setNavigationBarStyle()
        self.title = "Carrinho"
        view.backgroundColor = .white
        
        placeSubviews()
    }
    
    func placeSubviews(){
        let container = UIView()
        self.view.addSubview(container)
        //container.clipsToBounds = true
        
        container.edges(to: self.view, insets: UIEdgeInsets(top: 80, left: 24, bottom: -10, right: -24))
        
        let itemsInCart = SWListView()
        itemsInCart.titleLabel.text = "Resumo de items"
        
        let lastTx = SWListView()
        lastTx.titleLabel.text = "Histórico de Compras"

        
        let totalLabel = UILabel()
        totalLabel.text = "Total: R$00,00"
        totalLabel.textAlignment = NSTextAlignment.right
        totalLabel.font = UIFont(name: "Avenir-Book", size: 20)
        
        let buyButton = UIButton()
        buyButton.setTitle("Finalizar Pagamento", for: .normal)
        buyButton.setTitleColor(.white, for: .normal)
        buyButton.backgroundColor = .SWRed
        buyButton.titleLabel?.font = UIFont(name: "Avenir-Medium", size: 18)
        buyButton.layer.cornerRadius = 8
        buyButton.addTarget(self, action: #selector(launchPaymentView), for: .touchUpInside)
        
        
        container.translatesAutoresizingMaskIntoConstraints = false
        itemsInCart.translatesAutoresizingMaskIntoConstraints = false
        lastTx.translatesAutoresizingMaskIntoConstraints = false
        totalLabel.translatesAutoresizingMaskIntoConstraints = false
        buyButton.translatesAutoresizingMaskIntoConstraints = false
        
        container.addSubview(itemsInCart)
        container.addSubview(totalLabel)
        container.addSubview(lastTx)
        container.addSubview(buyButton)
        
        itemsInCart.top(to: container)
        itemsInCart.right(to: container)
        itemsInCart.left(to: container)
        itemsInCart.height(min: 200)
        
        totalLabel.top(to: itemsInCart, itemsInCart.bottomAnchor)
        totalLabel.left(to: container)
        totalLabel.right(to: container)
        totalLabel.height(40)
        
        lastTx.top(to: totalLabel, totalLabel.bottomAnchor)
        lastTx.left(to: container)
        lastTx.right(to: container)
        lastTx.height(min: 200)
        
        //buyButton.top(to: lastTx, lastTx.bottomAnchor)
        buyButton.height(50)
        buyButton.left(to: container, offset:25)
        buyButton.right(to: container, offset: -25)
        buyButton.bottom(to: container)
   
    }
    
    func launchPaymentView() {
        let pvc = PaymentViewController()
        self.navigationController?.pushViewController(pvc, animated: true)
    }
    
    override func viewWillAppear(_ animated: Bool) {
        self.tabBarController?.tabBar.isHidden = false
    }
 
}

protocol CartFooterDelegate {
    
    func launchPaymentView()
}

