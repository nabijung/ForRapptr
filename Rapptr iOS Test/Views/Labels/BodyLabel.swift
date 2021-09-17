//
//  BodyLabel.swift
//  Rapptr iOS Test
//
//  Created by nabi jung on 9/16/21.
//

import UIKit
import Foundation

@IBDesignable
class BodyLabel: UILabel {
    
    @IBInspectable var topInset: CGFloat = 5.0
    @IBInspectable var bottomInset: CGFloat = 5.0
    @IBInspectable var leftInset: CGFloat = 7.0
    @IBInspectable var rightInset: CGFloat = 7.0
    
    override func drawText(in rect: CGRect) {
        let insets = UIEdgeInsets(top: topInset, left: leftInset, bottom: bottomInset, right: rightInset)
        super.drawText(in: rect.inset(by: insets))
    }
    
    override var intrinsicContentSize: CGSize {
        let size = super.intrinsicContentSize
        return CGSize(width: size.width + leftInset + rightInset,
                      height: size.height + topInset + bottomInset)
    }
    
    override var bounds: CGRect {
        didSet {
            // ensures this works within stack views if multi-line
            preferredMaxLayoutWidth = bounds.width - (leftInset + rightInset)
        }
    }
    
    required public init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        let body = self
        body.textColor = UIColor(red: 27/255, green: 30/255, blue: 31/255, alpha: 1.0)
        body.font = UIFont.systemFont(ofSize: 15, weight: .regular)
        body.backgroundColor = .white
        body.layer.borderWidth = 1
        body.layer.cornerRadius = 8
        if #available(iOS 13.0, *) {
            body.layer.borderColor = CGColor(red: 239/255, green: 239/255, blue: 239/255, alpha: 1.0)
        }
        
    }
    
    
}
