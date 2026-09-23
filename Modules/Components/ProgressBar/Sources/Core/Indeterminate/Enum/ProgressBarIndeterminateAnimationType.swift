//
//  ProgressBarIndeterminateAnimationType.swift
//  SparkComponentProgressBar
//
//  Created by robin.lemaire on 28/09/2023.
//  Copyright © 2023 Leboncoin. All rights reserved.
//

enum ProgressBarIndeterminateAnimationType: Equatable {
    case easeIn
    case easeOut
    case reset

    // MARK: - Properties

    /// Get the next animation type
    @available(*, deprecated, message: "Not used anymore by the new SparkProgressBarIndeterminate or SparkUIProgressBarIndeterminate")
    mutating func next() {
        switch self {
        case .easeIn:
            self = .easeOut
        case .easeOut:
            self = .reset
        case .reset:
            self = .easeIn
        }
    }
}
