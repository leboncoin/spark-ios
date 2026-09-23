//
//  UIStackView+ArrangedSubviewsExtension.swift
//  SparkDemo
//
//  Created by robin.lemaire on 10/02/2025.
//  Copyright © 2025 Leboncoin. All rights reserved.
//

import UIKit

extension UIStackView {

    func removeAllArrangedSubviews() {
        for view in self.arrangedSubviews{
            self.removeArrangedSubview(view)
            view.removeFromSuperview()
        }
    }
}
