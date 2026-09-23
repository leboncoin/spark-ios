//
//  BorderComponentView.swift
//  SparkDemo
//
//  Created by robin.lemaire on 01/08/2025.
//  Copyright © 2025 Leboncoin. All rights reserved.
//

import SwiftUI

// MARK: - View

typealias BorderComponentView = ComponentViewable<BorderConfiguration, BorderImplementationView, BorderConfigurationView, BorderExtraTools>

extension BorderComponentView {

    init() {
        self.init(style: .verticalList, styles: [.verticalList])
    }
}

// MARK: - Subview

struct BorderImplementationView: ComponentImplementationViewable {

    // MARK: - Properties

    var configuration: Binding<BorderConfiguration>
    @State private var isOn: Bool = true

    // MARK: - View

    var body: some View {
        Rectangle()
            .fill(.background)
            .frame(height: self.configurationWrapped.contentSize.height)
            .fixedSize(horizontal: false, vertical: true)
            .sparkBorder(
                width: self.configurationWrapped.width.value(from: self.configurationWrapped),
                dash: self.configurationWrapped.dash,
                colorToken: self.configurationWrapped.borderColor,
                position: self.configurationWrapped.position,
                isScaled: self.configurationWrapped.swiftUIIsScaled
            )
    }
}
