//
//  SparkProgressBarIndeterminate.swift
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
/// The progress bar component is used to express a waiting time.
///
/// ## Example of usage
///
/// ```swift
/// struct MyView: View {
///     let theme: SparkTheming.Theme = MyTheme()
///
///     var body: some View {
///         SparkProgressBarIndeterminate(isAnimated: true)
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
/// By default, the component is not accessible.
/// To override this value, you need to set the **accessibilityHidden** to *false*.
///
/// In this case, an **accessibilityLabel** must be setted.
///
public struct SparkProgressBarIndeterminate: View {

    // MARK: - Properties

    @Environment(\.theme) private var theme
    @Environment(\.progressBarIntent) private var intent
    @Environment(\.progressBarShape) private var shape

    private let isAnimated: Bool

    @StateObject private var viewModel = ProgressBarIndeterminateViewModel()

    // MARK: - Initialization

    /// Create an indeterminate progress bar.
    ///
    /// - Parameters:
    ///   - isAnimated: Start or stop the animation of the progress bar.
    ///
    /// ## Example of usage
    ///
    /// ```swift
    /// struct MyView: View {
    ///     let theme: SparkTheming.Theme = MyTheme()
    ///
    ///     var body: some View {
    ///         SparkProgressBarIndeterminate(isAnimated: true)
    ///         .sparkTheme(self.theme)
    ///         .sparkProgressBarIntent(.main)
    ///         .sparkProgressBarShape(.rounded)
    ///     }
    /// }
    /// ```
    ///
    public init(isAnimated: Bool) {
        self.isAnimated = isAnimated
    }

    // MARK: - View

    public var body: some View {
        ProgressView()
            .progressViewStyle(ProgressBarStyle(
                colors: self.viewModel.colors,
                cornerRadius: self.viewModel.cornerRadius,
                indicatorModifier: ProgressBarIndeterminateModifier(viewModel: self.viewModel)
            ))
            .sparkFrame(height: ProgressBarConstants.height)
            .accessibilityIdentifier(ProgressBarAccessibilityIdentifier.view)
            .accessibilityHidden(true)
            .onAppear() {
                self.viewModel.setup(
                    theme: self.theme.value,
                    intent: self.intent,
                    shape: self.shape,
                    isAnimated: self.isAnimated
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
            .onChange(of: self.isAnimated) { isAnimated in
                self.viewModel.isAnimated = isAnimated
            }
    }
}
