//
//  UIExtensions.swift
//  MEM
//
//  Created by Ehtisham Khalid on 25.07.22.
//

import Foundation
import UIKit

extension UIButton {
    func setBtnWithShadow(){
           self.layer.shadowOffset = CGSize(width: 0.5, height: 0.4)
           self.layer.shadowOpacity = 0.5
           self.layer.shadowRadius = 1.5
//           self.layer.cornerRadius = self.frame.size.height/2
           self.layer.masksToBounds =  false
       }
    
    func addBorderToTheButton(color: CGColor) {
        self.layer.borderWidth = 0.5
        self.layer.borderColor = color
    }
}

