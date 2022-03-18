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
        dataLabel.text = "\(getTimeStampDateToString())"
        return dataLabel

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

    
  override init(frame: CGRect) {

    super.init(frame: frame)
      self.backgroundColor = .black
    configuraView()
    definirConstraints()
  }

  required init?(coder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }
    

  private func configuraView()
    {
    self.addSubview(moedaLabel)
    self.addSubview(dataLabel)
  }


  private func definirConstraints(){
    NSLayoutConstraint.activate([
      moedaLabel.topAnchor.constraint(equalTo: self.topAnchor,constant: 80),
      moedaLabel.centerXAnchor.constraint(equalTo: self.centerXAnchor),
      dataLabel.topAnchor.constraint(equalTo: self.moedaLabel.bottomAnchor, constant: 10),
      dataLabel.centerXAnchor.constraint(equalTo: self.moedaLabel.centerXAnchor)
    ])
  }
}
