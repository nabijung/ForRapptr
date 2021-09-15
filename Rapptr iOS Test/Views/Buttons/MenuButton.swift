//
//  MenuButton.swift
//  Rapptr iOS Test
//
//  Created by nabi jung on 9/14/21.
//

import Foundation
import UIKit

@IBDesignable
public class CustomMenuButton: UIButton {

    required public init?(coder aDecoder: NSCoder) {

        super.init(coder: aDecoder)
        self.translatesAutoresizingMaskIntoConstraints = false
        self.backgroundColor = UIColor(red: 255/255, green: 255/255, blue: 255/255, alpha: 0.8)
        self.contentHorizontalAlignment = .left
        self.contentEdgeInsets = UIEdgeInsets(top: 0, left: 22, bottom: 0, right: 0)
        self.titleEdgeInsets = UIEdgeInsets(top: 0, left: 16, bottom: 0, right: 0)
        self.setTitle(self.title(for: .normal)?.uppercased(), for: .normal)
        self.titleLabel?.font = UIFont.systemFont(ofSize: 16, weight: .semibold)
        self.tintColor = UIColor(red: 27/255, green: 30/255, blue: 31/255, alpha: 1.0)
        self.imageRect(forContentRect: CGRect(x: 0, y: 0, width: 24, height: 24))
        self.heightAnchor.constraint(equalToConstant: 55).isActive = true

        }

    @IBInspectable var cornerradius: CGFloat = 0 {
        didSet {
            self.layer.cornerRadius = cornerradius
        }
    }
}
