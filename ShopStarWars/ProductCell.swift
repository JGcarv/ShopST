//
//  ProductCell.swift
//  ShopStarWars
//
//  Created by Joao Gabriel Carvalho on 21/03/17.
//  Copyright © 2017 Joao Gabriel Carvalho. All rights reserved.
//

import UIKit

class ProductCell: UICollectionViewCell {
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        backgroundColor = .green
        placeSubViews()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    // Create Subviews 
    
    let avatarImage: UIImageView = {
        let image = UIImageView()
        image.backgroundColor = .red
        return image
    }()
    
    let productTitle: UILabel = {
        let label = UILabel()
        label.text = "STROMTROOPER DE BRINQUEDO"
        label.backgroundColor = .yellow
        return label
    }()
    
    let priceLabel: UILabel = {
        let label = UILabel()
        label.text = "R$79,90"
        label.backgroundColor = .blue
        return label
    }()
    
    let sellerLabel: UILabel = {
        let label = UILabel()
        label.text = "vendido por Marcelo"
        label.backgroundColor = .darkGray
        return label
    }()
    
    let buyButton: UIButton = {
        let button = UIButton()
        button.titleLabel?.text = "Adicionar ao carrinho"
        button.titleLabel?.textColor = .black
        button.backgroundColor = .white
        return button
    }()
    
    
    func placeSubViews(){
        addSubview(avatarImage)
        addSubview(productTitle)
        addSubview(priceLabel)
        addSubview(sellerLabel)
        addSubview(buyButton)
        
        avatarImage.translatesAutoresizingMaskIntoConstraints = false
        productTitle.translatesAutoresizingMaskIntoConstraints = false
        priceLabel.translatesAutoresizingMaskIntoConstraints = false
        sellerLabel.translatesAutoresizingMaskIntoConstraints = false
        buyButton.translatesAutoresizingMaskIntoConstraints = false

        
        avatarImage.leftAnchor.constraint(equalTo: self.leftAnchor, constant: 8).isActive = true
        avatarImage.topAnchor.constraint(equalTo: self.topAnchor, constant: 8).isActive = true
        avatarImage.widthAnchor.constraint(equalTo: self.widthAnchor, multiplier: 0.35).isActive = true
        avatarImage.heightAnchor.constraint(equalTo: self.heightAnchor, multiplier: 0.9).isActive = true
        
        productTitle.leftAnchor.constraint(equalTo: avatarImage.rightAnchor, constant: 13).isActive = true
        productTitle.rightAnchor.constraint(equalTo: self.rightAnchor, constant: -8).isActive = true
        productTitle.topAnchor.constraint(equalTo: self.topAnchor, constant: 8).isActive = true
        productTitle.heightAnchor.constraint(equalTo: self.heightAnchor, multiplier: 0.25).isActive = true
        
        priceLabel.leftAnchor.constraint(equalTo: avatarImage.rightAnchor, constant: 13).isActive = true
        priceLabel.topAnchor.constraint(equalTo: productTitle.bottomAnchor, constant: 8).isActive = true
        priceLabel.heightAnchor.constraint(equalTo: self.heightAnchor, multiplier: 0.15).isActive = true
        priceLabel.widthAnchor.constraint(equalTo: self.widthAnchor, multiplier: 0.06)
        
        buyButton.topAnchor.constraint(equalTo: priceLabel.bottomAnchor, constant: 8).isActive = true
        buyButton.leftAnchor.constraint(equalTo: avatarImage.rightAnchor, constant: 13).isActive = true
        buyButton.rightAnchor.constraint(equalTo: self.rightAnchor, constant: -8).isActive = true
        buyButton.bottomAnchor.constraint(equalTo: sellerLabel.topAnchor, constant: -8)
        
        sellerLabel.leftAnchor.constraint(equalTo: avatarImage.rightAnchor, constant: 13).isActive = true
        sellerLabel.bottomAnchor.constraint(equalTo: avatarImage.bottomAnchor).isActive = true
        sellerLabel.rightAnchor.constraint(equalTo: self.rightAnchor, constant: -8).isActive = true
        sellerLabel.heightAnchor.constraint(equalTo: self.heightAnchor, multiplier: 0.2)
        
        
    }
    
}
