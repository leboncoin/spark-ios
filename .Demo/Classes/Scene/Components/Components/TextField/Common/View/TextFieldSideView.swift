//
//  TextFieldSideView.swift
//  SparkDemo
//
//  Created by robin.lemaire on 27/01/2025.
//  Copyright © 2025 Leboncoin. All rights reserved.
//

import SwiftUI

struct TextFieldSideView: View {

    // MARK: - Properties

    let sideViewContent: TextFieldSideViewContentType
    let theme: Theme
    let side: TextFieldContentSide
    let isAddon: Bool

    @State private var isShowingAlert: Bool = false

    // MARK: - Initialization

    init(theme: DemoThemes.Theme, sideViewContent: TextFieldSideViewContentType, side: TextFieldContentSide, isAddon: Bool = false) {
        self.sideViewContent = sideViewContent
        self.theme = theme.value
        self.side = side
        self.isAddon = isAddon
    }

    // MARK: - View

    var body: some View {
        switch self.sideViewContent {
        case .none:
            EmptyView()
        case .button:
            self.createButton()
        case .text:
            self.createText()
        case .image:
            self.createImage()
        }
    }

    private func createImage() -> some View {
        let configuration: (Iconography, Color) = switch (self.side, self.isAddon) {
        case (.left, true): (.infoOutline, .yellow)
        case (.right, true): (.arrowRight, .purple)
        case (.left, false): (.cross, .orange)
        case (.right, false): (.warningFill, .red)
        }

        return Image(icon: configuration.0)
            .foregroundStyle(configuration.1)
    }

    private func createText() -> some View {
        let color: Color = switch (self.side, self.isAddon) {
        case (.left, true): .teal
        case (.right, true): .green
        case (.left, false): .pink
        case (.right, false): .blue
        }

        return Text(self.side.name)
            .foregroundStyle(color)
    }

    private func createButton() -> some View {
        let intent: ButtonIntent = switch (self.side, self.isAddon) {
        case (.left, true): .danger
        case (.right, true): .success
        case (.left, false): .info
        case (.right, false): .alert
        }

        return ButtonView(
            theme: self.theme,
            intent: intent,
            variant: self.isAddon ? .tinted : .filled,
            size: self.isAddon ? .large : .small,
            shape: self.isAddon ? .square : .pill,
            alignment: .leadingImage) {
                self.isShowingAlert = true
            }
            .title(self.side.rawValue, for: .normal)
            .alert(isPresented: self.$isShowingAlert) {
                Alert(title: Text("\(self.side.rawValue) \(self.isAddon ? "addon" : "view") button has been pressed"), message: nil, dismissButton: Alert.Button.cancel())
            }
    }
}
