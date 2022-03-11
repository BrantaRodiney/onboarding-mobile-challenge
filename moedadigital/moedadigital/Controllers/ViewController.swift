//
//  ViewController.swift
//  moedadigital
//
//  Created by Rodiney Branta on 05/03/22.
//

import UIKit

class ViewController: UIViewController {
    
    let coinToFavoriteViewController = CoinToFavoriteViewController()

    override func viewDidLoad() {
        super.viewDidLoad()
        addCoinToFavoriteViewController()
    }
    
    func addCoinToFavoriteViewController() {
        addChild(coinToFavoriteViewController)
        view.addSubview(coinToFavoriteViewController.view)
        
        coinToFavoriteViewController.view.backgroundColor = .darkGray
        
        coinToFavoriteViewController.didMove(toParent: self)
        setCoinToFavoriteViewControllerConstraints()
    }
    
    func setCoinToFavoriteViewControllerConstraints(){
        coinToFavoriteViewController.view.translatesAutoresizingMaskIntoConstraints = false
        coinToFavoriteViewController.view.topAnchor.constraint(equalTo: self.view.topAnchor, constant: 20).isActive = true
        coinToFavoriteViewController.view.leftAnchor.constraint(equalTo: self.view.leftAnchor, constant: 20).isActive = true
        coinToFavoriteViewController.view.rightAnchor.constraint(equalTo: self.view.rightAnchor, constant: -20).isActive = true
        coinToFavoriteViewController.view.bottomAnchor.constraint(equalTo: self.view.bottomAnchor, constant: -245).isActive = true
    }
}

@propertyWrapper
public struct UseAutoLayout<T: UIView> {
    public var wrappedValue: T {
        didSet {
            setAutoLayout()
        }
    }
    
    public init(wrappedValue: T) {
        self.wrappedValue = wrappedValue
        setAutoLayout()
    }
    
    func setAutoLayout(){
        wrappedValue.translatesAutoresizingMaskIntoConstraints = false
    }
}
