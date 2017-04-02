//
//  SWListView.swift
//  ShopStarWars
//
//  Created by Joao Gabriel Carvalho on 01/04/17.
//  Copyright © 2017 Joao Gabriel Carvalho. All rights reserved.
//

import UIKit
import TinyConstraints

class SWListView: UIView {
    
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        applyStyle()
        placeSubviews()
        setToEmptyState()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    var titleLabel: UILabel = UILabel()
    var contentContainer: UIStackView = UIStackView()
    var emptyStatement: String = "Não há conteúdo disponível"
    private var emptyLabel: UILabel = UILabel()
    
    private var isEmpity = true
    
    func cleanEmptyState() {
        contentContainer.removeArrangedSubview(emptyLabel)
        contentContainer.alignment = .leading
        contentContainer.distribution = .equalSpacing
    }
    
    func setToEmptyState() {
        contentContainer.addArrangedSubview(emptyLabel)
        contentContainer.alignment = .center
        contentContainer.distribution = .equalCentering
        emptyLabel.text = emptyStatement
        emptyLabel.textAlignment = .center
        isEmpity = true
    }
    
    func arrangeView(view: UIView){
        cleanEmptyState()
        view.translatesAutoresizingMaskIntoConstraints = false
        self.addSubview(view)
        view.height(min: 30)
        view.right(to: contentContainer)
        view.left(to: contentContainer)
        contentContainer.addArrangedSubview(view)
    }
    
    private func applyStyle() {
        titleLabel.font = UIFont(name: "Avenir-Medium", size: 18)
        contentContainer.axis = .vertical
        contentContainer.alignment = .leading
        contentContainer.distribution = .equalSpacing
    }
    
    private func placeSubviews(){
        
        self.addSubview(titleLabel)
        self.addSubview(contentContainer)
        
        titleLabel.translatesAutoresizingMaskIntoConstraints = false
        contentContainer.translatesAutoresizingMaskIntoConstraints = false
        
        titleLabel.top(to: self)
        titleLabel.left(to: self)
        titleLabel.right(to: self)
        titleLabel.height(30)
        
        contentContainer.top(to: titleLabel, titleLabel.bottomAnchor)
        contentContainer.left(to: self)
        contentContainer.right(to: self)
        contentContainer.bottom(to: self)
        
    }
}
