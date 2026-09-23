//
//  SizePreferenceKey.swift
//  SparkCommon
//
//  Created by robin.lemaire on 26/01/2026.
//  Copyright © 2026 Leboncoin. All rights reserved.
//

import SwiftUI

private struct SizePreferenceKey: PreferenceKey {

    // MARK: - Properties

    static var defaultValue: CGSize = .zero
    static func reduce(value: inout CGSize, nextValue: () -> CGSize) {
        guard nextValue() != .zero else {
            return
        }

        value = nextValue()
    }
}

// MARK: - Extension

@_spi(SI_SPI) public extension View {

    func viewSize(onChange: @escaping (CGSize) -> Void) -> some View {
        self.background(
            GeometryReader { geo in
                Color.clear
                    .preference(key: SizePreferenceKey.self, value: geo.size)
            }
        )
        .onPreferenceChange(SizePreferenceKey.self, perform: onChange)
    }
}
