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
        
        
        self.title = "Shop Star Wars"
        
        
        self.setNavigationBarStyle()
        //setBarsStyle()
        
        self.navigationController?.navigationBar.tintColor = .white
        self.navigationController?.navigationBar.barTintColor = .SWBlue
        self.navigationController?.navigationBar.alpha = 1
        
        UINavigationBar.appearance().backgroundColor = .SWBlue
        UINavigationBar.appearance().tintColor = .white
        UINavigationBar.appearance().alpha = 1
        
        
        
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
    
    func setBarsStyle(){
        self.navigationController?.navigationBar.tintColor = .white
        self.navigationController?.navigationBar.barTintColor = .SWBlue
        self.navigationController?.navigationBar.alpha = 1
        //UINavigationBar.appearance().tintColor = .white
        //UINavigationBar.appearance().alpha = 1
    }
    
    func addToCart(item: Item) {
        print(item.product.title)
    }
    
}

protocol CollectionViewControllerDelegate {
    
    func addToCart(item: Item)
}
