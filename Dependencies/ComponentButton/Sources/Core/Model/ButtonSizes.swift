//
//  ButtonSizes.swift
//  SparkComponentButton
//
//  Created by robin.lemaire on 30/06/2023.
//  Copyright © 2023 Leboncoin. All rights reserved.
//

import Foundation

struct ButtonSizes: Equatable {

    // MARK: - Properties

    var height: CGFloat = .zero
    var width: CGFloat = .zero
    var isFixedHeight: Bool = false
    var isFixedWidth: Bool = false
    var maxHeight: CGFloat?
    var imageSize: CGFloat = .zero
}
