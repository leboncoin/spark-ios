//
//  View+ProportionalWidthExtension.swift
//  SparkCommon
//
//  Created by robin.lemaire on 27/10/2023.
//  Copyright © 2023 Leboncoin. All rights reserved.
//

import SwiftUI

@_spi(SI_SPI) public extension View {

    /// Set a proportional width from the parent width
    /// - Parameters:
    ///   - ratio: ratio of the parent view width.
    func proportionalWidth(
        from ratio: CGFloat
    ) -> some View {
        GeometryReader { reader in
            self.frame(width: ratio * reader.size.width)
        }
    }
}
