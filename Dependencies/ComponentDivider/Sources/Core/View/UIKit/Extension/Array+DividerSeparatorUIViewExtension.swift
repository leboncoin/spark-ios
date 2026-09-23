//
//  Array+DividerSeparatorUIViewExtension.swift
//  SparkComponentDivider
//
//  Created by robin.lemaire on 18/11/2025.
//  Copyright © 2025 Leboncoin. All rights reserved.
//

import SparkTheming

extension Array where Element == DividerSeparatorUIView {

    func axis(_ axis: DividerAxis) {
        for item in self {
            item.axis = axis
        }
    }

    func backgroundColor(_ colorToken: any ColorToken) {
        for item in self {
            item.backgroundColor(colorToken)
        }
    }

    func deactivateConstraints() {
        for item in self {
            item.deactivateConstraints()
        }
    }

    func widthTypes(_ widthTypes: DividerSeparatorWidthTypes) {
        for item in self {
            item.widthTypes = widthTypes
        }
    }
}
