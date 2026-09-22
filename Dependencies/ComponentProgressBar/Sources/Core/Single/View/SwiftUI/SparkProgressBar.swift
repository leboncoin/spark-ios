//
//  SparkProgressBar.swift
//  SparkComponentProgressBar
//
//  Created by robin.lemaire on 17/12/2025.
//  Copyright © 2025 Leboncoin. All rights reserved.
//

import SwiftUI
import SparkCommon

/// A progress bar visually represents the completion status of a task or process.
///
/// ## Context
///
/// The progress bar component is used to display the length and your progression inside the process.
///
/// The value used to display the current state **MUST** be into 0 (for 0 %) and 1 (for 100%)
///
/// ## Example of usage
///
/// ```swift
/// struct MyView: View {
///     let theme: SparkTheming.Theme = MyTheme()
///
///     var body: some View {
///         SparkProgressBar(value: 0.5)
///         .sparkTheme(self.theme)
///         .sparkProgressBarIntent(.main)
///         .sparkProgressBarShape(.rounded)
///     }
/// }
/// ```
///
/// ## EnvironmentValues
///
/// This component use some EnvironmentValues :
/// - **theme** : ``sparkTheme(_:)`` (View extension)
/// - **iconIntent** : ``sparkProgressBarIntent(_:)`` (View extension)
/// - **iconShape** : ``sparkProgressBarShape(_:)`` (View extension)
///
/// > If theses values are not set, default values will be applied.
///
/// > **YOU MUST PROVIDE ``sparkTheme(_:)``**
///
/// ## Accessibility
///
/// By default, the accessibility value corresponding to the percentage of the value (Eg : **40%** for 0.4).
/// To override this value, you need to set a new **accessibilityValue**.
///
/// You also must set an **accessibilityLabel** to provide some context on the purpose of the component.
///
/// ## Rendering
///
/// ![ProgressBar rendering.](progress_bar_default.png)
///
public struct SparkProgressBar<Value>: View where Value: BinaryFloatingPoint {

    // MARK: - Properties

    private let value: Value

    @Environment(\.theme) private var theme
    @Environment(\.progressBarIntent) private var intent
    @Environment(\.progressBarShape) private var shape

    @StateObject private var viewModel = ProgressBarViewModel()

    // MARK: - Initialization

    /// Create a progress bar with a value.
    ///
    /// - Parameters:
    ///   - value: The indicator value of the progress bar.
    ///   Value **MUST** be into 0 (for 0 %) and 1 (for 100%)
    ///
    /// ## Example of usage
    ///
    /// ```swift
    /// struct MyView: View {
    ///     let theme: SparkTheming.Theme = MyTheme()
    ///
    ///     var body: some View {
    ///         SparkProgressBar(value: 0.5)
    ///         .sparkTheme(self.theme)
    ///         .sparkProgressBarIntent(.main)
    ///         .sparkProgressBarShape(.rounded)
    ///     }
    /// }
    /// ```
    ///
    /// ## Rendering
    ///
    /// ![ProgressBar rendering.](progress_bar_default.png)
    ///
    public init(value: Value) {
        self.value = value
    }

    // MARK: - View

    public var body: some View {
        ProgressView(value: self.value)
            .progressViewStyle(ProgressBarStyle(
                colors: self.viewModel.colors,
                cornerRadius: self.viewModel.cornerRadius
            ))
            .sparkFrame(height: ProgressBarConstants.height)
            .accessibilityIdentifier(ProgressBarAccessibilityIdentifier.view)
            .onAppear() {
                self.viewModel.setup(
                    theme: self.theme.value,
                    intent: self.intent,
                    shape: self.shape
                )
            }
            .onChange(of: self.theme) { theme in
                self.viewModel.theme = theme.value
            }
            .onChange(of: self.intent) { intent in
                self.viewModel.intent = intent
            }
            .onChange(of: self.shape) { shape in
                self.viewModel.shape = shape
            }
    }
}
