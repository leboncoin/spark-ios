//
//  TextEditor.swift
//  SparkEditor
//
//  Created by robin.lemaire on 05/09/2024.
//  Copyright © 2024 Leboncoin. All rights reserved.
//

import SwiftUI
import SparkTheming

/// The SwiftUI version for the text editor.
@available(*, deprecated, message: "Use SparkTextEditor instead")
public struct TextEditorView: View {

    // MARK: - Properties

    private let title: String
    private let theme: any Theme
    private let intent: TextEditorIntent

    @Binding private var text: String

    @FocusState private var isFocused: Bool
    @Environment(\.isEnabled) private var isEnabled

    // MARK: - Initialization

    /// TextEditorView initializer
    /// - Parameters:
    ///   - title: The texteditor's current placeholder
    ///   - text: The texteditor's text binding
    ///   - theme: The texteditor's current theme
    ///   - intent: The texteditor's current intent
    public init(
        _ title: String,
        text: Binding<String>,
        theme: any Theme,
        intent: TextEditorIntent
    ) {
        self.title = title
        self._text = text
        self.theme = theme
        self.intent = intent
    }

    // MARK: - View

    public var body: some View {
        TextEditorInternalView(
            title: self.title,
            text: self.$text,
            theme: self.theme,
            intent: self.intent
        )
        .isEnabled(self.isEnabled)
        .isFocused(self.isFocused)
        .focused(self.$isFocused)
    }
}
