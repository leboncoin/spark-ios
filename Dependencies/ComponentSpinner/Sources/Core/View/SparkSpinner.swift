//
//  SparkSpinner.swift
//  SparkComponentSpinner
//
//  Created by robin.lemaire on 06/11/2025.
//  Copyright © 2025 Leboncoin. All rights reserved.
//

import SwiftUI
import SparkTheming
@_spi(SI_SPI) import SparkCommon

/// The spinner is a revolving animated icon indicating ongoing process or loading activity.
///
/// A spinner is a dynamic graphical element used to indicate loading or processing,
/// providing visual feedback during wait times or background tasks.
///
/// ## Example of usage
///
/// ```swift
/// struct MyView: View {
///     let theme: SparkTheming.Theme = MyTheme()
///
///     var body: some View {
///         SparkSpinner()
///         .sparkTheme(self.theme)
///         .sparkSpinnerIntent(.main)
///         .sparkSpinnerSize(.small)
///     }
/// }
/// ```
///
/// ## EnvironmentValues
///
/// This component use some EnvironmentValues :
/// - **theme** : ``sparkTheme(_:)`` (View extension)
/// - **intent** : ``sparkSpinnerIntent(_:)`` (View extension)
/// - **size** : ``sparkSpinnerSize(_:)`` (View extension)
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
public struct SparkSpinner: View {

    // MARK: - Properties

    @Environment(\.theme) private var theme
    @Environment(\.spinnerIntent) private var intent
    @Environment(\.spinnerSize) private var size

    @State private var rotate = false

    @LimitedScaledMetric private var strokeWidth: CGFloat

    @StateObject private var viewModel = SpinnerViewModel()

    // MARK: - Initialization

    /// Create a spinner.
    ///
    /// ## Example of usage
    ///
    /// ```swift
    /// struct MyView: View {
    ///     let theme: SparkTheming.Theme = MyTheme()
    ///
    ///     var body: some View {
    ///         SparkSpinner()
    ///         .sparkTheme(self.theme)
    ///         .sparkSpinnerIntent(.main)
    ///         .sparkSpinnerSize(.small)
    ///     }
    /// }
    /// ```
    public init() {
        self._strokeWidth = .init(value: SpinnerConstants.strokeWidth)
    }

    // MARK: - View

    public var body: some View {
        Circle()
            .trim(from: 0, to: 0.5)
            .stroke(lineWidth: self.strokeWidth)
            .foregroundStyle(self.viewModel.colorToken)
            .sparkFrame(size: self.viewModel.contentSize)
            .rotationEffect(.degrees(self.rotate ? 360 : 0))
            .animation(
                .rotation(self.rotate),
                value: self.rotate
            )
            .task {
                self.rotate = true
            }
            .accessibilityIdentifier(SpinnerAccessibilityIdentifier.view)
            .accessibilityHidden(true)
            .onAppear() {
                self.viewModel.setup(
                    theme: self.theme.value,
                    intent: self.intent,
                    size: self.size
                )
            }
            .onChange(of: self.theme) { theme in
                self.viewModel.theme = self.theme.value
            }
            .onChange(of: self.intent) { intent in
                self.viewModel.intent = intent
            }
            .onChange(of: self.size) { size in
                self.viewModel.size = size
            }
    }
}

// MARK: - Extension

private extension Animation {

    static func rotation(_ isAnimated: Bool) -> Self? {
        guard isAnimated else {
            return nil
        }

        return .linear(duration: SpinnerConstants.animationDuration)
            .repeatForever(autoreverses: false)
    }
}
