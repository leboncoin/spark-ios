//
//  ProgressBarShape.swift
//  SparkComponentProgressBar
//
//  Created by robin.lemaire on 06/10/2023.
//  Copyright © 2023 Leboncoin. All rights reserved.
//

/// All ProgressBar variants can have different shapes.
public enum ProgressBarShape: CaseIterable, Equatable {
    /// Progress bar with rounded corners.
    case rounded
    /// Progress bar with no rounded corners.
    case square

    // MARK: - Properties

    /// The default case. Equals to **.rounded**.
    public static let `default`: Self = .rounded
}
