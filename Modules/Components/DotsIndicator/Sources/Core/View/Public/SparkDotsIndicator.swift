//
//  SparkDotsIndicator.swift
//  SparkComponentDotsIndicator
//
//  Created by Robin Lemaire on 24/11/2026.
//  Copyright © 2026 Leboncoin. All rights reserved.
//

import SwiftUI
@_spi(SI_SPI) import SparkCommon

/// The Dots Indicator shows the user's progress in a sequence of pages (carousel, onboarding, ...).
///
/// The **active dot** (the current page) is wider than the **inactive dots**.
/// By default, the dots indicator is not interactive and the first page is selected.
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
///         SparkDotsIndicator(numberOfPages: 5, currentPage: 2)
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
///         SparkDotsIndicator(numberOfPages: 5, currentPage: 2)
///             .sparkTheme(self.theme)
///             .sparkDotsIndicatorSize(.small)
///             .sparkDotsIndicatorIntent(.surface)
///     }
/// }
/// ```
///
/// ### With interaction
///
/// ```swift
/// struct MyView: View {
///     let theme: SparkTheming.Theme = MyTheme()
///     @State private var currentPage: Int = 0
///
///     var body: some View {
///         SparkDotsIndicator(numberOfPages: 5, currentPage: self.$currentPage)
///             .sparkTheme(self.theme)
///             .sparkDotsIndicatorSize(.large)
///     }
/// }
/// ```
///
/// ## EnvironmentValues
///
/// This component use some EnvironmentValues :
/// - **theme** : ``sparkTheme(_:)`` (View extension)
/// - **size** : ``sparkDotsIndicatorSize(_:)`` (View extension)
/// - **intent** : ``sparkDotsIndicatorIntent(_:)`` (View extension)
///
/// > If theses values are not set, default values will be applied.
///
/// > **YOU MUST PROVIDE ``sparkTheme(_:)``**
///
/// ## Interaction
///
/// The *Binding* initializer makes the dots indicator interactive:
/// - **Tap**: tapping before the active dot shows the previous page, tapping after it shows the next page.
/// - **Swipe**: swiping to the leading edge shows the next page, swiping to the trailing edge shows the previous page.
/// - **Long press and move**: after a long press, moving the finger changes the page dot after dot.
///
/// Each page change triggers a selection haptic feedback.
///
/// ## Accessibility
///
/// The dots indicator is a single accessibility element, with a value like **"Page 1 of 5"**.
/// When it is interactive (*Binding* initializer), VoiceOver users can swipe up/down to change the page.
/// You should set an **accessibilityLabel** to give context to screen readers.
///
/// ## Rendering
///
/// ### Sizes
///
/// | Small | Medium (default) | Large |
/// |:---:|:---:|:---:|
/// | ![Small size.](dotsIndicator_size_small.png) | ![Medium size.](dotsIndicator_size_medium.png) | ![Large size.](dotsIndicator_size_large.png) |
///
/// ### Intents
///
/// | Support (default) | Surface |
/// |:---:|:---:|
/// | ![Support intent.](dotsIndicator_intent_support.png) | ![Surface intent.](dotsIndicator_intent_surface.png) |
///
/// ### States
///
/// | Enabled | Disabled |
/// |:---:|:---:|
/// | ![Enabled state.](dotsIndicator_size_medium.png) | ![Disabled state.](dotsIndicator_isDisabled.png) |
///
public struct SparkDotsIndicator: View {

    // MARK: - Properties

    @Binding private var currentPage: Int
    private let numberOfPages: Int
    private let isInteractive: Bool

    @Environment(\.theme) private var theme

    private var selectedPage: Int {
        self.currentPage.clampedPage(numberOfPages: self.numberOfPages)
    }

    // MARK: - Initialization

    /// Create a non interactive dots indicator.
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
    ///         SparkDotsIndicator(numberOfPages: 5, currentPage: 0)
    ///             .sparkTheme(self.theme)
    ///     }
    /// }
    /// ```
    public init(numberOfPages: Int, currentPage: Int) {
        self._currentPage = .constant(currentPage)
        self.numberOfPages = numberOfPages
        self.isInteractive = false
    }

    /// Create an interactive dots indicator.
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
    ///         SparkDotsIndicator(numberOfPages: 5, currentPage: self.$currentPage)
    ///             .sparkTheme(self.theme)
    ///             .sparkDotsIndicatorSize(.large)
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
            DotsIndicatorDot(isActive: index == self.selectedPage)
                .dotsIndicatorDotFrame(index: index, selectedPage: self.selectedPage, numberOfPages: self.numberOfPages)
        }
        .dotsIndicatorLayout()
        .optionalAnimation(self.theme.animation.activeDot, value: self.selectedPage)
        .dotsIndicatorOpacity()
        .dotsIndicatorTapInteraction(
            isInteractive: self.isInteractive,
            numberOfPages: self.numberOfPages,
            currentPage: self.$currentPage
        )
        .dotsIndicatorAccessibility(
            isInteractive: self.isInteractive,
            numberOfPages: self.numberOfPages,
            currentPage: self.$currentPage
        )
    }
}
