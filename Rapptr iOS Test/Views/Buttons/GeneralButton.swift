//
//  GeneralButton.swift
//  Rapptr iOS Test
//
//  Created by nabi jung on 9/16/21.
//

import UIKit

public class GeneralButton: UIButton {

    required public init?(coder aDecoder: NSCoder) {

        super.init(coder: aDecoder)
        self.translatesAutoresizingMaskIntoConstraints = false
        self.backgroundColor = UIColor(red: 14/255, green: 92/255, blue: 137/255, alpha: 1.0)
        self.contentHorizontalAlignment = .center
        self.setTitle(self.title(for: .normal)?.uppercased(), for: .normal)
        self.titleLabel?.font = UIFont.systemFont(ofSize: 16, weight: .semibold)
        self.tintColor = .white
        self.heightAnchor.constraint(equalToConstant: 55).isActive = true

        }

}
