//
//  LoginTextField.swift
//  Rapptr iOS Test
//
//  Created by nabi jung on 9/16/21.
//
import Foundation
import UIKit

@IBDesignable
class LoginTextField: UITextField {
    
    @IBInspectable var insetX: CGFloat = 6 {
           didSet {
             layoutIfNeeded()
           }
        }
    
    @IBInspectable var insetY: CGFloat = 6 {
           didSet {
             layoutIfNeeded()
           }
        }

    override func textRect(forBounds bounds: CGRect) -> CGRect {
        return bounds.insetBy(dx: insetX , dy: insetY)
        }

    override func editingRect(forBounds bounds: CGRect) -> CGRect {
        return bounds.insetBy(dx: insetX , dy: insetY)
        }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
    }
    
    required public init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        
        self.attributedPlaceholder = NSAttributedString(string: self.placeholder ?? "", attributes: [NSAttributedString.Key.foregroundColor : UIColor(red: 95/255, green: 96/255, blue: 99/255, alpha: 1.0), NSAttributedString.Key.font: UIFont.systemFont(ofSize: 16, weight: .regular)])
        self.backgroundColor = UIColor(red: 255/255, green: 255/255, blue: 255/255, alpha: 0.5)
        self.layer.cornerRadius = 5
        
  
    }

}
