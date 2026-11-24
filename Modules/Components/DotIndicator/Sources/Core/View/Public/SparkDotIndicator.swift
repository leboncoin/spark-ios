//
//  SparkDotIndicator.swift
//  SparkComponentDotIndicator
//
//  Created by Robin Lemaire on 24/11/2026.
//  Copyright © 2026 Leboncoin. All rights reserved.
//

import SwiftUI
@_spi(SI_SPI) import SparkCommon

/// The Dot Indicator shows the user's progress in a sequence of pages (carousel, onboarding, ...).
///
/// The **active dot** (the current page) is wider than the **inactive dots**.
/// By default, the dot indicator is not interactive and the first page is selected.
///
/// ## Example of usage
///
/// ### Default (not interactive)
///
/// ```swift
/// struct MyView: View {
///     let theme: SparkTheming.Theme = MyTheme()
///
///     var body: some View {
///         SparkDotIndicator(numberOfPages: 5, currentPage: 2)
///             .sparkTheme(self.theme)
///     }
/// }
/// ```
///
/// ### With size and intent
///
/// ```swift
/// struct MyView: View {
///     let theme: SparkTheming.Theme = MyTheme()
///
///     var body: some View {
///         SparkDotIndicator(numberOfPages: 5, currentPage: 2)
///             .sparkTheme(self.theme)
///             .sparkDotIndicatorSize(.small)
///             .sparkDotIndicatorIntent(.surface)
///     }
/// }
/// ```
///
/// ### With tap interaction (large size only)
///
/// ```swift
/// struct MyView: View {
///     let theme: SparkTheming.Theme = MyTheme()
///     @State private var currentPage: Int = 0
///
///     var body: some View {
///         SparkDotIndicator(numberOfPages: 5, currentPage: self.$currentPage)
///             .sparkTheme(self.theme)
///             .sparkDotIndicatorSize(.large)
///     }
/// }
/// ```
///
/// ## EnvironmentValues
///
/// This component use some EnvironmentValues :
/// - **theme** : ``sparkTheme(_:)`` (View extension)
/// - **size** : ``sparkDotIndicatorSize(_:)`` (View extension)
/// - **intent** : ``sparkDotIndicatorIntent(_:)`` (View extension)
///
/// > If theses values are not set, default values will be applied.
///
/// > **YOU MUST PROVIDE ``sparkTheme(_:)``**
///
/// ## Interaction
///
/// Only the **large** size with the *Binding* initializer can have the tap interaction:
/// tapping on the leading half shows the previous page and tapping on the trailing half shows the next page.
///
/// ## Accessibility
///
/// The dot indicator is a single accessibility element, with a value like **"Page 1 of 5"**.
/// When it is interactive (*Binding* initializer), VoiceOver users can swipe up/down to change the page.
/// You should set an **accessibilityLabel** to give context to screen readers.
///
/// ## Rendering
///
/// ### Sizes
///
/// | Small | Medium (default) | Large |
/// |:---:|:---:|:---:|
/// | ![Small size.](dotIndicator_size_small.png) | ![Medium size.](dotIndicator_size_medium.png) | ![Large size.](dotIndicator_size_large.png) |
///
/// ### Intents
///
/// | Support (default) | Surface |
/// |:---:|:---:|
/// | ![Support intent.](dotIndicator_intent_support.png) | ![Surface intent.](dotIndicator_intent_surface.png) |
///
/// ### States
///
/// | Enabled | Disabled |
/// |:---:|:---:|
/// | ![Enabled state.](dotIndicator_size_medium.png) | ![Disabled state.](dotIndicator_isDisabled.png) |
///
public struct SparkDotIndicator: View {

    // MARK: - Properties

    @Binding private var currentPage: Int
    private let numberOfPages: Int
    private let isInteractive: Bool

    private var selectedPage: Int {
        self.currentPage.clampedPage(numberOfPages: self.numberOfPages)
    }

    // MARK: - Initialization

    /// Create a non interactive dot indicator.
    ///
    /// - Parameters:
    ///   - numberOfPages: The number of pages (dots).
    ///   - currentPage: The index of the current page, starting at **0**.
    ///
    /// ## Example of usage
    ///
    /// ```swift
    /// struct MyView: View {
    ///     let theme: SparkTheming.Theme = MyTheme()
    ///
    ///     var body: some View {
    ///         SparkDotIndicator(numberOfPages: 5, currentPage: 0)
    ///             .sparkTheme(self.theme)
    ///     }
    /// }
    /// ```
    public init(numberOfPages: Int, currentPage: Int) {
        self._currentPage = .constant(currentPage)
        self.numberOfPages = numberOfPages
        self.isInteractive = false
    }

    /// Create an interactive dot indicator.
    ///
    /// The tap interaction is only available on the **large** size.
    ///
    /// - Parameters:
    ///   - numberOfPages: The number of pages (dots).
    ///   - currentPage: The binding index of the current page, starting at **0**.
    ///
    /// ## Example of usage
    ///
    /// ```swift
    /// struct MyView: View {
    ///     let theme: SparkTheming.Theme = MyTheme()
    ///     @State private var currentPage: Int = 0
    ///
    ///     var body: some View {
    ///         SparkDotIndicator(numberOfPages: 5, currentPage: self.$currentPage)
    ///             .sparkTheme(self.theme)
    ///             .sparkDotIndicatorSize(.large)
    ///     }
    /// }
    /// ```
    public init(numberOfPages: Int, currentPage: Binding<Int>) {
        self._currentPage = currentPage
        self.numberOfPages = numberOfPages
        self.isInteractive = true
    }

    // MARK: - View

    public var body: some View {
        ForEach(0..<Swift.max(self.numberOfPages, 0), id: \.self) { index in
            DotIndicatorDot(isActive: index == self.selectedPage)
        }
        .dotIndicatorLayout()
        .animation(.easeInOut(duration: DotIndicatorConstants.animationDuration), value: self.selectedPage)
        .dotIndicatorOpacity()
        .dotIndicatorTapInteraction(
            isInteractive: self.isInteractive,
            numberOfPages: self.numberOfPages,
            currentPage: self.$currentPage
        )
        .dotIndicatorAccessibility(
            isInteractive: self.isInteractive,
            numberOfPages: self.numberOfPages,
            currentPage: self.$currentPage
        )
    }
}
