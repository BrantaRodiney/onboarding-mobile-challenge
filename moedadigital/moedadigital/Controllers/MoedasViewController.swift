//
//  MoedasViewController.swift
//  moedadigital
//
//  Created by Rodiney Branta on 17/03/22.
//


import UIKit

class MoedasViewController: UIViewController {
    
    let moedas : MoedasView =
    {
        @UseAutoLayout var view = MoedasView()
        view.backgroundColor = UIColor.black
        return view
    }()
    

    private let tableView: UITableView =
    {
        @UseAutoLayout var tableView = UITableView()
        tableView.register(CryptoTableViewCell.self, forCellReuseIdentifier: CryptoTableViewCell.identifier)
        return tableView
    }()
    
    
    let searchController = UISearchController(searchResultsController: nil)
    
    private func searchBar()
    {
        searchController.dimsBackgroundDuringPresentation = false
        tableView.tableHeaderView = searchController.searchBar
        searchController.searchBar.placeholder = "Digite aqui"
    }
    
    private func setMoedasNavigationBar()
    {
        navigationController?.navigationBar.barStyle = .black
        navigationController?.setNavigationBarHidden(false, animated: true)
        navigationController?.navigationBar.titleTextAttributes = [NSAttributedString.Key.foregroundColor: UIColor.white]
        navigationController?.navigationBar.barTintColor = UIColor(red: 25/255.0, green: 24/255.0, blue: 25/255.0, alpha: 1)
        navigationItem.setTitle(title: "Moeda Digital", subtitle: "\(getTimeStampDateToString())")
    }
    

    private var viewModels = [CryptoTableViewCellViewModel]()
    
    static let numberFormatter: NumberFormatter = {
        let formatter = NumberFormatter()
        formatter.locale = .current
        formatter.allowsFloats = true
        formatter.numberStyle = .currency
        formatter.formatterBehavior = .default
        
        return formatter
    }()
    
    func getTimeStampDateToString() -> String
    {
        let date = Date(timeIntervalSinceNow: 0)
        let dateFormatter = DateFormatter()
        dateFormatter.timeZone = TimeZone(abbreviation: "GMT-3")
        dateFormatter.locale = NSLocale.current
        dateFormatter.dateFormat = "d MMM YYYY"
        let strDate = dateFormatter.string(from: date)
        return strDate
    }
    
    private func setMoedas()
    {
        setMoedasNavigationBar()
        view.addSubview(tableView)
        tableView.separatorStyle = .none
        tableView.dataSource = self
        tableView.delegate = self

        getDataFromApi()
        
        searchController.dimsBackgroundDuringPresentation = false

        definesPresentationContext = true
        searchBar()
        getDataFromApi()
        }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setMoedas()
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        tableView.frame = view.bounds
        tableView.backgroundColor = .black
    }
}


extension MoedasViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let coinToFavoriteViewController = CoinToFavoriteViewController()
        self.present(coinToFavoriteViewController, animated: true, completion: nil)
    }
}

extension MoedasViewController: UITableViewDataSource
{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int
    {
        return viewModels.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell
    {
        guard let cell = tableView.dequeueReusableCell(
            withIdentifier: CryptoTableViewCell.identifier, for: indexPath)as? CryptoTableViewCell else {fatalError()}
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
