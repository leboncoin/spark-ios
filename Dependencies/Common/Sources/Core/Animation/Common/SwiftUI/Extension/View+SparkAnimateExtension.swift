//
//  View+SparkAnimateExtension.swift
//  SparkCommon
//
//  Created by robin.lemaire on 15/11/2024.
//  Copyright © 2024 Leboncoin. All rights reserved.
//

import SwiftUI

public extension View {

    /// Display a Spark Animation from a type and return a view.
    /// - parameter type: the animation type.
    /// - parameter play: the animation can be play or not. Default is *true*.
    /// - parameter delay: the delay before before starting the animation. Default is *.zero*.
    /// - parameter repeat: the repeat type of the animation. Default is *.none*.
    /// - parameter completion: the completion when the animation is finished. *Optional*. Default is *nil*.
    /// - Returns: A view.
    @ViewBuilder
    func animate(
        type: SparkAnimationType,
        play: Bool = true,
        delay: TimeInterval = .zero,
        repeat: SparkAnimationRepeat = .none,
        completion: (() -> Void)? = nil
    ) -> some View {
        if play {
            switch type {
            case .bell:
                self.modifier(BellAnimationModifier(
                    delay: delay,
                    repeat: `repeat`,
                    completion: completion
                ))
            }
        } else {
            self
        }
    }
}
