//
//  View+SensoryFeedbackExtension.swift
//  SparkCommon
//
//  Created by jonathan.gaffe on 29/09/2025.
//  Copyright © 2025 Leboncoin. All rights reserved.
//

import SwiftUI

public struct SparkSensoryFeedback: Equatable, Sendable {

    // MARK: - Static

    /// Provides a physical metaphor you can use to complement a visual
    /// experience.
    ///
    /// Use this to provide feedback for UI elements colliding. It should
    /// supplement the user experience, since only some platforms will play
    /// feedback in response to it.
    public static let impact = SparkSensoryFeedback()

    /// Provides a physical metaphor you can use to complement a visual
    /// experience.
    ///
    /// Use this to provide feedback for UI elements colliding. It should
    /// supplement the user experience, since only some platforms will play
    /// feedback in response to it.
    ///
    /// Not all platforms will play different feedback for different weights and
    /// intensities of impact.
    public static func impact(style: UIImpactFeedbackGenerator.FeedbackStyle = .medium, intensity: Double? = 1.0) -> SparkSensoryFeedback {
        return .init(style: style, intensity: intensity)
    }

    /// Indicates that a UI element’s values are changing.
    ///
    /// Equivalent to ``selection(_:)`` with ``SelectionFeedback/default``.
    public static let selection = SparkSensoryFeedback()

    public static let success = SparkSensoryFeedback()

    /// Indicates that a task or action has produced a warning of some kind.
    public static let warning = SparkSensoryFeedback()

    /// Indicates that an error has occurred.
    public static let error = SparkSensoryFeedback()

    /// Indicates the alignment of a dragged item.
    ///
    /// For example, use this pattern in a drawing app when the user drags a
    /// shape into alignment with another shape.
    public static let alignment = SparkSensoryFeedback()

    // MARK: - Properties

    private let id = UUID()
    fileprivate let style: UIImpactFeedbackGenerator.FeedbackStyle?
    fileprivate let intensity: Double?

    // MARK: - Initialization

    private init(
        style: UIImpactFeedbackGenerator.FeedbackStyle? = nil,
        intensity: Double? = nil
    ) {
        self.style = style
        self.intensity = intensity
    }

    // MARK: - Methods

    @available(iOS 17.0, *)
    fileprivate func feedback() -> SensoryFeedback? {
        switch self {
        case .impact: .impact
        case .selection: .selection
        case .success: .success
        case .warning: .warning
        case .error: .error
        case .alignment: .alignment
        default: nil
        }
    }
}

// MARK: - FeedbackStyle Extension

@available(iOS 17.0, *)
private extension UIImpactFeedbackGenerator.FeedbackStyle {

    var sensoryImpactParameters: (weight: SensoryFeedback.Weight, intensity: Double) {
        return switch self {
        case .light: (.light, 1.0)
        case .medium: (.medium, 1.0)
        case .heavy: (.heavy, 1.0)
        case .soft: (.light, 0.6)
        case .rigid: (.heavy, 1.0)
        default: (.medium, 1.0)
        }
    }
}

// MARK: - View Extension

public extension View {

    /// Attaches haptic feedback to any `Equatable` trigger with a simple, effect-agnostic API.
    ///
    /// - Parameters:
    ///  - effect: The ``SparkSensoryFeedback``haptic effect to emit. Default is **.impact**.
    ///  - trigger: Any `Equatable` value; a change (by `==`) fires the haptic once.
    @ViewBuilder
    func sparkSensoryFeedback(
        _ effect: SparkSensoryFeedback = .impact,
        trigger: some Equatable
    ) -> some View {
        if #available(iOS 17.0, *) {
            if let feedback = effect.feedback() {
                self.sensoryFeedback(feedback, trigger: trigger)
            } else if let sensoryParameters = effect.style?.sensoryImpactParameters {
                self.sensoryFeedback(
                    .impact(
                        weight: sensoryParameters.weight,
                        intensity: effect.intensity ?? sensoryParameters.intensity
                    ),
                    trigger: trigger
                )
            } else {
                self.sensoryFeedback(.impact, trigger: trigger)
            }
        } else {
            switch effect {
            case .impact:
                self.onChange(of: trigger) { _ in
                    UIImpactFeedbackGenerator().impactOccurred()
                }
            case .selection:
                self.onChange(of: trigger) { _ in
                    UISelectionFeedbackGenerator().selectionChanged()
                }

            default:
                self.onChange(of: trigger) { _ in
                    UIImpactFeedbackGenerator(style: effect.style ?? .medium).impactOccurred()
                }
            }
        }
    }

    /// Attaches haptic feedback to any `Equatable` trigger with a simple, effect-agnostic API
    /// and the `condition` closure returns `true`.
    ///
    /// - Parameters:
    ///  - effect: The ``SparkSensoryFeedback``haptic effect to emit. Default is **.impact**.
    ///  - trigger: Any `Equatable` value; a change (by `==`) fires the haptic once.
    ///  - condition: A closure to determine whether to play the feedback when `trigger` changes.   
    @ViewBuilder
    nonisolated func sparkSensoryFeedback<T>(
        _ effect: SparkSensoryFeedback = .impact,
        trigger: T,
        condition: @escaping (_ oldValue: T, _ newValue: T) -> Bool
    ) -> some View where T: Equatable {
        if #available(iOS 17.0, *) {
            if let feedback = effect.feedback() {
                self.sensoryFeedback(
                    feedback,
                    trigger: trigger,
                    condition: condition
                )
            } else if let sensoryParameters = effect.style?.sensoryImpactParameters {
                self.sensoryFeedback(
                    .impact(
                        weight: sensoryParameters.weight,
                        intensity: effect.intensity ?? sensoryParameters.intensity
                    ),
                    trigger: trigger,
                    condition: condition
                )
            } else {
                self.sensoryFeedback(.impact, trigger: trigger)
            }
        } else {
            self.sparkSensoryFeedback(effect, trigger: trigger)
        }
    }
}
