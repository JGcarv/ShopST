//
//  PaymentView.swift
//  ShopStarWars
//
//  Created by Joao Gabriel Carvalho on 23/03/17.
//  Copyright © 2017 Joao Gabriel Carvalho. All rights reserved.
//

import UIKit
import TinyConstraints
import SwiftyJSON
import AKMaskField

class PaymentViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.tabBarController?.tabBar.isHidden = true
        
        view.backgroundColor = .white
        setNavigationBarStyle()
        
        let container = UIView()
        self.view.addSubview(container)
        container.translatesAutoresizingMaskIntoConstraints = false
        container.edges(to: self.view, insets: UIEdgeInsets(top: 80, left: 24, bottom: 0, right: -24))
        
        let payInfo = SWListView()
        payInfo.titleLabel.text = "Informações de pagamento"
        payInfo.translatesAutoresizingMaskIntoConstraints = false
        
        container.addSubview(payInfo)
        
        payInfo.top(to: container)
        payInfo.left(to: container)
        payInfo.right(to: container)
        payInfo.height(300)
        
        let buyButton = UIButton()
        buyButton.setTitle("Efetuar pagamento", for: .normal)
        buyButton.setTitleColor(.white, for: .normal)
        buyButton.setBackgroundColor(color: .SWRedDisabled, forState: .disabled)
        buyButton.setBackgroundColor(color: .SWRed, forState: .normal)
        buyButton.titleLabel?.font = UIFont(name: "Avenir-Medium", size: 18)
        buyButton.layer.cornerRadius = 8
        buyButton.addTarget(self, action: #selector(processPayment), for: .touchUpInside)
        buyButton.isEnabled = false
        
        container.addSubview(buyButton)
        buyButton.translatesAutoresizingMaskIntoConstraints = false

        buyButton.top(to: payInfo, payInfo.bottomAnchor, offset: 10)
        buyButton.left(to: container, offset: 30)
        buyButton.right(to: container, offset: -30)
        buyButton.height(50)
        
        let valorLabel = UILabel()
        valorLabel.text = "R$00,00"
        
        let cardLabel = UILabel()
        cardLabel.text = "Número do cartão"
        
        
        cardNumber.maskExpression = "{dddd} - {dddd} - {dddd} - {dddd}"
        cardNumber.maskTemplate = "número do cartão"
        
        let nameLabel = UILabel()
        nameLabel.text = "Nome como está no Cartão"
        
        //cardName = AKMaskField()
        cardName.placeholder = "nome"
        
        let cvvLabel = UILabel()
        cvvLabel.text = "Código de segurança"
        
        
        cardCvv.maskExpression = "{ddd}"
        
        let dateLabel = UILabel()
        dateLabel.text = "Data de expiração"
        
        
        cardDate.maskExpression = "{dd}/{dd}"
        cardDate.maskTemplate = "dd/mm"
        
        
        payInfo.arrangeView(view: valorLabel)
        payInfo.arrangeView(view: nameLabel)
        payInfo.arrangeView(view: cardName)
        payInfo.arrangeView(view: cardLabel)
        payInfo.arrangeView(view: cardNumber)
        payInfo.arrangeView(view: cvvLabel)
        payInfo.arrangeView(view: cardCvv)
        payInfo.arrangeView(view: dateLabel)
        payInfo.arrangeView(view: cardDate)

        
    }
    
    let cardName = AKMaskField()
    let cardNumber = AKMaskField()
    let cardCvv = AKMaskField()
    let cardDate = AKMaskField()
   
    
    func processPayment(){
        let str = cardNumber.text!
        print(cardName.maskStatus)
        
        let str2 = str.replacingOccurrences(of: " - ", with: "")
        //print(str2)
        
        let tx = ["card_number":"1234123412341234",
                  "value":7990,
                  "cvv":789,
                  "card_holder_name":"Luke Skywalker",
                  "exp_date":"12/24"] as [String : Any]
        
        Service.sharedInstance.makeTransction(trasaction: tx)
    }
}
