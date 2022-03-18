//
//  MoedasView.swift
//  moedadigital
//
//  Created by Rodiney Branta on 17/03/22.
//

import UIKit

class MoedasView: UIView {

    
  override init(frame: CGRect) {
    super.init(frame: frame)
  }

  required init?(coder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }
    
}


extension UINavigationItem
{
    func setTitle(title:String, subtitle:String) {
        
        let main = UILabel()
        main.text = title
        main.font = UIFont.systemFont(ofSize: 22)
        main.textColor = .white
        main.sizeToFit()
        
        let date = UILabel()
        date.text = subtitle
        date.font = UIFont.systemFont(ofSize: 17)
        date.textColor = .white
        date.textAlignment = .center
        date.sizeToFit()
        
        let stackView = UIStackView(arrangedSubviews: [main, date])
        stackView.distribution = .equalCentering
        stackView.axis = .vertical
        stackView.alignment = .center
        
        let width = max(main.frame.size.width, date.frame.size.width)
        stackView.frame = CGRect(x: 0, y: 0, width: width, height: 40)
        
        date.sizeToFit()
        main.sizeToFit()
        
        self.titleView = stackView
    }
}
