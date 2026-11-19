//
//  PopoverComponentView.swift
//  SparkDemo
//
//  Created by robin.lemaire on 29/01/2025.
//  Copyright © 2025 Leboncoin. All rights reserved.
//

import SwiftUI

// MARK: - View

typealias PopoverComponentView = ComponentViewable<PopoverConfiguration, PopoverImplementationView, PopoverConfigurationView, PopoverExtraTools>

extension PopoverComponentView {

    init() {
        self.init(style: .verticalList, styles: [.alone, .verticalList])
    }
}

// MARK: - Subview

struct PopoverImplementationView: ComponentImplementationViewable {

    // MARK: - Properties

    var configuration: Binding<PopoverConfiguration>

    @State private var isPresented: Bool = false

    // MARK: - View

    var body: some View {
        Button(action: {
            self.isPresented = true
        }, label: {
            Text("Show popover")
                .frame(maxWidth: .infinity)
        })
        .buttonStyle(.borderedProminent)
        .sparkPopover(isPresented: self.$isPresented) {
            Text(self.configurationWrapped.text)
                .frame(width: 300)
        }
        .sparkTheme(self.configurationWrapped.theme.value)
        .sparkPopoverIntent(self.configurationWrapped.intent)
    }
}
