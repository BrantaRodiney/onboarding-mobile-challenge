//
//  CoinToFavoriteViewController.swift
//  moedadigital
//
//  Created by Rodiney Branta on 17/03/22.
//

import UIKit

class CoinToFavoriteViewController: UIViewController {
    
    let coinToFavorite: CoinToFavorite = {
        @UseAutoLayout var view = CoinToFavorite()
        view.backgroundColor = UIColor(red: 129/255.0, green: 130/255.0, blue: 83/255.0, alpha: 1)
        return view
        
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        setCoinToFavoriteConstraints()
        
    }
        
    private func setCoinToFavoriteConstraints()
    {
        self.view.addSubview(coinToFavorite)
        coinToFavorite.topAnchor.constraint(equalTo: self.view.topAnchor, constant: 0).isActive = true
        coinToFavorite.leadingAnchor.constraint(equalTo: self.view.leadingAnchor, constant: 0).isActive = true
        coinToFavorite.bottomAnchor.constraint(equalTo: self.view.bottomAnchor, constant: 0).isActive = true
        coinToFavorite.trailingAnchor.constraint(equalTo: self.view.trailingAnchor, constant: 0).isActive = true
    }

}

protocol ViewControllerDelegate: AnyObject {
    func selectedCell(row: Int)
}


