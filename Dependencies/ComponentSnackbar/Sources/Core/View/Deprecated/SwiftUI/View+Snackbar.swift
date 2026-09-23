//
//  View+Snackbar.swift
//  SparkComponentSnackbar
//
//  Created by louis.borlee on 08/11/2024.
//  Copyright © 2024 Leboncoin. All rights reserved.
//

import SwiftUI

public extension View {
    /// Presents a Spark snackbar when a given condition is true.
    /// - Parameters:
    ///   - isPresented: A binding to a Boolean value that determines whether
    ///     to present the snackbar.
    ///   - direction: The direction from which to show the snackbar.
    ///   - autoDismissDelay: The delay after which the snackbar will be dismissed automatically. Default is ``.fast``.
    ///   - dismissCompletion: The completion to run after dismiss. Default is ``nil``.
    ///   - snackbar: The snackbar to show.
    @available(*, deprecated, message: "Replaced by sparkSnackbar")
    func snackbar<Snackbar: View>(
        isPresented: Binding<Bool>,
        direction: SnackbarPresentationDirection,
        autoDismissDelay: SnackbarAutoDismissDelay? = .fast,
        dismissCompletion: (() -> Void)? = nil,
        snackbar: @escaping () -> Snackbar
    ) -> some View {
        modifier(
            SnackbarViewModifierDeprecated(
                isPresented: isPresented,
                direction: direction,
                autoDismissDelay: autoDismissDelay,
                dismissCompletion: dismissCompletion,
                snackbar: snackbar
            )
        )
    }
}
