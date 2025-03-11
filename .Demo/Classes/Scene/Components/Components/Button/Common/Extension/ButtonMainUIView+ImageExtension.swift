//
//  ButtonMainUIView+ImageExtension.swift
//  SparkDemo
//
//  Created by robin.lemaire on 25/02/2025.
//  Copyright © 2025 Leboncoin. All rights reserved.
//

import Foundation

extension ButtonMainUIView {

    func demoSetImage(_ configuration: ButtonConfiguration) {
        self.setImage(from: configuration.contentNormal, for: .normal)
        self.setImage(from: configuration.contentHighlighted, for: .highlighted)
        self.setImage(from: configuration.contentSelected, for: .selected)
        self.setImage(from: configuration.contentDisabled, for: .disabled)
    }

    private func setImage(from content: ButtonConfiguration.Content, for state: ControlState) {
        self.setImage(.init(icon: content.icon), for: state)
    }
}
