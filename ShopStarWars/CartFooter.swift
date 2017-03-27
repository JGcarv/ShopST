//
//  CartFooter.swift
//  ShopStarWars
//
//  Created by Joao Gabriel Carvalho on 23/03/17.
//  Copyright © 2017 Joao Gabriel Carvalho. All rights reserved.
//

import UIKit
import TinyConstraints


class CartFooter: UICollectionViewCell {
    
    var delegate: CartFooterDelegate?

    override init(frame: CGRect) {
        super.init(frame: frame)
        placeSubViews()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    private func placeSubViews(){
        
        
        let buyButton: UIButton = {
            let button = UIButton()
            button.addTarget(self, action: #selector(pay), for: .touchUpInside)
            button.setTitle("Finalizar Pagamenro", for: .normal)
            return button
        }()
        
        addSubview(buyButton)
 
        buyButton.translatesAutoresizingMaskIntoConstraints = false
        buyButton.edges(to: self, insets: UIEdgeInsets(top: 60, left: 10, bottom: -10, right: -10))

    }
    
    func pay(){
        //Do soemething?
        self.delegate?.launchPaymentView();
        print("view lançada")
    }
}
