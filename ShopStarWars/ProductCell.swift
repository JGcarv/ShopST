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
        backgroundColor = .black
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    // Create Subviews 
    
    let avatarImage: UIImageView = {
        let image = UIImageView()
        
        return image
    }()
    
    let productTitle: UILabel = {
        let label = UILabel()
        
        return label
    }()
    
    let priceLabel: UILabel = {
        let label = UILabel()
        
        return label
    }()
    
    let sellerLabel: UILabel = {
        let label = UILabel()
        
        return label
    }()
    
    func placeSubViews(){
        addSubview(avatarImage)
        addSubview(productTitle)
        addSubview(priceLabel)
        addSubview(sellerLabel)
        
    }
    
}
