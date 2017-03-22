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
        
        let homeController = HomeController(collectionViewLayout: UICollectionViewFlowLayout())
        let homeNavController = UINavigationController(rootViewController: homeController)
        homeNavController.tabBarItem = UITabBarItem(title: "Home", image: nil, selectedImage: nil)

        let cartController = HomeController(collectionViewLayout: UICollectionViewFlowLayout())
        let cartNavController = UINavigationController(rootViewController: cartController)
        cartNavController.tabBarItem = UITabBarItem(title: "Carrinho", image: nil, selectedImage: nil)
        cartNavController.tabBarItem.badgeValue = "1"
        
        viewControllers = [homeNavController, cartNavController]
    }
}
