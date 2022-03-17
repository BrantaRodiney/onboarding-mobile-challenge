//
//  CoinTradeVolume.swift
//  moedadigital
//
//  Created by Rodiney Branta on 15/03/22.
//

import UIKit

class CoinTradeVolume: UIView
{
    override init(frame: CGRect)
    {
        super.init(frame: frame)
        setCoinLabelA()
        setCoinTradeVolume()
        
    }
    
    required init?(coder: NSCoder)
    {
        fatalError("init(coder:) has not been implemented")
    }
    
    private lazy var coinLabel: UILabel =
    {
        @UseAutoLayout var label = UILabel()
        label.textColor = .lightGray
        return label
    }()
    
    private lazy var tableView: UITableView =
    {
        @UseAutoLayout var table = UITableView()
        table.backgroundColor = UIColor(red: 25/255.0, green: 24/255.0, blue: 25/255.0, alpha: 1)        //table.register(UITableViewCell.self, forCellReuseIdentifier: "cell")
        
        return table
    }()
    
    
    func setCoinLabelA()
    {
        self.addSubview(coinLabel)
        coinLabel.text = "volumes negociados"
        coinLabel.centerXAnchor.constraint(equalTo: self.centerXAnchor).isActive = true
        coinLabel.textAlignment = .center
        coinLabel.topAnchor.constraint(equalTo: self.topAnchor, constant: 10).isActive = true
    }
    
    func setCoinTradeVolume()
    {
        self.addSubview(tableView)
        tableView.topAnchor.constraint(equalTo: coinLabel.bottomAnchor,constant: 16).isActive = true
        tableView.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 20).isActive = true
        tableView.bottomAnchor.constraint(equalTo: self.bottomAnchor,constant: -20).isActive = true
        tableView.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -20).isActive = true
    }
}


