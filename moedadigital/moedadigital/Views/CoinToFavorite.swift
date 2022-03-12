//
//  coinToFavorite.swift
//  moedadigital
//
//  Created by Rodiney Branta on 10/03/22.
//

import UIKit

class CoinToFavorite: UIView {
    
    let coinToFavoriteView = CoinToFavorite()

    lazy var coinToFavoriteLabel: UILabel = {
        @UseAutoLayout var label = UILabel()
        label.text = "CoinSelecionadoAqui"
        label.textColor = .blue
        return label
    }()

    func addCoinToFavorite() {
        self.addSubview(coinToFavoriteView)
        self.addSubview(coinToFavoriteLabel)
        self.backgroundColor = UIColor(red: 129/255.0, green: 130/255.0, blue: 83/255.0, alpha: 1)
        //self.didMove(toParent: self)
        setCoinToFavoriteConstraints()
        setCoinToFavorieLabelConstraionts()
    }
    
    func setCoinToFavoriteConstraints(){
        coinToFavoriteView.translatesAutoresizingMaskIntoConstraints = false
        coinToFavoriteView.topAnchor.constraint(equalTo: self.topAnchor, constant: 20).isActive = true
        coinToFavoriteView.leftAnchor.constraint(equalTo: self.leftAnchor, constant: 20).isActive = true
        coinToFavoriteView.rightAnchor.constraint(equalTo: self.rightAnchor, constant: -20).isActive = true
        coinToFavoriteView.bottomAnchor.constraint(equalTo: self.bottomAnchor, constant: -20).isActive = true
    }
    
    func setCoinToFavorieLabelConstraionts() {
        coinToFavoriteLabel.topAnchor.constraint(equalTo: self.topAnchor, constant: 40).isActive = true
        coinToFavoriteLabel.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 100).isActive = true
        coinToFavoriteLabel.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -20).isActive = true
    }
    
}
