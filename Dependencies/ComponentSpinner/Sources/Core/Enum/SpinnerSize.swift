//
//  SpinnerSize.swift
//  SparkComponentSpinner
//
//  Created by robin.lemaire on 10/12/2025.
//  Copyright © 2025 Leboncoin. All rights reserved.
//

import Foundation

/// `SpinnerSize` is the size of the spinner. At the moment, only two sizes are available, medium and small.
public enum SpinnerSize: CaseIterable {
    case medium
    case small

    // MARK: - Properties

    /// The default case. Equals to **.medium**.
    public static let `default`: Self = .medium
}
