//
//  AppGlobal.swift
//  MapApplication
//
//  Created by Vinay Kumar on 02/12/19.
//  Copyright © 2019 Ankur Bansal. All rights reserved.
//

import UIKit


func printDebug <T>(_ obj: T) {
    print(obj)
}


//MARK: Colors Used in App
enum AppColors {
    
    static let white = #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)
    static let headerColor = #colorLiteral(red: 0.05490196078, green: 0.137254902, blue: 0.4470588235, alpha: 1)
    static let shadowColor = #colorLiteral(red: 0.3921568627, green: 0.3921568627, blue: 0.3921568627, alpha: 1)
    
}


extension UITableViewCell {
    static var reusableIdentifier: String {
        return "\(self)"
    }
}
