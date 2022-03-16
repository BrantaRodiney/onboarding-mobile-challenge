//
//  CryptoTableViewCell.swift
//  MoedaDigitalTatty
//
//  Created by Tatiana Pessoa Fernandes on 08/03/22.
//

import UIKit

struct CryptoTableViewCellViewModel{

  let name: String
  let symbol: String
  let price: String
  let iconURL: URL?
}


class CryptoTableViewCell: UITableViewCell {


  static let identifier = "CryptoTableViewCell"
  
  private let nameLabel: UILabel = {
    let label = UILabel()
    label.font = .systemFont(ofSize: 20, weight: .medium)
    label.textColor = .white
    return label

  }()

  

  private let symbolLabel: UILabel = {
    let label = UILabel()
    label.font = .systemFont(ofSize: 17, weight: .regular)
    label.textColor = .white
    return label

  }()

  

  private let priceLabel: UILabel = {
    let label = UILabel()
    label.textColor = .green
    label.textAlignment = .right
    label.font = .systemFont(ofSize: 17, weight: .semibold)
    return label

  }()

  

  private let iconImageView: UIImageView = {
    let image = UIImageView()
    image.contentMode = .scaleAspectFit
    return image

  }()



  

  override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
    super.init(style: style, reuseIdentifier: reuseIdentifier)
    contentView.backgroundColor = .black
    contentView.addSubview(nameLabel)
    contentView.addSubview(symbolLabel)
    contentView.addSubview(priceLabel)
    contentView.addSubview(iconImageView)

  }

  required init?(coder: NSCoder) {

    fatalError("init(coder:) has not been implemented")

  }


  override func layoutSubviews() {
    super.layoutSubviews()
    let size: CGFloat = contentView.frame.size.height/1.1
    iconImageView.frame = CGRect(x: 20, y: (contentView.frame.size.height-size)/2, width: size, height: size)

    nameLabel.sizeToFit()
    priceLabel.sizeToFit()
    symbolLabel.sizeToFit()
    nameLabel.frame = CGRect(
        x: 30 + size,
        y: 0,
        width: contentView.frame.size.width/2,
        height: contentView.frame.height/2)
      
    symbolLabel.frame = CGRect(
        x: 30 + size,
        y: contentView.frame.size.height/2,
        width: contentView.frame.size.width/2,
        height: contentView.frame.height/2)
      
    priceLabel.frame = CGRect(
        x: contentView.frame.size.width/2,
        y: 0,
        width: (contentView.frame.size.width/2)-15,
        height: contentView.frame.height)

  }

  

  func configure(with viewModel: CryptoTableViewCellViewModel){
    nameLabel.text = viewModel.name
    priceLabel.text = viewModel.price
    symbolLabel.text = viewModel.symbol

    if let url = viewModel.iconURL{
      let task = URLSession.shared.dataTask(with: url) { [weak self] data, _, _ in
        if let data = data {
          DispatchQueue.main.async {
            self?.iconImageView.image = UIImage(data: data)

          }

        }

      }

      task.resume()

    }

  }

  

}
