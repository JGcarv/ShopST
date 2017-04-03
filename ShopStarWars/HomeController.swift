//
//  HomeController.swift
//  ShopStarWars
//
//  Created by Joao Gabriel Carvalho on 21/03/17.
//  Copyright © 2017 Joao Gabriel Carvalho. All rights reserved.
//

import UIKit

class HomeController: UICollectionViewController, UICollectionViewDelegateFlowLayout, CollectionViewControllerDelegate {
    
    let cellId = "cellId"
    var products: [Product] = []
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //Basic controller Confir
        self.title = "Shop Star Wars"
        setNavigationBarStyle()
        
        collectionView?.backgroundColor =  .SWGrey
        collectionView?.register(ProductCell.self, forCellWithReuseIdentifier: cellId)

        
        Service.sharedInstance.fetchProducts { (fetchedProducts) in
            self.products = fetchedProducts
            self.collectionView?.reloadData()
        }
    }
    
    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return products.count
    }
    
    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: cellId, for: indexPath) as! ProductCell
        cell.product = products[indexPath.item]
        cell.layer.cornerRadius = 5
        cell.clipsToBounds = true
        cell.delegate = self
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: view.frame.width - 50, height: 150)
    }
        
    func addToCart(item: Item) {
        Cart.addToCart(item: item)
        let cvNav = tabBarController?.viewControllers?[1] as! UINavigationController
        let cv = cvNav.topViewController as! CartController
        cv.addItemInCart(item: item)
    }
    
}

protocol CollectionViewControllerDelegate {
    
    func addToCart(item: Item)
}
