 //
//  SparkRatingInput.swift
//  SparkComponentRating
//
//  Created by robin.lemaire on 09/01/2026.
//  Copyright © 2026 Leboncoin. All rights reserved.
//

import SwiftUI
import SparkCommon

/// The ratings let users set a star rating for a user or experience.
///
/// The **value** passed in parameter must be between **0 and 5**.
///
/// ## Example of usage
///
/// ```swift
/// struct MyView: View {
///     let theme: SparkTheming.Theme = MyTheme()
///     @State var value: Double = 3.0
///
///     var body: some View {
///         SparkRatingInput(value: self.$value)
///             .sparkTheme(self.theme)
///             .disabled(false)
///     }
/// }
/// ```
///
/// ## EnvironmentValues
///
/// This component use some EnvironmentValues :
/// - **theme** : ``sparkTheme(_:)`` (View extension)
/// - **disabled** : ``disabled(_:)`` (View extension)
///
/// > **YOU MUST PROVIDE ``sparkTheme(_:)``**
///
/// ## Accessibility
///
/// You must set an **accessibilityLabel** to give some context.
///
/// By default, the component set an localized **accessibilityValue**
/// with the current value and the number of stars :"1 out of 5" / "1 sur 5".
/// To override this value, you need to set a new **accessibilityValue**.
///
/// ## Rendering
///
/// ![Rating rendering.](rating_input_default.png)
///
/// ### When is disabled
///
/// ![Rating rendering.](rating_input_disabled.png)
///
public struct SparkRatingInput: View {

    // MARK: - Properties

    @Binding private var value: Double

    @Environment(\.theme) private var theme
    @Environment(\.isEnabled) private var isEnabled

    private let stars = RatingInputConstants.stars
    private let size = RatingInputConstants.size

    @StateObject private var viewModel = RatingInputViewModel()

    @State private var feedbackID: UUID?
    @State private var selectedIndex: Int?

    // MARK: - Initialization

    /// Create a rating input with a value.
    ///
    /// - Parameters:
    ///   - value: The Double value.
    ///
    /// ## Example of usage
    ///
    /// ```swift
    /// struct MyView: View {
    ///     let theme: SparkTheming.Theme = MyTheme()
    ///     @State var value: Int = 3
    ///
    ///     var body: some View {
    ///         SparkRatingInput(value: self.$value)
    ///             .sparkTheme(self.theme)
    ///             .disabled(false)
    ///     }
    /// }
    /// ```
    ///
    /// ## Rendering
    ///
    /// ![Rating rendering.](rating_input_default.png)
    public init(value: Binding<Double>) {
        self._value = value
    }

    // MARK: - Initialization

    public var body: some View {
        SparkHStack(spacing: self.viewModel.spacing) {
            ForEach((0...self.stars - 1), id: \.self) { index in
                let ratio = self.viewModel.getFillingRatio(
                    at: index,
                    count: self.stars,
                    value: self.value
                )

                RatingStarView(
                    colors: self.viewModel.colors,
                    ratio: ratio
                )
                .sparkFrame(size: self.size)
                .scaleEffect(self.selectedIndex == index ? RatingInputConstants.scaledRatio : 1)
            }
        }
        .overlay(content: {
            GeometryReader { reader in
                Color.clear
                    .contentShape(Rectangle())
                    .gesture(
                        DragGesture(minimumDistance: 0)
                            .onChanged { value in
                                let ratio = value.location.x / reader.size.width
                                let newValue = self.viewModel.getNewValue(
                                    from: ratio
                                )

                                self.selectedIndex = Int(newValue) - 1

                                if newValue != self.value {
                                    // Sensory Feedback setted only if value changed
                                    self.feedbackID = UUID()

                                    self.value = newValue
                                }
                            }
                            .onEnded { _ in
                                self.selectedIndex = nil
                            }
                    )
            }
        })
        .optionalAnimation(
            .easeInOut(duration: RatingInputConstants.scaledAnimationDuration),
            value: self.selectedIndex
        )
        .opacity(self.viewModel.dim)
        .sparkFrame(height: self.size)
        .sparkSensoryFeedback(.selection, trigger: self.feedbackID)
        .accessibilityElement(children: .ignore)
        .accessibilityIdentifier(RatingInputAccessibilityIdentifier.view)
        .accessibilityAddTraits(.isButton)
        .accessibilityValue(String.accessibilityValue(
            rating: Double(self.value),
            numberOfStars: self.stars
        ))
        .dynamicTypeSize(DynamicTypeSize.large...DynamicTypeSize.xxxLarge)
        .accessibilityAdjustableAction { direction in
            switch direction {
            case .increment:
                guard let newValue = self.viewModel.getIncrementedValue(from: self.value) else {
                    break
                }
                self.value = newValue
            case .decrement:
                guard let newValue = self.viewModel.getDecrementedValue(from: self.value) else {
                    break
                }
                self.value = newValue
            @unknown default:
                break
            }
        }
        .onAppear() {
            self.viewModel.setup(
                theme: self.theme.value,
                isEnabled: self.isEnabled
            )
        }
        .onChange(of: self.theme) { theme in
            self.viewModel.theme = theme.value
        }
        .onChange(of: self.isEnabled) { isEnabled in
            self.viewModel.isEnabled = isEnabled
        }
    }
}
