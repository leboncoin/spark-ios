//
//  SnackbarLayout.swift
//  SparkComponentSnackbar
//
//  Created by robin.lemaire on 12/05/2026.
//  Copyright © 2026 Leboncoin. All rights reserved.
//

import Foundation

struct SnackbarLayout: Equatable {

    // MARK: - Properties

    /// The padding applied to the presentation view
    var presentationPadding: CGFloat = .zero

    /// The padding from the leading edge of the snackbar (left in LTR, right in RTL)
    var leadingPadding: CGFloat = .zero

    /// The padding from the trailing edge of the snackbar (right in LTR, left in RTL)
    var trailingPadding: CGFloat = .zero

    /// The spacing between icon and text content in horizontal layout
    var horizontalSpacing: CGFloat = .zero

    /// The padding from the top and bottom edges of the snackbar
    var verticalPadding: CGFloat = .zero

    /// The spacing between main content and button in vertical layout
    var verticalSpacing: CGFloat = .zero

    /// The spacing between title and description labels
    var verticalSubSpacing: CGFloat = .zero
}
