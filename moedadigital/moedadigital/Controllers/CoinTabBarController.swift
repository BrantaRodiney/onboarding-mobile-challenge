//
//  CoinTabBarController.swift
//  moedadigital
//
//  Created by Rodiney Branta on 17/03/22.
//

import UIKit

class CoinTabBarController: UITabBarController {
    
    func tabBar()
    {
        let coinController = UINavigationController(rootViewController: CoinsViewController())
        coinController.tabBarItem.image = UIImage(named: "dollar")
        coinController.tabBarItem.selectedImage = UIImage(named: "dollar.fill")
        coinController.tabBarItem.imageInsets = UIEdgeInsets(top: 6, left: 0, bottom: -6, right: 0)
        
        let favoriteController = UINavigationController(rootViewController: FavoriteCoinsViewController())
        favoriteController.tabBarItem.image = UIImage(named: "star-five-points-shape")
        favoriteController.tabBarItem.selectedImage = UIImage(named: "star-five-points-shape.fill")
        favoriteController.tabBarItem.imageInsets = UIEdgeInsets(top: 6, left: 0, bottom: -6, right: 0)
        
        tabBar.barTintColor = .black
        tabBar.tintColor = .yellow
        
        viewControllers = [coinController, favoriteController]
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tabBar()
    }
    
}
