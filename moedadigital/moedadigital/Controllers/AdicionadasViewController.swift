//
//  AdicionadasViewController.swift
//  moedadigital
//
//  Created by Rodiney Branta on 17/03/22.
//

import UIKit

class AdicionadasViewController: UIViewController, UICollectionViewDelegate, UICollectionViewDataSource {
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: collectionView.frame.width/2.5, height: collectionView.frame.width/2)
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 4
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cell", for: indexPath)
        
        cell.backgroundColor = .init(red: 141.0/255.0, green: 149.0/255.0, blue: 98.0/255.0, alpha: 1.0)
        cell.layer.cornerRadius = 5
    
        return cell
    }
    
    
    fileprivate let collectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .vertical
        let cv = UICollectionView(frame: .zero, collectionViewLayout: layout)
        cv.translatesAutoresizingMaskIntoConstraints = false
        cv.register(UICollectionViewCell.self, forCellWithReuseIdentifier: "cell")
        return cv
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .black
        view.addSubview(moedas2)
        
        configuraConstraintsAdicionadas()
        
        view.addSubview(collectionView)
        collectionView.backgroundColor = .gray
        collectionView.delegate = self
        collectionView.dataSource = self
        collectionView.layer.cornerRadius = 7
        collectionView.topAnchor.constraint(equalTo: view.topAnchor, constant: 200).isActive = true
        collectionView.leadingAnchor.constraint(equalTo: view.leadingAnchor,constant: 40).isActive = true
        collectionView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -40).isActive = true
        collectionView.heightAnchor.constraint(equalToConstant: 530).isActive = true
       
    }
    

    
    let moedas2: MoedasView = {
        let view = MoedasView()
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    func configuraConstraintsAdicionadas() {
        NSLayoutConstraint.activate([
            moedas2.topAnchor.constraint(equalTo: self.view.topAnchor),
            moedas2.leftAnchor.constraint(equalTo: self.view.leftAnchor),
            moedas2.rightAnchor.constraint(equalTo: self.view.rightAnchor),
            moedas2.heightAnchor.constraint(equalToConstant: 150)
        
        ])
    }
    

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        navigationController?.isNavigationBarHidden = true
    }
}
