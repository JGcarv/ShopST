//
//  CartController.swift
//  ShopStarWars
//
//  Created by Joao Gabriel Carvalho on 23/03/17.
//  Copyright © 2017 Joao Gabriel Carvalho. All rights reserved.
//

import UIKit

class CartController: UICollectionViewController, UICollectionViewDelegateFlowLayout, CartFooterDelegate {
    
    let cellId = "cellId"
    let headerId = "headerId"
    let footerId = "footer"
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setNavigationBarStyle()
        self.title = "Carrinho"
        
        collectionView?.backgroundColor = .white
        collectionView?.register(ProductCell.self, forCellWithReuseIdentifier: cellId)
        collectionView?.register(UICollectionViewCell.self, forSupplementaryViewOfKind: UICollectionElementKindSectionHeader, withReuseIdentifier: headerId)
        collectionView?.register(CartFooter.self, forSupplementaryViewOfKind: UICollectionElementKindSectionFooter, withReuseIdentifier: footerId)
        
    }
    
    
    //Itens
    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 2
    }
    
    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: cellId, for: indexPath)
        return cell
        }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: view.frame.width, height: 50)
    }
    
    
    //Header and Footer
    override func collectionView(_ collectionView: UICollectionView, viewForSupplementaryElementOfKind kind: String, at indexPath: IndexPath) -> UICollectionReusableView {
        
        if kind == UICollectionElementKindSectionHeader {
            let header = collectionView.dequeueReusableSupplementaryView(ofKind: kind, withReuseIdentifier: headerId, for: indexPath)
            header.backgroundColor = .blue
            return header
        } else {
            let footer = collectionView.dequeueReusableSupplementaryView(ofKind: kind, withReuseIdentifier: footerId, for: indexPath) as! CartFooter
            footer.backgroundColor = .blue
            footer.delegate = self
            return footer
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, referenceSizeForHeaderInSection section: Int) -> CGSize {
        return CGSize(width: view.frame.width, height: 50)
    }
    
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, referenceSizeForFooterInSection section: Int) -> CGSize {
         return CGSize(width: view.frame.width, height: 200)
    }
    
    func launchPaymentView() {
        self.navigationController?.pushViewController(PaymentViewController(collectionViewLayout: UICollectionViewFlowLayout()), animated: true)
    }
    
    override func viewWillAppear(_ animated: Bool) {
        self.tabBarController?.tabBar.isHidden = false
    }
 
}

protocol CartFooterDelegate {
    
    func launchPaymentView()
}

