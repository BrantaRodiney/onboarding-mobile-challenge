//
//  MoedasViewController.swift
//  moedadigital
//
//  Created by Rodiney Branta on 17/03/22.
//

import UIKit

class MoedasViewController: UIViewController {
    
    let moedas: MoedasView = {
        let view = MoedasView()
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    // criando o SearchBar
    let searchController = UISearchController(searchResultsController: nil)
    
    private let tableView: UITableView = {
        let tableView = UITableView(frame: .zero, style: .grouped)
        tableView.register(CryptoTableViewCell.self,
                           forCellReuseIdentifier: CryptoTableViewCell.identifier)
        return tableView
    }()
    
    private var viewModels = [CryptoTableViewCellViewModel]()
    
    static let numberFormatter: NumberFormatter = {
        let formatter = NumberFormatter()
        formatter.locale = .current
        formatter.allowsFloats = true
        formatter.numberStyle = .currency
        formatter.formatterBehavior = .default
        
        return formatter
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        title = "Moeda Digital"
        view.addSubview(tableView)
        view.addSubview(moedas)
        tableView.dataSource = self
        tableView.delegate = self
        
        getDataFromApi()
        
        searchController.dimsBackgroundDuringPresentation = false
        definesPresentationContext = true
        tableView.tableHeaderView = searchController.searchBar
        self.navigationController?.isNavigationBarHidden = false
        searchController.searchBar.placeholder = "Digite aqui"
        
        configuraConstraints()

    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        tableView.frame = view.bounds
        tableView.backgroundColor = .black
    }
    
    func configuraConstraints() {
        NSLayoutConstraint.activate([
            moedas.topAnchor.constraint(equalTo: self.view.topAnchor),
            moedas.leftAnchor.constraint(equalTo: self.view.leftAnchor),
            moedas.rightAnchor.constraint(equalTo: self.view.rightAnchor),
            moedas.heightAnchor.constraint(equalToConstant: 150)
        
        ])
    }
    
}

extension MoedasViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let viewModel = viewModels[indexPath.row]
        
        // Ir para a segunda view
            
    }
}

extension MoedasViewController: UITableViewDataSource {
    // Table View
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewModels.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(
            withIdentifier: CryptoTableViewCell.identifier,
            for: indexPath
        )as? CryptoTableViewCell else {
            fatalError()
        }
        cell.configure(with: viewModels[indexPath.row])
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForFooterInSection section: Int) -> CGFloat {
        return 70
    }
}


/// Este Metodo devera ser criado em uma nova classe passando o resultado para quem precisar.
/// Como nao deu tempo criamos por aqui mesmo.
extension MoedasViewController {
    func getDataFromApi() {
        APICaller.shared.getAllCryptoData { [weak self] result in
            switch result {
            case .success(let models):
                self?.viewModels = models.compactMap({
                    
                    let price = $0.price_usd ?? 0
                    let formatter = MoedasViewController.numberFormatter
                    let priceString = formatter.string(from: NSNumber(value: price))
                    let assetID = $0.asset_id
                    
                    let iconURL = URL(
                        string :
                            APICaller.shared.icons.filter({ icon in
                                icon.asset_id == assetID
                            }).first?.url ?? "")
                        
                    
                    
                   return CryptoTableViewCellViewModel(
                    name: $0.name ?? "N/A",
                    symbol: $0.asset_id,
                    price: priceString ?? "N/A",
                    iconURL: iconURL
                    )
                   
                })
                
                DispatchQueue.main.async {
                    self?.tableView.reloadData()
                }
                
            case .failure(let error):
                print("Error: \(error)")
            }
        }
    
    }
}
