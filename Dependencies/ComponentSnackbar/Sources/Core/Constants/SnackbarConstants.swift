//
//  SnackbarConstants.swift
//  SparkComponentSnackbar
//
//  Created by louis.borlee on 04/09/2024.
//  Copyright © 2024 Leboncoin. All rights reserved.
//

import Foundation
import SparkComponentButton

enum SnackbarConstants {

    // MARK: - Properties

    /// Icon size is 24pt
    static let iconSize: CGFloat = 24
    /// Presentation animation duration is 0.4s
    static let presentationDuration: CGFloat = 0.4

    /// Button size is medium
    @available(*, deprecated, message: "This model is no longer used and will be removed in a future version.")
    static let buttonSize: ButtonSize = .medium
    /// Button shape is rounded
    @available(*, deprecated, message: "This model is no longer used and will be removed in a future version.")
    static let buttonShape: ButtonShape = .rounded
}
