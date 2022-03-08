//
//  ViewController.swift
//  moedadigital
//
//  Created by Rodiney Branta on 05/03/22.
//

import UIKit

extension AppDelegate{
    static var shared: AppDelegate {
        return UIApplication.shared.delegate as! AppDelegate
    }
    var rootViewController: RootViewController{
        return window!.rootViewController as! RootViewController
    }
}

class RootViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.view.backgroundColor = .lightGray
        // Do any additional setup after loading the view.
    }


}

