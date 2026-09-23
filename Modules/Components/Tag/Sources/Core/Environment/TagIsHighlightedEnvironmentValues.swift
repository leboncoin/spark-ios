//
//  TagIsHighlightedEnvironmentValues.swift
//  SparkComponentSelectionControls
//
//  Created by robin.lemaire on 05/08/2025.
//  Copyright © 2025 Leboncoin. All rights reserved.
//

import SwiftUI

extension EnvironmentValues {
    @Entry var tagIsHighlighted: Bool = false
}

public extension View {

    /// Set the **isHighlighted** on the ``SparkTag``.
    ///
    /// The default value for this property is *false*.
    ///
    /// If the value is *true*, a custom corner radius will be applied.
    ///
    /// ![Tag rendering with when us highlighted is true.](tag_with_is_highlighted.png)
    func sparkTagIsHighlighted(_ isHighlighted: Bool) -> some View {
        self.environment(\.tagIsHighlighted, isHighlighted)
    }
}
