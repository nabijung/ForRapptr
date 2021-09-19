//
//  BodyLabel.swift
//  Rapptr iOS Test
//
//  Created by nabi jung on 9/16/21.
//

import UIKit
import Foundation
/*
 This is an area that I wish I had mre time to work on. The styling of the label was becoming too extensive, so i decided to create a custom label even though i wouldn't be reusing it. However, I think the insets I created are preventing the label from creating the correct size. In the end I created a work around by checking if the lable was truncated in intrinsicContentSize.
 
 The inspectables keep on throwing me an error, I don't know how to fix that, guess I could just delete them.
 */

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
        if self.isTruncated {
            return CGSize(width: size.width + leftInset + rightInset,
                                      height: size.height + topInset + bottomInset + 20)
        } else {
            return CGSize(width: size.width + leftInset + rightInset,
                          height: size.height + topInset + bottomInset)
        }
        
    }
    
    override var bounds: CGRect {
        didSet {
            // ensures this works within stack views if multi-line
            preferredMaxLayoutWidth = bounds.width - 16
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
        body.layer.masksToBounds = true
        if #available(iOS 13.0, *) {
            body.layer.borderColor = CGColor(red: 239/255, green: 239/255, blue: 239/255, alpha: 1.0)
        }
        
    }
    
    
}

extension UILabel {

    var isTruncated: Bool {

        guard let labelText = text else {
            return false
        }

        let labelTextSize = (labelText as NSString).boundingRect(
            with: CGSize(width: frame.size.width, height: .greatestFiniteMagnitude),
            options: .usesLineFragmentOrigin,
            attributes: [.font: font ?? "system-default"],
            context: nil).size

        return labelTextSize.height > bounds.size.height
    }
}
