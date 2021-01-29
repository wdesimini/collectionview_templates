//
//  UIView+Pin.swift
//  collectionview_templates
//
//  Created by Wilson Desimini on 1/28/21.
//

import UIKit

extension UIView {
    func pin(to view: UIView, padding: CGFloat = 0) {
        NSLayoutConstraint.activate([
            topAnchor.constraint(equalTo: view.topAnchor, constant: padding),
            leftAnchor.constraint(equalTo: view.leftAnchor, constant: padding),
            rightAnchor.constraint(equalTo: view.rightAnchor, constant: -padding),
            bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -padding),
        ])
    }
}

