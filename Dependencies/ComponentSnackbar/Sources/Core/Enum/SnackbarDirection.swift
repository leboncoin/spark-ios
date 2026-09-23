//
//  SnackbarDirection.swift
//  SparkComponentSnackbar
//
//  Created by robin.lemaire on 10/07/2026.
//  Copyright © 2026 Leboncoin. All rights reserved.
//

import Foundation
import SwiftUI

/// `SnackbarDirection` determines the direction from which the snackbar appears and dismisses.
public enum SnackbarDirection: CaseIterable {
    case top
    case bottom

    // MARK: - Properties

    /// The default value. Equals to **.bottom**
    public static let `default`: SnackbarDirection = .bottom

    /// Use by the Snackar in SwiftUI
    internal var edge: Edge {
        switch self {
        case .top: .top
        case .bottom: .bottom
        }
    }

    internal var stackAlignment: Alignment {
        switch self {
        case .top: .top
        case .bottom: .bottom
        }
    }
}
