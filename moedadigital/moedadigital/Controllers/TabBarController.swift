//
//  ViewController.swift
//  moedadigital
//
//  Created by Rodiney Branta on 05/03/22.
//

import UIKit


class TabBarController: UITabBarController {
    
    func tabBar()
    {
        let coinController = UINavigationController(rootViewController: MoedasViewController())
        coinController.tabBarItem.image = UIImage(named: "dollar")
        coinController.tabBarItem.selectedImage = UIImage(named: "dollar.fill")
        coinController.tabBarItem.title = "Moedas"
        coinController.tabBarItem.imageInsets = UIEdgeInsets(top: 6, left: 0, bottom: -6, right: 0)
        
        let favoriteController = UINavigationController(rootViewController: AdicionadasViewController())
        favoriteController.tabBarItem.image = UIImage(named: "star-five-points-shape")
        favoriteController.tabBarItem.selectedImage = UIImage(named: "star-five-points-shape.fill")
        favoriteController.tabBarItem.title = "Adicionadas"
        favoriteController.tabBarItem.imageInsets = UIEdgeInsets(top: 6, left: 0, bottom: -6, right: 0)
        
        tabBar.barTintColor = .black
        tabBar.tintColor = .yellow
        
        viewControllers = [coinController, favoriteController]
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tabBar()
    }
    
    
//    override func viewDidLoad() {
//        super.viewDidLoad()
//
//        // criar instância dos view controllers
//        let moedas = MoedasViewController()
//        let adicionadas = AdicionadasViewController()
//
//        // definir titulos tab bar
//        moedas.title = "Moedas"
//        adicionadas.title = "Adicionadas"
//
//        // atribuir view controllers à tab Bars
//        self.setViewControllers([moedas, adicionadas], animated: false)
//
//        guard let items = self.tabBar.items else { return }
//        self.tabBar.tintColor = .gray
//
//        let images = ["house.square", "star.fill"]
//
//        for x in 0...1 {
//            items[x].image = UIImage(named: images[x])
//        }
//
//    }

}
