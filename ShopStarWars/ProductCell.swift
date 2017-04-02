//
//  ProductCell.swift
//  ShopStarWars
//
//  Created by Joao Gabriel Carvalho on 21/03/17.
//  Copyright © 2017 Joao Gabriel Carvalho. All rights reserved.
//

import UIKit
import AlamofireImage

class ProductCell: UICollectionViewCell {
    
    var delegate: CollectionViewControllerDelegate?
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        backgroundColor = .white
        
        productTitle = UILabel()
        sellerLabel = UILabel()
        setUpButtons()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setUpButtons() {
        
        buyButton = UIButton()
        buyButton.layer.cornerRadius = 8
        
        buyButton.setTitle("Comprar", for: .normal)
        buyButton.titleLabel?.font = UIFont(name: "Avenir-Medium", size: 14)
        buyButton.titleLabel?.textColor = .white
        buyButton.addTarget(self, action: #selector(sendItemToDelegate), for: .touchUpInside)
        //button.addTarget(self, action: self.delegate?.addToCart, for: .touchUpInside)
        buyButton.backgroundColor = .SWRed

        plusQuantButton = UIButton()
        plusQuantButton.layer.cornerRadius = 16
        plusQuantButton.setTitle("+", for: .normal)
        plusQuantButton.titleLabel?.font = UIFont(name: "Avenir-Medium", size: 15)
        plusQuantButton.addTarget(self, action: #selector(increaseQuantity), for: .touchUpInside)
        plusQuantButton.setTitleColor(.SWRed, for: .normal)
        
        minusQuantButton = UIButton()
        minusQuantButton.layer.cornerRadius = 16
        minusQuantButton.setTitle("-", for: .normal)
        minusQuantButton.titleLabel?.font = UIFont(name: "Avenir-Medium", size: 15)
        minusQuantButton.addTarget(self, action: #selector(decreaseQuantity), for: .touchUpInside)
        minusQuantButton.setTitleColor(.SWRed, for: .normal)
 
        
    }
    
    var product: Product!{
        didSet{
            if product != nil {
                
                self.avatarImage = {
                    let imageView = UIImageView()
                    let url = URL(string: product.thumbnailHD)
                    imageView.backgroundColor = .red
                    imageView.af_setImage(withURL: url!)
                    imageView.contentMode = .scaleAspectFill
                    imageView.layer.cornerRadius = 5
                    imageView.clipsToBounds = true
                    return imageView
                }()
                
                self.productTitle = {
                    let label = UILabel()
                    label.text = product.title
                    label.font = UIFont(name: "Avenir-Medium", size: 17)
                    label.lineBreakMode = .byWordWrapping
                    label.numberOfLines = 2
                    return label
                }()
                
                self.priceLabel = {
                    let label = UILabel()
                    let priceString = String(format: "R$%.2f", product.price)
                    label.text = priceString
                    label.font = UIFont(name: "Avenir-Book", size: 13)
                    return label
                }()
                
                self.sellerLabel.font = UIFont(name: "Avenir-book", size: 11)
                self.sellerLabel.text = "Vendido por " + product.seller
 
                placeSubViews()

            }
        }
    }
    
    var avatarImage: UIImageView!
    var productTitle: UILabel!
    var priceLabel: UILabel!
    var dateLabel: UILabel!
    var sellerLabel: UILabel!
    var buyButton: UIButton!
    var minusQuantButton: UIButton!
    var plusQuantButton:UIButton!
    var quantity = 1
    
    //let buyButton: UIButton = {
        //let button = UIButton()
        //buyButton.layer.cornerRadius = 8
        
        //buyButton.setTitle("Comprar", for: .normal)
        //buyButton.titleLabel?.font = UIFont(name: "Avenir-Medium", size: 14)
        //buyButton.titleLabel?.textColor = .white
        //buyButton.addTarget(self, action: #selector(sendItemToDelegate), for: .touchUpInside)
        //button.addTarget(self, action: self.delegate?.addToCart, for: .touchUpInside)
        //buyButton.backgroundColor = .SWRed
        //return button
    //}()
    
    let contentContainer: UIView = {
        let view = UIView()
        //view.backgroundColor = .yellow
        return view
    }()
    
    let quantityContainer: UIView = {
        let view = UIView()
        //view.backgroundColor = .yellow
        return view
    }()
    
    let quantLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont(name: "Avenir-Medium", size: 16)
        label.text = "1"
        return label
    }()
    
    
    //Temporary solution to avoid stacking labels when the cell is reused.
    override func prepareForReuse() {
        self.product = nil
        productTitle.text = ""
        sellerLabel.text = ""
        priceLabel.text = ""

    }
    
    func sendItemToDelegate(){
        let item = Item(self.product, self.quantity)
        self.delegate?.addToCart(item: item)
    }
    
    func placeSubViews(){
        addSubview(avatarImage)
        addSubview(contentContainer)
        //addSubview(productTitle)
    
        //Turn off maskig so custom constraints can work
        avatarImage.translatesAutoresizingMaskIntoConstraints = false
        productTitle.translatesAutoresizingMaskIntoConstraints = false
        priceLabel.translatesAutoresizingMaskIntoConstraints = false
        sellerLabel.translatesAutoresizingMaskIntoConstraints = false
        buyButton.translatesAutoresizingMaskIntoConstraints = false
        contentContainer.translatesAutoresizingMaskIntoConstraints = false
        quantityContainer.translatesAutoresizingMaskIntoConstraints = false
        

        avatarImage.top(to: self)
        avatarImage.left(to: self)
        avatarImage.bottom(to: self)
        avatarImage.widthAnchor.constraint(equalToConstant: 150).isActive = true
        
        contentContainer.edges(to: self, insets: UIEdgeInsetsMake(10, 162, -10, -12))

        
        contentContainer.addSubview(productTitle)
        contentContainer.addSubview(priceLabel)
        contentContainer.addSubview(sellerLabel)
        contentContainer.addSubview(buyButton)
        contentContainer.addSubview(quantityContainer)
        

        productTitle.top(to: contentContainer)
        productTitle.right(to: contentContainer)
        productTitle.left(to: contentContainer)
        
        priceLabel.left(to: contentContainer)
        priceLabel.right(to: contentContainer)
        priceLabel.top(to: productTitle, productTitle.bottomAnchor)
        
        
        sellerLabel.left(to: contentContainer)
        sellerLabel.right(to: contentContainer)
        sellerLabel.top(to: priceLabel, priceLabel.bottomAnchor)

        buyButton.right(to: contentContainer)
        buyButton.bottom(to: contentContainer)
        buyButton.heightAnchor.constraint(equalToConstant: 30).isActive = true
        buyButton.widthAnchor.constraint(equalToConstant: 85).isActive = true
        
        quantityContainer.left(to: contentContainer)
        quantityContainer.bottom(to: contentContainer)
        quantityContainer.widthAnchor.constraint(equalToConstant: 70).isActive = true
        quantityContainer.heightAnchor.constraint(equalToConstant: 30).isActive = true
        
        quantityContainer.stack([minusQuantButton, quantLabel, plusQuantButton], axis: .horizontal, spacing:7)
    }
    
    func increaseQuantity() {
        self.quantity += 1
        self.quantLabel.text = String(self.quantity)
    }
    
    func decreaseQuantity() {
        if (quantity > 1 ){
            self.quantity -= 1
            self.quantLabel.text = String(self.quantity)
        }
    }
}
