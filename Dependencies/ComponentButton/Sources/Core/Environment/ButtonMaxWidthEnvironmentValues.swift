//
//  ButtonMaxWidthEnvironmentValues.swift
//  SparkComponentButton
//
//  Created by robin.lemaire on 13/03/2026.
//  Copyright © 2026 Leboncoin. All rights reserved.
//

import SwiftUI

extension EnvironmentValues {
    @Entry var buttonMaxWidth: CGFloat?
}

public extension View {

    /// Set the **max width** frame on the Button.
    /// If **nil**, the button will size to its content.
    ///
    /// The default value for this property is *nil*.
    func sparkButtonMaxWidth(_ maxWidth: CGFloat? = nil) -> some View {
        self.environment(\.buttonMaxWidth, maxWidth)
    }
}
