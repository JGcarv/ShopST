//
//  CartView.swift
//  ShopStarWars
//
//  Created by Joao Gabriel Carvalho on 01/04/17.
//  Copyright © 2017 Joao Gabriel Carvalho. All rights reserved.
//

import UIKit
import TinyConstraints


class CartView: UIView {
    
    private var items: [Item] = []
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        self.backgroundColor = .white
        //placeSubviews()
        
//        let cartContainer = UIStackView()
//        cartContainer.translatesAutoresizingMaskIntoConstraints = false
//        self.addSubview(cartContainer)
//        cartContainer.backgroundColor = .yellow
//        cartContainer.edges(to: self, insets: UIEdgeInsets(top: 80, left: 0, bottom: -10, right: 0))
//        cartContainer.alignment = .center
//        cartContainer.axis = .vertical


        
        
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
//    let cartContainer: UIStackView = {
//        let container = UIStackView()
//        container.backgroundColor = .yellow
//        container.axis = .vertical
//        
//        return container
//    }()
    
    func cartCont(){
        let cartContainer = UIStackView()
        cartContainer.translatesAutoresizingMaskIntoConstraints = false
        self.addSubview(cartContainer)
        cartContainer.backgroundColor = .yellow
        cartContainer.edges(to: self)
    }
    
    let headerLabel: UILabel = {
        let label = UILabel()
        label.text = "Resumo de Itens"
        label.font = UIFont(name: "Avenir-Book", size: 22)
        label.textColor = .SWBlue
        return label
    }()
    
    let listContainer: UIView = {
        let view = UIView()
        //view.backgroundColor = .orange
        view.layer.borderColor = UIColor.SWBlue.cgColor
        view.layer.borderWidth = 1
        return view
    }()

    let totalLabel: UILabel = {
        let label = UILabel()
        label.text = "Total: RS1000"
        label.textAlignment = NSTextAlignment.right
        label.font = UIFont(name: "Avenir-Book", size: 20)
        
        return label
    }()
    
    let buyButton: UIButton = {
        let button = UIButton()
        button.setTitle("Finalizar Pagamento", for: .normal)
        button.setTitleColor(.white, for: .normal)
        button.backgroundColor = .SWRed
        button.titleLabel?.font = UIFont(name: "Avenir-Medium", size: 18)
        button.layer.cornerRadius = 8
        return button
    }()
    
    private func placeSubviews(){
        
        addSubview(headerLabel)
        addSubview(totalLabel)
        addSubview(buyButton)
        addSubview(listContainer)        
        
        totalLabel.translatesAutoresizingMaskIntoConstraints = false
        buyButton.translatesAutoresizingMaskIntoConstraints = false
        headerLabel.translatesAutoresizingMaskIntoConstraints = false
        listContainer.translatesAutoresizingMaskIntoConstraints = false
        
        totalLabel.top(to: listContainer, listContainer.bottomAnchor)
        totalLabel.rightAnchor.constraint(equalTo: self.rightAnchor, constant: -30).isActive = true
        totalLabel.right(to: self)
        listContainer.height(60, priority: .low, isActive: true)
        
        headerLabel.edges(to: self, insets: UIEdgeInsets(top: 50, left: 30, bottom: -600, right: -30))
        headerLabel.heightAnchor.constraint(equalToConstant: 60).isActive = true
        
        listContainer.top(to: headerLabel, headerLabel.bottomAnchor)
        listContainer.leftAnchor.constraint(equalTo: self.leftAnchor, constant: 30).isActive = true
        //listContainer.rightAnchor.constraint(equalTo: self.rightAnchor, constant: -30).isActive = true
        listContainer.right(to: self, offset: -30)
        listContainer.height(200, priority: .high, isActive: true)
        //listContainer.width(self.bounds.width - 60, priority: .high, isActive: true)
        listContainer.height(min: 200)
        
        let itensInList = [displayInList(), displayInList(),displayInList(), displayInList(),displayInList(), displayInList(), UIView()]
        listContainer.stack(itensInList, axis: .vertical, spacing: 10)
        
        buyButton.edges(to: self, insets: UIEdgeInsets(top: self.bounds.height / 8, left: 40, bottom: -30, right: -40))
        buyButton.heightAnchor.constraint(equalToConstant: 50).isActive = true
 
    }
    
    func displayInList() -> UIView {
        let nameLabel = UILabel()
        nameLabel.text = "Moletom Vader"
        
        let priceLabel = UILabel()
        priceLabel.text = String(format: "R$%.2f", 79999.0)
        
        let quantLabel = UILabel()
        quantLabel.text = String(format: "%ix", 2)
        
        let labels = [nameLabel, quantLabel, priceLabel]
        let view = UIView()
        view.stack(labels, axis: .horizontal, spacing: 25)
        return view
    }
    
     func addItemToList(item: Item) {
        items.append(item)
    }
    
}
