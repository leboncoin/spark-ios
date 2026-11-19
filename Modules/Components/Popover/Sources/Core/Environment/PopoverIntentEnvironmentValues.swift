//
//  PopoverIntentEnvironmentValues.swift
//  SparkComponentPopover
//
//  Created by Robin Lemaire on 18/11/2026.
//  Copyright © 2026 Leboncoin. All rights reserved.
//

import SwiftUI

extension EnvironmentValues {
    @Entry var popoverIntent: PopoverIntent = .default
}

public extension View {

    /// Set the **intent** on the Popover.
    ///
    /// The default value for this property is *PopoverIntent.default*.
    func sparkPopoverIntent(_ intent: PopoverIntent) -> some View {
        self.environment(\.popoverIntent, intent)
    }
}
