//
//  SparkAnimationRepeat.swift
//  SparkCommon
//
//  Created by robin.lemaire on 20/11/2024.
//  Copyright © 2024 Leboncoin. All rights reserved.
//

/// The Spark animations repeat options.
public enum SparkAnimationRepeat {
    /// The animations is played only once.
    case none
    /// The animations is played X times.
    case limited(_ value: Int)
    /// The animations is played indefinitely.
    case unlimited

    // MARK: - Methods

    internal func canContinue(counter: Int) -> Bool {
        return switch self {
        case .none:
            false
        case .limited(let occurence):
            counter < occurence
        case .unlimited:
            true
        }
    }
}
