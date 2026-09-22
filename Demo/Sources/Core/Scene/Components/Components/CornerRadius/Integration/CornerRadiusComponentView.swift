//
//  CornerRadiusComponentView.swift
//  SparkDemo
//
//  Created by robin.lemaire on 01/08/2025.
//  Copyright © 2025 Leboncoin. All rights reserved.
//

import SwiftUI

// MARK: - View

typealias CornerRadiusComponentView = ComponentViewable<CornerRadiusConfiguration, CornerRadiusImplementationView, CornerRadiusConfigurationView, CornerRadiusExtraTools>

extension CornerRadiusComponentView {

    init() {
        self.init(style: .verticalList, styles: [.verticalList])
    }
}

// MARK: - Subview

struct CornerRadiusImplementationView: ComponentImplementationViewable {

    // MARK: - Properties

    var configuration: Binding<CornerRadiusConfiguration>
    @State private var isOn: Bool = true

    // MARK: - View

    var body: some View {
        Rectangle()
            .fill(self.configurationWrapped.backgroundColor.color)
            .cornerRadius(self.configurationWrapped)
            .frame(height: self.configurationWrapped.contentSize.height)
            .fixedSize(horizontal: false, vertical: true)
    }
}

// MARK: - Extension

private extension View {

    @ViewBuilder
    func cornerRadius(_ configuration: CornerRadiusConfiguration) -> some View {
        switch configuration.radius {
        case .custom:
            self.sparkCornerRadius(
                topLeading: configuration.topLeadingRadius,
                topTrailing: configuration.topTrailingRadius,
                bottomTrailing: configuration.bottomTrailingRadius,
                bottomLeading: configuration.bottomLeadingRadius,
                isHighlighted: configuration.isHighlighted,
                isScaled: configuration.swiftUIIsScaled
            )
        default:
            self.sparkCornerRadius(
                configuration.radius.value(from: configuration),
                isHighlighted: configuration.isHighlighted,
                isScaled: configuration.swiftUIIsScaled
            )
        }
    }
}
