//
//  SegmentedControlComponentView.swift
//  SparkDemo
//
//  Created by robin.lemaire on 25/06/2026.
//  Copyright © 2026 Leboncoin. All rights reserved.
//

import SparkComponentSegmentedControl
import SwiftUI

// MARK: - View

typealias SegmentedControlComponentView = ComponentViewable<SegmentedControlConfiguration, SegmentedControlImplementationView, SegmentedControlConfigurationView, SegmentedControlExtraTools>

extension SegmentedControlComponentView {

    init() {
        self.init(style: .alone, styles: [.alone])
    }
}

// MARK: - Subview

struct SegmentedControlImplementationView: ComponentImplementationViewable {

    // MARK: - Properties

    var configuration: Binding<SegmentedControlConfiguration>
    @State private var selection: Int = -1

    // MARK: - View

    var body: some View {
        self.component()
            .sparkTheme(self.configurationWrapped.theme.value)
            .demoBackground(self.configurationWrapped)
            .demoDisabled(self.configurationWrapped)
            .demoAccessibilityLabel(self.configurationWrapped)
    }

    // MARK: - Component

    @ViewBuilder
    private func component() -> some View {
        switch self.configurationWrapped.contentType {
        case .icon: self.componentWithIcon()
        case .text: self.componentWithText()
        case .iconAndText: self.componentWithIconAndText()
        case .custom: self.componentWithCustom()
        case .multiple: self.componentWithMultiple()
        }
    }

    @ViewBuilder
    private func componentWithIcon() -> some View {
        SparkSegmentedControl(selection: self.$selection) {
            ForEach(self.configurationWrapped.items) { item in
                self.itemWithIcon(item)
            }
        }
    }

    @ViewBuilder
    private func componentWithText() -> some View {
        SparkSegmentedControl(selection: self.$selection) {
            ForEach(self.configurationWrapped.items) { item in
                self.itemWithText(item)
            }
        }
    }

    @ViewBuilder
    private func componentWithIconAndText() -> some View {
        SparkSegmentedControl(selection: self.$selection) {
            ForEach(self.configurationWrapped.items) { item in
                self.itemWithIconAndText(item)
            }
        }
    }

    @ViewBuilder
    private func componentWithCustom() -> some View {
        SparkSegmentedControl(selection: self.$selection) {
            ForEach(self.configurationWrapped.items) { item in
                self.itemWithCustom(item)
            }
        }
    }

    @ViewBuilder
    private func componentWithMultiple() -> some View {
        SparkSegmentedControl(selection: self.$selection) {
            ForEach(self.configurationWrapped.items) { item in
                switch item.contentType {
                case .icon: self.itemWithIcon(item)
                case .text: self.itemWithText(item)
                case .iconAndText: self.itemWithIconAndText(item)
                case .custom: self.itemWithCustom(item)
                case .multiple: Text("Unknow")
                }
            }
        }
    }

    // MARK: - Item Component

    @ViewBuilder
    private func itemWithIcon(_ item: SegmentedControlConfiguration.Item) -> some View {
        SparkSegmentedControlItem(
            tag: item.id,
            icon: Image(icon: item.icon)
        )
    }

    @ViewBuilder
    private func itemWithText(_ item: SegmentedControlConfiguration.Item) -> some View {
        SparkSegmentedControlItem(
            tag: item.id,
            text: item.text
        )
    }

    @ViewBuilder
    private func itemWithIconAndText(_ item: SegmentedControlConfiguration.Item) -> some View {
        SparkSegmentedControlItem(
            tag: item.id,
            text: item.text,
            icon: Image(icon: item.icon)
        )
    }

    @ViewBuilder
    private func itemWithCustom(_ item: SegmentedControlConfiguration.Item) -> some View {
        SparkSegmentedControlItem(tag: item.id) {
            VStack {
                Image(icon: item.icon)
                Text(item.text)
                Text("subtitle")
                    .font(.footnote)
                    .bold()
                    .foregroundColor(.blue)
            }
        }
    }
}
