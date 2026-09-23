//
//  TextLinkImageSizeMock+ExtensionTests.swift
//  SparkComponentTextLink
//
//  Created by robin.lemaire on 18/12/2023.
//  Copyright © 2023 Leboncoin. All rights reserved.
//

@testable import SparkComponentTextLink
import Foundation

extension TextLinkImageSize {

    // MARK: - Methods

    static func mocked(
        size: CGFloat = 10,
        padding: CGFloat = 11
    ) -> Self {
        return .init(
            size: size,
            padding: padding
        )
    }
}
