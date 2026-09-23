//
//  UIView+BackgroundExtension.swift
//  SparkComponentSelectionControls
//
//  Created by robin.lemaire on 12/09/2025.
//  Copyright © 2025 Leboncoin. All rights reserved.
//

import UIKit
@_spi(SI_SPI) import SparkCommon

extension UIView {

    func addBackgroundColor() {
        self.backgroundColor = .secondarySystemBackground
    }

    func createBackgroundView(useMaxWidth: Bool = true) -> UIView {
        let backgroundView = UIView()
        backgroundView.backgroundColor = .systemBackground
        backgroundView.translatesAutoresizingMaskIntoConstraints = false
        if useMaxWidth {
            backgroundView.widthAnchor.constraint(lessThanOrEqualToConstant: CommonSnapshotConstants.maxWidth).isActive = true
        }
        backgroundView.addSubview(self)
        NSLayoutConstraint.stickEdges(
            from: self,
            to: backgroundView,
            insets: .init(all: CommonSnapshotConstants.padding)
        )

        return backgroundView
    }
}
