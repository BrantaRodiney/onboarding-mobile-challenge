//
//  CoinToFavorite.swift
//  moedadigital
//
//  Created by Rodiney Branta on 13/03/22.
//

import UIKit

class CoinToFavorite: UIView
{
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setCoinLabel()
        setCoinImg()
        setCoinLabelValue()
        setAddButton()
        setCoinTradeVolume()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private lazy var coinTradeVolume: CoinTradeVolume =
    {
        @UseAutoLayout var coinTradeVolume = CoinTradeVolume()
        coinTradeVolume.backgroundColor = UIColor(red: 25/255.0, green: 24/255.0, blue: 25/255.0, alpha: 1)
        return coinTradeVolume
    }()
    
    
    private lazy var coinLabel: UILabel =
    {
        @UseAutoLayout var label = UILabel()
        label.textColor = .white
        return label
    }()
    
    private lazy var coinImgLabel: UIImageView =
    {
        @UseAutoLayout var img = UIImageView()
        img.image = UIImage(named: "wallet.png")
        return img
    }()
    
    private lazy var coinLabelValue: UILabel =
    {
        @UseAutoLayout var label = UILabel()
        label.textColor = .white
        return label
    }()
    
    private lazy var addButton: UIButton =
    {
        @UseAutoLayout var button = UIButton()
        button.backgroundColor = UIColor(red: 129/255.0, green: 130/255.0, blue: 83/255.0, alpha: 1)
        button.setTitleColor(.white, for: .normal)
        return button
    }()

    
    func setCoinLabel()
    {
        self.addSubview(coinLabel)
        coinLabel.text = "BTC"
        coinLabel.centerXAnchor.constraint(equalTo: self.centerXAnchor).isActive = true
        coinLabel.textAlignment = .center
        coinLabel.topAnchor.constraint(equalTo: self.topAnchor, constant: 40).isActive = true
        coinLabel.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 20).isActive = true
        coinLabel.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -20).isActive = true
    }
    
    func setCoinImg()
    {
        self.addSubview(coinImgLabel)
        coinImgLabel.topAnchor.constraint(equalTo: coinLabel.bottomAnchor,constant: 40).isActive = true
        coinImgLabel.centerXAnchor.constraint(equalTo: self.centerXAnchor).isActive = true
        coinImgLabel.widthAnchor.constraint(equalToConstant: 32).isActive = true
        coinImgLabel.heightAnchor.constraint(equalToConstant: 32).isActive = true
    }
    
    func setCoinLabelValue()
    {
        self.addSubview(coinLabelValue)
        coinLabelValue.text = "$ 28,999.80"
        coinLabelValue.font = UIFont.systemFont(ofSize: 32)
        coinLabelValue.centerXAnchor.constraint(equalTo: self.centerXAnchor).isActive = true
        coinLabelValue.textAlignment = .center
        coinLabelValue.topAnchor.constraint(equalTo: coinImgLabel.bottomAnchor, constant: 10).isActive = true
        coinLabelValue.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 20).isActive = true
        coinLabelValue.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -20).isActive = true
    }
    
    func setAddButton()
    {
        self.addSubview(addButton)
        addButton.setTitle("ADICIONAR", for: .normal)
        addButton.titleLabel?.font = UIFont.boldSystemFont(ofSize: 24)
        addButton.layer.cornerRadius = 5.0
        addButton.layer.borderColor = UIColor.white.cgColor
        addButton.layer.borderWidth = 0.7
        addButton.centerXAnchor.constraint(equalTo: self.centerXAnchor).isActive = true
        addButton.titleLabel?.textAlignment = .center
        addButton.addTarget(self, action: #selector(didTapButton), for: .touchUpInside)
        addButton.topAnchor.constraint(equalTo: coinLabelValue.bottomAnchor, constant: 45).isActive = true
        addButton.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 40).isActive = true
        addButton.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -40).isActive = true

    }
    
    @objc func didTapButton()
    {
        print("PrompWork")
    }
    
    
    func setCoinTradeVolume()
    {
        self.addSubview(coinTradeVolume)
        coinTradeVolume.topAnchor.constraint(equalTo: addButton.bottomAnchor, constant: 20).isActive = true
        coinTradeVolume.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 0).isActive = true
        coinTradeVolume.bottomAnchor.constraint(equalTo: self.bottomAnchor, constant: 0).isActive = true
        coinTradeVolume.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: 0).isActive = true
    }


}
