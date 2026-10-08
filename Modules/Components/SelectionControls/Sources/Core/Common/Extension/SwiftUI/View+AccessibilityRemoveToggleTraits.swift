//
//  View+AccessibilityRemoveToggleTraits.swift
//  SparkComponentSelectionControls
//
//  Created by robin.lemaire on 27/05/2026.
//  Copyright © 2026 Leboncoin. All rights reserved.
//

import SwiftUI

extension View {

    @ViewBuilder
    func accessibilityRemoveToggleTraits() -> some View {
        self.accessibilityRemoveTraits(.isToggle)
    }
}
