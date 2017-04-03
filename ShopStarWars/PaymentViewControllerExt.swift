//
//  PaymentViewControllerExt.swift
//  ShopStarWars
//
//  Created by Joao Gabriel Carvalho on 03/04/17.
//  Copyright © 2017 Joao Gabriel Carvalho. All rights reserved.
//

import UIKit
import TinyConstraints
import AKMaskField

extension PaymentViewController {
    
    func addConstraintsToViews() {
        
        self.view.addSubview(containerPayment)
        
        containerPayment.translatesAutoresizingMaskIntoConstraints = false
        containerPayment.edges(to: self.view, insets: UIEdgeInsets(top: 80, left: 24, bottom: 0, right: -24))
        containerPayment.left(to: self.view, offset: 24)
        containerPayment.width(self.view.bounds.width - 48, priority: .high, isActive: true)
        containerPayment.right(to: self.view, offset: -24)
        
        
        payTitleLabel.text = "Informações de Pagamento"
        containerPayment.addSubview(payTitleLabel)
        
        containerPayment.addSubview(payForm)
        payForm.translatesAutoresizingMaskIntoConstraints = false
        payForm.axis = .vertical
        payForm.distribution = .equalSpacing
        payForm.top(to: containerPayment)
        payForm.left(to: containerPayment)
        payForm.right(to: containerPayment)
        payForm.height(300)
        
        
        containerPayment.addSubview(buyButton)
        buyButton.translatesAutoresizingMaskIntoConstraints = false
        buyButton.top(to: payForm, payForm.bottomAnchor, offset: 10)
        buyButton.left(to: containerPayment, offset: 30)
        buyButton.right(to: containerPayment, offset: -30)
        buyButton.height(50)
        
        containerPayment.addSubview(valorLabel)
        containerPayment.addSubview(cardLabel)
        containerPayment.addSubview(cardNumber)
        containerPayment.addSubview(cvvLabel)
        containerPayment.addSubview(cardCvv)
        containerPayment.addSubview(cardDate)
        containerPayment.addSubview(nameLabel)
        containerPayment.addSubview(cardName)
        
        payForm.addArrangedSubview(payTitleLabel)
        payForm.addArrangedSubview(valorLabel)
        payForm.addArrangedSubview(cardLabel)
        payForm.addArrangedSubview(cardNumber)
        payForm.addArrangedSubview(cvvLabel)
        payForm.addArrangedSubview(cardCvv)
        
        payForm.addArrangedSubview(dateLabel)
        payForm.addArrangedSubview(cardDate)
        payForm.addArrangedSubview(nameLabel)
        payForm.addArrangedSubview(cardName)
        
    }
    
    func configAndStyleViews(){
        
        buyButton.setTitle("Efetuar pagamento", for: .normal)
        buyButton.setTitleColor(.white, for: .normal)
        buyButton.setBackgroundColor(color: .SWRedDisabled, forState: .disabled)
        buyButton.setBackgroundColor(color: .SWRed, forState: .normal)
        buyButton.titleLabel?.font = UIFont(name: "Avenir-Medium", size: 18)
        buyButton.layer.cornerRadius = 8
        buyButton.addTarget(self, action: #selector(processPayment), for: .touchUpInside)
        buyButton.isEnabled = false
        
        
        let total = Cart.calculateTotal()
        valorLabel.text = String(format: "Total: R$%.2f", total)
        
        
        cardLabel.text = "Número do cartão"
        cardNumber.maskExpression = "{dddd} - {dddd} - {dddd} - {dddd}"
        cardNumber.maskTemplate = "número do cartão"
        
        
        nameLabel.text = "Nome"
        cardName.placeholder = "nome como está no cartão"
        
        
        cvvLabel.text = "Código de segurança"
        cardCvv.maskExpression = "{ddd}"
        cardCvv.maskTemplate = "xxx"
        
        
        dateLabel.text = "Data de expiração"
        cardDate.maskExpression = "{dd}/{dd}"
        cardDate.maskTemplate = "mm/aa"
        
    }
    
    
}
