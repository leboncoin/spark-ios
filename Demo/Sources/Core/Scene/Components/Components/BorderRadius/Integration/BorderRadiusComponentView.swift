//
//  BorderRadiusComponentView.swift
//  SparkDemo
//
//  Created by robin.lemaire on 01/08/2025.
//  Copyright © 2025 Leboncoin. All rights reserved.
//

import SwiftUI

// MARK: - View

typealias BorderRadiusComponentView = ComponentViewable<BorderRadiusConfiguration, BorderRadiusImplementationView, BorderRadiusConfigurationView, BorderRadiusExtraTools>

extension BorderRadiusComponentView {

    init() {
        self.init(style: .verticalList, styles: [.verticalList])
    }
}

// MARK: - Subview

struct BorderRadiusImplementationView: ComponentImplementationViewable {

    // MARK: - Properties

    var configuration: Binding<BorderRadiusConfiguration>
    @State private var isOn: Bool = true

    // MARK: - View

    var body: some View {
        Rectangle()
            .fill(self.configurationWrapped.backgroundColor.color)
            .frame(height: self.configurationWrapped.contentSize.height)
            .fixedSize(horizontal: false, vertical: true)
            .border(self.configurationWrapped)
    }
}

// MARK: - Extension

private extension View {

    @ViewBuilder
    func border(_ configuration: BorderRadiusConfiguration) -> some View {
        switch configuration.radius {
        case .custom:
            self.sparkBorder(
                width: configuration.width.value(from: configuration),
                topLeadingRadius: configuration.topLeadingRadius,
                topTrailingRadius: configuration.topTrailingRadius,
                bottomTrailingRadius: configuration.bottomTrailingRadius,
                bottomLeadingRadius: configuration.bottomLeadingRadius,
                dash: configuration.dash,
                isHighlighted: configuration.isHighlighted,
                colorToken: configuration.borderColor,
                position: configuration.position,
                isScaled: configuration.swiftUIIsScaled
            )
        default:
            self.sparkBorder(
                    width: configuration.width.value(from: configuration),
                    radius: configuration.radius.value(from: configuration),
                    dash: configuration.dash,
                    isHighlighted: configuration.isHighlighted,
                    colorToken: configuration.borderColor,
                    position: configuration.position,
                    isScaled: configuration.swiftUIIsScaled
                )
        }
    }
}
