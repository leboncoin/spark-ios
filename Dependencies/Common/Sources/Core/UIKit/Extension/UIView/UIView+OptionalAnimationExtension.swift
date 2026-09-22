//
//  UIView+OptionalAnimationExtension.swift
//  SparkCommon
//
//  Created by robin.lemaire on 16/01/2026.
//  Copyright © 2026 Leboncoin. All rights reserved.
//

import UIKit

public extension UIView {

    /// Animate changes to one or more views using the specified duration, delay, options, and completion handler
    /// only IF the **isReduceMotionEnabled** is disabled.
    ///
    /// - Parameters:
    ///   - duration: The total duration of the animations, measured in seconds.
    ///   If you specify a negative value or 0, the changes are made without animating them.
    ///
    ///   - delay: The amount of time (measured in seconds) to wait before beginning the animations.
    ///   Specify a value of 0 to begin the animations immediately.
    ///
    ///   - options: A mask of options indicating how you want to perform the animations.
    ///   For a list of valid constants, see ``UIView.AnimationOptions``.
    ///
    ///   - animations: A block object containing the changes to commit to the views.
    ///   This is where you programmatically change any animatable properties of the views in your view hierarchy.
    ///   This block takes no parameters and has no return value.
    ///   This parameter must not be NULL.
    ///
    ///   - completion: A block object to be executed when the animation sequence ends.
    ///   This block has no return value and takes a single Boolean argument that indicates whether
    ///   or not the animations actually finished before the completion handler was called.
    ///   If the duration of the animation is 0, this block is performed at the beginning of the next run loop cycle.
    ///   This parameter may be NULL.
    ///
    static func optionalAnimate(
        withDuration duration: TimeInterval,
        delay: TimeInterval,
        options: UIView.AnimationOptions = [],
        animations: @escaping () -> Void,
        completion: ((Bool) -> Void)? = nil
    ) {
        guard !UIAccessibility.isReduceMotionEnabled else {
            animations()
            completion?(true)
            return
        }

        Self.animate(
            withDuration: duration,
            delay: delay,
            options: options,
            animations: animations,
            completion: completion
        )
    }

    /// Animate changes to one or more views using the specified duration and completion handler
    /// only IF the **isReduceMotionEnabled** is disabled.
    ///
    /// - Parameters:
    ///   - duration: The total duration of the animations, measured in seconds.
    /// If you specify a negative value or 0, the changes are made without animating them.
    ///
    ///   - animations: A block object containing the changes to commit to the views.
    /// This is where you programmatically change any animatable properties of the views in your view hierarchy.
    /// This block takes no parameters and has no return value.
    /// This parameter must not be NULL.
    ///
    ///   - completion: A block object to be executed when the animation sequence ends.
    /// This block has no return value and takes a single Boolean argument that indicates
    /// whether or not the animations actually finished before the completion handler was called.
    /// If the duration of the animation is 0, this block is performed at the beginning of the next run loop cycle.
    /// This parameter may be NULL.
    ///
    static func optionalAnimate(
        withDuration duration: TimeInterval,
        animations: @escaping () -> Void,
        completion: ((Bool) -> Void)? = nil
    ) {
        guard !UIAccessibility.isReduceMotionEnabled else {
            animations()
            completion?(true)
            return
        }

        Self.animate(
            withDuration: duration,
            animations: animations,
            completion: completion
        )
    }

    /// Animate changes to one or more views using the specified duration
    /// only IF the **isReduceMotionEnabled** is disabled.
    ///
    /// - Parameters:
    ///   - duration: The total duration of the animations, measured in seconds.
    ///   If you specify a negative value or 0, the changes are made without animating them.
    ///
    ///   - animations: A block object containing the changes to commit to the views.
    ///   This is where you programmatically change any animatable properties of the views in your view hierarchy.
    ///   This block takes no parameters and has no return value.
    ///   This parameter must not be NULL.
    ///
    static func optionalAnimate(
        withDuration duration: TimeInterval,
        animations: @escaping () -> Void
    ) {
        guard !UIAccessibility.isReduceMotionEnabled else {
            animations()
            return
        }

        Self.animate(
            withDuration: duration,
            animations: animations
        )
    }

    /// Performs a view animation using a timing curve corresponding to the motion of a physical spring
    /// only IF the **isReduceMotionEnabled** is disabled.
    ///
    /// - Parameters:
    ///   - duration: The total duration of the animations, measured in seconds.
    ///   If you specify a negative value or 0, the changes are made without animating them.
    ///
    ///   - delay: The amount of time (measured in seconds) to wait before beginning the animations.
    ///   Specify a value of 0 to begin the animations immediately.
    ///
    ///   - dampingRatio: The damping ratio for the spring animation as it approaches its quiescent state.
    ///   To smoothly decelerate the animation without oscillation, use a value of 1.
    ///   Employ a damping ratio closer to zero to increase oscillation.
    ///
    ///   - velocity: The initial spring velocity. For smooth start to the animation, match this value to the view’s velocity as it was prior to attachment.
    ///   A value of 1 corresponds to the total animation distance traversed in one second.
    ///   For example, if the total animation distance is 200 points and you want the start of the animation to match a view velocity of 100 pt/s, use a value of 0.5.
    ///
    ///   - options: A mask of options indicating how you want to perform the animations.
    ///   For a list of valid constants, see ``UIView.AnimationOptions`.
    ///
    ///   - animations: A block object containing the changes to commit to the views.
    ///   This is where you programmatically change any animatable properties of the views in your view hierarchy.
    ///   This block takes no parameters and has no return value.
    ///   This parameter must not be NULL.
    ///
    ///   - completion: A block object to be executed when the animation sequence ends.
    ///   This block has no return value and takes a single Boolean argument that indicates whether
    ///   or not the animations actually finished before the completion handler was called.
    ///   If the duration of the animation is 0, this block is performed at the beginning of the next run loop cycle.
    ///   This parameter may be NULL.
    ///
    static func optionalAnimate(
        withDuration duration: TimeInterval,
        delay: TimeInterval,
        usingSpringWithDamping dampingRatio: CGFloat,
        initialSpringVelocity velocity: CGFloat,
        options: UIView.AnimationOptions = [],
        animations: @escaping () -> Void,
        completion: ((Bool) -> Void)? = nil
    ) {
        guard !UIAccessibility.isReduceMotionEnabled else {
            animations()
            completion?(true)
            return
        }

        Self.animate(
            withDuration: duration,
            delay: delay,
            usingSpringWithDamping: dampingRatio,
            initialSpringVelocity: velocity,
            options: options,
            animations: animations,
            completion: completion
        )
    }
}
