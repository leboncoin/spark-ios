//
//  RadioButtonCodeSyntaxes.swift
//  SparkDemo
//
//  Created by robin.lemaire on 22/01/2026.
//  Copyright © 2026 Leboncoin. All rights reserved.
//

import Foundation

struct RadioButtonCodeSyntaxes {

    // MARK: - Properties

    static var content: [CodeSyntax] = {
        return [
            .init(title: "Default", code: Self.defaultExample),
            .init(title: "Full Configuration", code: Self.fullConfiguration)
        ]
    }()

    // MARK: - Private Properties

    private static var defaultExample: String {
        """
        @State var selectedID: Int = 1

        RadioButtonView(
            theme: theme,
            id: 1,
            label: "Label 1",
            selectedID: $selectedID
        )
        """
    }

    private static var fullConfiguration: String {
        """
        @State var selectedID: Int = 1

        RadioButtonView(
            theme: theme,
            intent: .support,
            id: 1,
            label: "Label 1",
            selectedID: $selectedID,
            labelAlignment: .trailing
        )
        .disabled(false)
        .accessibilityLabel("Radio button label")
        """
    }
}
