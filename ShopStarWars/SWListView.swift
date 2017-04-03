//
//  SWListView.swift
//  ShopStarWars
//
//  Created by Joao Gabriel Carvalho on 01/04/17.
//  Copyright © 2017 Joao Gabriel Carvalho. All rights reserved.
//

import UIKit
import TinyConstraints
import SwiftIconFont

class SWListView: UIView {
    
    var titleLabel: UILabel = UILabel()
    var contentContainer: UIStackView = UIStackView()
    var emptyStatement: String = "Não há conteúdo disponível"
    
    
    private let textLabel = UILabel()
    private let iconLabel = UILabel()
    private let fillerView = UIView()
    private var isEmpty = true
    private var hasFiller = false
    
    
    
    override init(frame: CGRect) {
        super.init(frame: frame)

        //create empty labels
        textLabel.text = emptyStatement
        textLabel.font = UIFont(name: "Avenir-Book", size: 14)
        textLabel.textColor = .white
        textLabel.backgroundColor = UIColor(white: 0, alpha: 0.3)
        textLabel.textAlignment = .center
        
        iconLabel.font = UIFont.icon(from: .FontAwesome, ofSize: 50)
        iconLabel.text = String.fontAwesomeIcon("frown-o")
        iconLabel.textColor = .white
        iconLabel.backgroundColor = UIColor(white: 0, alpha: 0.3)
        iconLabel.textAlignment = .center
        
        
        placeSubviews()
        config()
        setToEmptyState()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    //Remove empty label and styling
    private func cleanEmptyState() {
        contentContainer.removeArrangedSubview(iconLabel)
        contentContainer.removeArrangedSubview(textLabel)
        contentContainer.distribution = .fill
        isEmpty = false
    }

    func setToEmptyState() {
        removeAllViews()
        contentContainer.addArrangedSubview(iconLabel)
        contentContainer.addArrangedSubview(textLabel)
        contentContainer.distribution = .fillEqually
        textLabel.left(to: contentContainer)
        textLabel.right(to: contentContainer)
        iconLabel.left(to: contentContainer)
        iconLabel.right(to: contentContainer)
        isEmpty = true
    }
    
    func removeAllViews() {
        for view in contentContainer.arrangedSubviews {
            contentContainer.removeArrangedSubview(view)
        }
    }
    
    
    func arrangeView(view: UIView){
        if (isEmpty){
            cleanEmptyState()
        }
        view.translatesAutoresizingMaskIntoConstraints = false
        self.addSubview(view)
        view.height(max: 30)
        view.width(contentContainer.layer.bounds.width, priority: .high, isActive: true)
        contentContainer.addArrangedSubview(view)
        if !hasFiller {
            self.addSubview(fillerView)
            contentContainer.addArrangedSubview(fillerView)
            hasFiller = false
        }
        
    }
    
    func setEmptyLabelText(newText: String){
        emptyStatement = newText
        textLabel.text = emptyStatement
    }
    
    //Styling and Configuration
    private func config(){
        titleLabel.font = UIFont(name: "Avenir-Medium", size: 18)
        titleLabel.textColor = .SWBlue
        contentContainer.axis = .vertical
    }
    
    
    private func placeSubviews(){
        
        self.addSubview(titleLabel)
        self.addSubview(contentContainer)
        
        titleLabel.translatesAutoresizingMaskIntoConstraints = false
        contentContainer.translatesAutoresizingMaskIntoConstraints = false
        
        titleLabel.top(to: self)
        titleLabel.left(to: self)
        titleLabel.right(to: self)
        //titleLabel.height(max: 30)
        titleLabel.height(30, priority: .high, isActive: true)
        
        contentContainer.top(to: titleLabel, titleLabel.bottomAnchor)
        contentContainer.left(to: self)
        contentContainer.right(to: self)
//        contentContainer.width(self.layer.bounds.width, priority: .high, isActive: true)
        contentContainer.bottom(to: self)
    }
}
