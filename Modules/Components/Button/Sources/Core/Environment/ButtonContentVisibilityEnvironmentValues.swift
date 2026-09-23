//
//  ButtonContentVisibilityEnvironmentValues.swift
//  SparkComponentButton
//
//  Created by robin.lemaire on 13/03/2026.
//  Copyright © 2026 Leboncoin. All rights reserved.
//

import SwiftUI

extension EnvironmentValues {
    @Entry var buttonContentVisibility: ButtonContentVisibility = .default
}

public extension View {

    /// Set the **content visibility** on the Button.
    ///
    /// Must be used only on button with title **and** image.
    ///
    /// The default value for this property is *ButtonContentVisibility.default*.
    ///
    /// You can animate this change in your view :
    /// ```swift
    /// @State var contentVisibility: ButtonContentVisibility = .default
    ///
    /// Button("Visibility") {
    ///     withOptionalAnimation(.easeInOut(duration: 0.3)) {
    ///         self.contentVisibility = .hideLabel
    ///     }
    /// }
    ///
    /// SparkButton("My title") {
    /// }
    /// .sparkButtonContentVisibility(self.contentVisibility)
    /// ```
    func sparkButtonContentVisibility(_ contentVisibility: ButtonContentVisibility) -> some View {
        self.environment(\.buttonContentVisibility, contentVisibility)
    }
}
