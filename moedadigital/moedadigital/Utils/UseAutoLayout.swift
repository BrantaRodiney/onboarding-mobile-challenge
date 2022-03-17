//
//  UseAutoLayout.swift
//  moedadigital
//
//  Created by Rodiney Branta on 17/03/22.
//

import UIKit

@propertyWrapper
public struct UseAutoLayout<T: UIView> {
    public var wrappedValue: T {
        didSet {
            setAutoLayout()
        }
    }
    
    public init(wrappedValue: T) {
        self.wrappedValue = wrappedValue
        setAutoLayout()
    }
    
    func setAutoLayout(){
        wrappedValue.translatesAutoresizingMaskIntoConstraints = false
    }
}
