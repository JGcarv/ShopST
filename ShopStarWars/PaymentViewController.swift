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
    
    
    let containerPayment = UIView()
    let payForm = UIStackView()
    let buyButton = UIButton()
    let cardName = AKMaskField()
    let cardNumber = AKMaskField()
    let cardCvv = AKMaskField()
    let cardDate = AKMaskField()
    let valorLabel = UILabel()
    let cardLabel = UILabel()
    let nameLabel = UILabel()
    let cvvLabel = UILabel()
    let dateLabel = UILabel()
    let payTitleLabel = UILabel()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.tabBarController?.tabBar.isHidden = true
        
        view.backgroundColor = .white
        setNavigationBarStyle()
        
        //Behaviours relates to layout and style are in the PaymentViewController extension
        addConstraintsToViews()
        configAndStyleViews()
        
        cardName.addTarget(self, action: #selector(editingChaged(_:)), for: .editingChanged)
        cardNumber.addTarget(self, action: #selector(editingChaged(_:)), for: .editingChanged)
        cardCvv.addTarget(self, action: #selector(editingChaged(_:)), for: .editingChanged)
        cardDate.addTarget(self, action: #selector(editingChaged(_:)), for: .editingChanged)
    }
    
   
    private func isAllFilled() -> Bool {
        if (cardNumber.maskStatus == .complete && cardDate.maskStatus == .complete && cardCvv.maskStatus == .complete && cardName.text != ""){
            return true
        } else {
        return false
        }
    }
    
    func editingChaged(_ textField: UITextField){
        if(!isAllFilled()){
            if (buyButton.isEnabled){
                buyButton.isEnabled = false
            }
            return
        }
        buyButton.isEnabled = true
    }

    
    func processPayment(){
        
        //build transaction
        let valor = Int(Cart.calculateTotal() * 100)
        let name = cardName.text!
        let num = cardNumber.text!
        let cvv = Int(cardCvv.text!)!
        let expDate = cardDate.text!

        
        let tx = ["card_number": num,
                  "value":valor,
                  "cvv":cvv,
                  "card_holder_name":name,
                  "exp_date":expDate] as [String : Any]
        
        Service.sharedInstance.makeTransction(trasaction: tx) { (status) in
            if (status == "successful"){
                let alert = UIAlertController(title: "Pronto!", message: "Pagamento concluído com sucesso", preferredStyle: UIAlertControllerStyle.alert)
                alert.addAction(UIAlertAction(title: "OK", style: UIAlertActionStyle.default, handler: { (action) in
                    let date = Date()
                    let newTx = Transaction(date: date, valor: Cart.calculateTotal())
                    Cart.addTransaction(transaction: newTx)
                    let carrVC = self.navigationController?.viewControllers[0] as! CartController
                    carrVC.addTransaction(tx: newTx)
                    //remover todos os itens do Cart
                    Cart.RemoveAll()
                    self.navigationController?.popToRootViewController(animated: true)
                }))
                
                self.present(alert, animated: true, completion: nil)
                
            } else {
                let alert = UIAlertController(title: "Oops!", message: "Houve um problema com o pagamento", preferredStyle: UIAlertControllerStyle.alert)
                alert.addAction(UIAlertAction(title: "OK", style: UIAlertActionStyle.default, handler: { (action) in
                    self.navigationController?.popToRootViewController(animated: true)
                }))
                
                self.present(alert, animated: true, completion: nil)
            }
            
        }
    }
}
