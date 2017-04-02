//
//  Extensions.swift
//  ShopStarWars
//
//  Created by Joao Gabriel Carvalho on 31/03/17.
//  Copyright © 2017 Joao Gabriel Carvalho. All rights reserved.
//

import Foundation
import UIKit

extension UIColor
{
    static let SWBlue = UIColor(hue: 205/360, saturation: 1, brightness: 47/100, alpha: 1)
    static let SWWine = UIColor(hue: 350/360, saturation: 84/100, brightness: 40/100, alpha: 1)
    static let SWRed = UIColor(hue: 6/360, saturation: 92/100, brightness: 67/100, alpha: 1)
    static let SWRedDisabled = UIColor(hue: 6/360, saturation: 92/100, brightness: 67/100, alpha: 0.5)
    static let SWRust = UIColor(hue: 357/360, saturation: 32/100, brightness: 52/100, alpha: 1)
    static let SWGrey = UIColor(hue: 210/360, saturation: 2/100, brightness: 80/100, alpha: 1)

}

extension UIView {
    
    func addConstarintWithFormat(format: String, views: UIView...){
        var viewsDictonary = [String : UIView]()
        for (index, view) in views.enumerated(){
            let key = "v\(index)"
            view.translatesAutoresizingMaskIntoConstraints = false
            viewsDictonary[key] = view
        }
        
        addConstraints(NSLayoutConstraint.constraints(withVisualFormat: format, options: NSLayoutFormatOptions(), metrics: nil, views: viewsDictonary))
        
    }
}

extension UIViewController {
    
    func setNavigationBarStyle() {
        self.navigationController?.navigationBar.tintColor = .white
        self.navigationController?.navigationBar.barTintColor = .SWBlue
        self.navigationController?.navigationBar.alpha = 1
        UINavigationBar.appearance().tintColor = .white
        UINavigationBar.appearance().alpha = 1
    }
}

extension UIButton {
    
    func setBackgroundColor(color: UIColor, forState: UIControlState) {
        
        UIGraphicsBeginImageContext(CGSize(width: 1, height: 1))
        UIGraphicsGetCurrentContext()!.setFillColor(color.cgColor)
        UIGraphicsGetCurrentContext()!.fill(CGRect(x: 0, y: 0, width: 1, height: 1))
        let colorImage = UIGraphicsGetImageFromCurrentImageContext()
        UIGraphicsEndImageContext()
        
        self.setBackgroundImage(colorImage, for: forState)
    }
}
