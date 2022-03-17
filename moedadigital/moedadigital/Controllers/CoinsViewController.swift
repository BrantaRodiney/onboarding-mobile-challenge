//
//  CoinsViewController.swift
//  moedadigital
//
//  Created by Rodiney Branta on 17/03/22.
//

import UIKit

class CoinsViewController: UIViewController {
    
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
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .lightGray
        navigationController?.navigationBar.barStyle = .black
        navigationController?.setNavigationBarHidden(false, animated: true)
        navigationController?.navigationBar.titleTextAttributes = [NSAttributedString.Key.foregroundColor: UIColor.white]
        navigationController?.navigationBar.barTintColor = UIColor(red: 25/255.0, green: 24/255.0, blue: 25/255.0, alpha: 1)
       // navigationItem.title = "Moeda Digital"
        navigationItem.setTitle(title: "Moeda Digital", subtitle: "\(getTimeStampDateToString())")
      //  navigationItem.title = "\(getTimeStampDateToString())"
        
    }

}

extension UINavigationItem
{
    func setTitle(title:String, subtitle:String) {
        
        let main = UILabel()
        main.text = title
        main.font = UIFont.systemFont(ofSize: 17)
        main.textColor = .white
        main.sizeToFit()
        
        let date = UILabel()
        date.text = subtitle
        date.font = UIFont.systemFont(ofSize: 15)
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
