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

class MoedasViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
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
        
        APICaller.shared.getAllCryptoData { [weak self] result in
            switch result {
            case .success(let models):
                self?.viewModels = models.compactMap({
                    
                    let price = $0.price_usd ?? 0
                    let formatter = MoedasViewController.numberFormatter
                    let priceString = formatter.string(from: NSNumber(value: price))
                    
                    let iconURL = URL(
                        string :
                            APICaller.shared.icons.filter({ icon in
                                icon.asset_id == icon.asset_id
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
    
        
        var moedaFiltrada =
        
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
    
    func configuraConstraints() {
        NSLayoutConstraint.activate([
            moedas.topAnchor.constraint(equalTo: self.view.topAnchor),
            moedas.leftAnchor.constraint(equalTo: self.view.leftAnchor),
            moedas.rightAnchor.constraint(equalTo: self.view.rightAnchor),
            moedas.heightAnchor.constraint(equalToConstant: 150)
        
        ])
    }
    
}


class AdicionadasViewController: UIViewController {
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .black
    
    }
}


class MoedasView: UIView {

    lazy var moedaLabel: UILabel = {

        let label = UILabel()

        label.translatesAutoresizingMaskIntoConstraints = false

        label.textColor = .white

        label.font = UIFont.systemFont(ofSize: 22)

        label.text = "Moeda Digital"

        return label

    }()


    lazy var dataLabel: UILabel = {

       let dataLabel = UILabel()

        dataLabel.translatesAutoresizingMaskIntoConstraints = false

        dataLabel.textColor = .white

        dataLabel.font = UIFont.systemFont(ofSize: 17)

        dataLabel.text = "4 jan 2020"

        return dataLabel

    }()

  

  //Método construtor da classe, toda vez que crio uma nova instancia ele é chamado

  //Dentro dele chamo o metodo para add subviews (configuraView()) e para configurar a posicao dos meus elementos (definirConstraints())

  override init(frame: CGRect) {

    super.init(frame: frame)
      self.backgroundColor = .black
    configuraView()
    definirConstraints()
  }

  //Método construtor da classe, o swift me obriga a implementar ele para caso de algum erro

  required init?(coder: NSCoder) {

    fatalError("init(coder:) has not been implemented")

  }

  

  //Esse método adiciona os labels a minha view

  private func configuraView(){

    self.addSubview(moedaLabel)

    self.addSubview(dataLabel)

  }



  //método para posicionar os elementos na tela

  private func definirConstraints(){

    NSLayoutConstraint.activate([

      //aqui estou posicionando o label da moeda com uma distancia de 10 do topo da minha view

      moedaLabel.topAnchor.constraint(equalTo: self.topAnchor,constant: 80),

      moedaLabel.centerXAnchor.constraint(equalTo: self.centerXAnchor),

    

      //aqui estou posicionando a label da data em relacao ao label de cima (moedaLabel). Estou dizendo que ele

      //vai ter uma distancia de 10 em relacao ao label de cima

      dataLabel.topAnchor.constraint(equalTo: self.moedaLabel.bottomAnchor, constant: 10),

      dataLabel.centerXAnchor.constraint(equalTo: self.moedaLabel.centerXAnchor)

    ])

  }

}


