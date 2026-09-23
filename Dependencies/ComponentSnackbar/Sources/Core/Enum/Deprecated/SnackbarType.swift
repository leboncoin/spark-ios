//
//  SnackbarType.swift
//  SparkComponentSnackbar
//
//  Created by louis.borlee on 04/09/2024.
//  Copyright © 2024 Leboncoin. All rights reserved.
//

/// The type of the snackbar.
@available(*, deprecated, message: "This enum is no longer used and will be removed in a future version.")
public enum SnackbarType: CaseIterable {
    case horizontal
    case vertical

    // MARK: - Properties

    /// The default value is *vertical*
    public static let `default`: Self = .vertical
}
