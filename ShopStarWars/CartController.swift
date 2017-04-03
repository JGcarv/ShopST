//
//  CartController.swift
//  ShopStarWars
//
//  Created by Joao Gabriel Carvalho on 23/03/17.
//  Copyright © 2017 Joao Gabriel Carvalho. All rights reserved.
//

import UIKit
import TinyConstraints

class CartController: UIViewController {
    
    let containerCart = UIView()
    let itemsInCart = SWListView()
    let lastTx = SWListView()
    let totalLabel = UILabel()
    let buyButton = UIButton()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setNavigationBarStyle()
        self.title = "Carrinho"
        view.backgroundColor = .white
        
        placeAndConstrainSubviews()
        buyButton.isEnabled = false
        

    }
    
    func launchPaymentView() {
        let pvc = PaymentViewController()
        self.navigationController?.pushViewController(pvc, animated: true)

    }
    
    override func viewWillAppear(_ animated: Bool) {
        self.tabBarController?.tabBar.isHidden = false
        let total = Cart.calculateTotal()
        totalLabel.text = String(format: "Total: R$%.2f", total)
        updateCartList()
        updateTxList()
    }
    
    func addItemInCart(item: Item){
        buyButton.isEnabled = true
        let finalView = prepareItemForView(item: item)
        itemsInCart.arrangeView(view: finalView)
        
        let total = Cart.calculateTotal()
        totalLabel.text = String(format: "Total: R$%.2f", total)
 
    }
    
    func prepareItemForView(item: Item) -> UIView{
        let nome = item.product.title!
        let price = item.product.price!
        let quantity = item.quantity

        let nomeLabel = UILabel()
        nomeLabel.text = nome
        let priceLabel = UILabel()
        priceLabel.text = String(format: "R$%.2f", price)
        let quantLabel = UILabel()
        quantLabel.text = "\(quantity)x   "
        
        let view = UIStackView()
        view.axis = .horizontal
        view.distribution = .equalCentering
        self.view.addSubview(nomeLabel)
        self.view.addSubview(quantLabel)
        self.view.addSubview(priceLabel)
        view.addArrangedSubview(nomeLabel)
        view.addArrangedSubview(quantLabel)
        view.addArrangedSubview(priceLabel)
        
        return view
    }
    
    func prepareTxForView(tx: Transaction) -> UIView{
        let date = tx.date
        let price = tx.valor
        
        let dateLabel = UILabel()
        let formater = DateFormatter()
        formater.dateFormat = "dd/MM/yyyy HH:mm"
        dateLabel.text = formater.string(from: date)
        
        
        let priceLabel = UILabel()
        priceLabel.text = String(format: "valor: R$%.2f", price)
        
        let view = UIStackView()
        view.axis = .horizontal
        view.distribution = .equalCentering
        self.view.addSubview(dateLabel)
        self.view.addSubview(priceLabel)
        view.addArrangedSubview(dateLabel)
        view.addArrangedSubview(priceLabel)
        
        return view
    }
    
    func addTransaction(tx: Transaction){
        let finalView = prepareTxForView(tx: tx)
        lastTx.arrangeView(view: finalView)
    }

    func updateCartList() {
        if (Cart.itensInCart.count == 0){
            itemsInCart.setToEmptyState()
        } else if(Cart.itensInCart.count != itemsInCart.contentContainer.arrangedSubviews.count - 1){
            for item in Cart.itensInCart{
                addItemInCart(item: item)
            }
        }
    }
    
    func updateTxList() {
        if (Cart.lastTransactions.count == 0){
            lastTx.setToEmptyState()
        } else if (Cart.lastTransactions.count != lastTx.contentContainer.arrangedSubviews.count - 1) {
            lastTx.setToEmptyState()
            for transaction in Cart.lastTransactions{
                addTransaction(tx: transaction)
            }
        }
    }
}

