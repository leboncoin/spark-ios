//
//  IconView.swift
//  Spark
//
//  Created by Jacklyn Situmorang on 24.08.23.
//  Copyright © 2023 Leboncoin. All rights reserved.
//

import SwiftUI
import SparkTheming

@available(*, deprecated, message: "Use SparkIcon instead")
public struct IconView: View {

    // MARK: - Private properties

    @ObservedObject private var viewModel: IconViewModelDeprecated
    @ScaledMetric private var sizeValue: CGFloat
    private var iconImage: Image

    // MARK: - Initialization

    /// A SwiftUI Icon component
    /// - Parameters:
    ///   - theme: The Spark theme
    ///   - intent: Intent of icon
    ///   - size: Size of icon
    public init(
        theme: any Theme,
        intent: IconIntent,
        size: IconSize,
        iconImage: Image
    ) {
        self.viewModel = IconViewModelDeprecated(
            theme: theme,
            intent: intent,
            size: size
        )
        self._sizeValue = ScaledMetric(wrappedValue: size.value)
        self.iconImage = iconImage
    }

    public var body: some View {
        iconImage
            .resizable()
            .frame(width: sizeValue, height: sizeValue)
            .foregroundColor(self.viewModel.color.color)
            .accessibilityIdentifier(IconAccessibilityIdentifier.view)
    }
}
