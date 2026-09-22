//
//  View+DimOverlayExtension.swift
//  SparkCommon
//
//  Created by robin.lemaire on 29/09/2025.
//  Copyright © 2025 Leboncoin. All rights reserved.
//

import SwiftUI

@_spi(SI_SPI) public extension View {

    /// Add a traits if the condition is true otherwise remove the traits.
    @ViewBuilder
    func dimmedOverlay<Content>(
        _ dim: CGFloat,
        @ViewBuilder content: @escaping () -> Content
    ) -> some View where Content: View {
        if dim.showViewFromDim {
            self.overlay {
                content()
                    .opacity(dim)
            }
        } else {
            self
        }
    }
}
