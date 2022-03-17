//
//  CoinsViewController.swift
//  moedadigital
//
//  Created by Rodiney Branta on 17/03/22.
//

import UIKit

class CoinsViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        //view.backgroundColor = UIColor.black
        navigationController?.navigationBar.barStyle = .black
        navigationController?.setNavigationBarHidden(false, animated: true)
        navigationController?.navigationBar.titleTextAttributes = [NSAttributedString.Key.foregroundColor: UIColor.white]
        navigationController?.navigationBar.barTintColor = UIColor(red: 25/255.0, green: 24/255.0, blue: 25/255.0, alpha: 1)
        navigationItem.title = "Moeda Digital"
        
    }

}
