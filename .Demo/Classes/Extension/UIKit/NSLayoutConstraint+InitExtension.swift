//
//  NSLayoutConstraint+InitExtension.swift
//  SparkDemo
//
//  Created by robin.lemaire on 07/02/2025.
//  Copyright © 2025 Adevinta. All rights reserved.
//

import UIKit

extension NSLayoutConstraint {

    static func stickEdges(from: UIView, to: UIView, insets: UIEdgeInsets = .zero) {
        NSLayoutConstraint.activate([
            from.topAnchor.constraint(equalTo: to.topAnchor, constant: insets.top),
            from.leadingAnchor.constraint(equalTo: to.leadingAnchor, constant: insets.left),
            from.bottomAnchor.constraint(equalTo: to.bottomAnchor, constant: -insets.bottom),
            from.trailingAnchor.constraint(equalTo: to.trailingAnchor, constant: -insets.right)
        ])
    }
}
