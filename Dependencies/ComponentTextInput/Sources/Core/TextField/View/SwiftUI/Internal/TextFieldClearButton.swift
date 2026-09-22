//
//  TextFieldClearButton.swift
//  SparkComponentTextInput
//
//  Created by robin.lemaire on 10/06/2025.
//  Copyright © 2025 Leboncoin. All rights reserved.
//

import SwiftUI

struct TextFieldClearButton: View {

    // MARK: - Properties

    var action: @MainActor () -> Void

    // MARK: - View

    var body: some View {
        Button(action: self.action) {
            Image(systemName: Constants.clearButtonImageName)
                .resizable()
                .aspectRatio(contentMode: .fit)
                .scaledFrame(
                    width: Constants.clearButtonSize,
                    height: Constants.clearButtonSize,
                    relativeTo: .title2
                )
                .foregroundColor(Color(uiColor: .tertiaryLabel))
                .frame(maxHeight: .infinity)
                .scaledFrame(width: TextInputConstants.height)
                .aspectRatio(1, contentMode: .fit)
        }
        .accessibilityLabel(.init(Constants.clearButtonLabelKey, bundle: .current))
        .accessibilityIdentifier(TextFieldAccessibilityIdentifier.clearButton)
        .accessibilityShowsLargeContentViewer {
            Image(systemName: Constants.clearButtonImageName)
            Text(Constants.clearButtonLabelKey, bundle: .current)
        }
    }
}

// MARK: - Constants

private enum Constants {
    static let clearButtonSize: CGFloat = 17
    static let clearButtonImageName = "multiply.circle.fill"
    static let clearButtonLabelKey: LocalizedStringKey = "accessibility_clear_button_label"
}
