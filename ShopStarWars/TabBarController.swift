//
//  TabBarController.swift
//  ShopStarWars
//
//  Created by Joao Gabriel Carvalho on 21/03/17.
//  Copyright © 2017 Joao Gabriel Carvalho. All rights reserved.
//

import UIKit

class TabBarController: UITabBarController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tabBar.barTintColor = .SWBlue
        tabBar.isTranslucent = false
        
        let homeController = HomeController(collectionViewLayout: UICollectionViewFlowLayout())
        let homeNavController = UINavigationController(rootViewController: homeController)
        homeNavController.tabBarItem = UITabBarItem(title: "Home", image: nil, selectedImage: nil)

        //let cartController = CartController(collectionViewLayout: UICollectionViewFlowLayout())
        let cartController = CartController()
        let cartNavController = UINavigationController(rootViewController: cartController)
        cartNavController.tabBarItem = UITabBarItem(title: "Carrinho", image: nil, selectedImage: nil)
        cartNavController.tabBarItem.badgeValue = "1"
        
        viewControllers = [homeNavController, cartNavController]
    }
}
