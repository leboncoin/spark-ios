//
//  SnackbarAlignment.swift
//  SparkComponentSnackbar
//
//  Created by louis.borlee on 04/09/2024.
//  Copyright © 2024 Leboncoin. All rights reserved.
//

/// The content alignment of the snackbar.
public enum SnackbarAlignment: CaseIterable {
    case horizontal
    case vertical

    // MARK: - Properties

    /// The default value is *vertical*
    public static let `default`: Self = .vertical
}
