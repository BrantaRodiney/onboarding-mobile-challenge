//
//  ViewController.swift
//  moedadigital
//
//  Created by Rodiney Branta on 05/03/22.
//

import UIKit


class ViewController: UITabBarController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // criar instância dos view controllers
        let moedas = MoedasViewController()
        let adicionadas = AdicionadasViewController()
        
        // definir titulos tab bar
        moedas.title = "Moedas"
        adicionadas.title = "Adicionadas"
        
        // atribuir view controllers à tab Bars
        self.setViewControllers([moedas, adicionadas], animated: false)
        
        guard let items = self.tabBar.items else { return }
        self.tabBar.tintColor = .gray
        
        let images = ["house.square", "star.fill"]
        
        for x in 0...1 {
            items[x].image = UIImage(named: images[x])
        }
      
    }

}

class MoedasViewController: UIViewController {
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .black
    
    }
}

class AdicionadasViewController: UIViewController {
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .black
    
    }
}

