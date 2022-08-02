//
//  UITextFieldExtension.swift
//  MEM
//
//  Created by Ehtisham Khalid on 31.07.22.
//

import Foundation
import UIKit

extension UITextField{
    func roundAndBackgroundColorField(){
        self.layer.cornerRadius = 18
        self.layer.borderWidth = 1
        self.layer.borderColor = #colorLiteral(red: 0.4470588235, green: 0.3921568627, blue: 0.8980392157, alpha: 1)
//        self.layer.backgroundColor = #colorLiteral(red: 0.9725490196, green: 0.9764705882, blue: 0.9764705882, alpha: 1)
    }
    
    func UISetupToTextField() {
        self.roundAndBackgroundColorField()
        self.setLeftPaddingPoints()
        self.setRightPaddingPoints()
    }
    
    func prefixDollarToTextField(){
        let Lprefix = UILabel()
        Lprefix.font = UIFont.boldSystemFont(ofSize: 20)
        Lprefix.text = "Dollar "
        Lprefix.sizeToFit()
        let Rprefix = UILabel()
        Rprefix.font = UIFont.boldSystemFont(ofSize: 20)
        Rprefix.text = " $"
        Rprefix.sizeToFit()
        self.rightView = Lprefix
        self.rightViewMode = .always
        self.leftView = Rprefix
        self.leftViewMode = .always // or .always
    }
    
    func setLeftPaddingPoints(){
        // change the with to get the required thing
        let paddingView = UIView(frame: CGRect(x: 0, y: 0, width: 20, height: self.frame.size.height))
        self.leftView = paddingView
        self.leftViewMode = .always
    }
    func setRightPaddingPoints() {
        // change the with to get the required thing
        let paddingView = UIView(frame: CGRect(x: 0, y: 0, width: 20, height: self.frame.size.height))
        self.rightView = paddingView
        self.rightViewMode = .always
    }
    
    func addUnderLine () {
            let bottomLine = CALayer()
            
        bottomLine.frame = CGRect(x: 0.0, y: self.bounds.height + 3, width: self.bounds.width, height: 1.0)
            bottomLine.backgroundColor = UIColor.lightGray.cgColor
            self.borderStyle = UITextField.BorderStyle.none
            self.layer.addSublayer(bottomLine)
        }
}
