//
//  MoedasView.swift
//  moedadigital
//
//  Created by Rodiney Branta on 17/03/22.
//

import UIKit

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
