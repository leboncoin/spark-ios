//
//  CommonStyleContextEnvironmentValues.swift
//  SparkComponentSelectionControls
//
//  Created by robin.lemaire on 23/07/2025.
//  Copyright © 2025 Leboncoin. All rights reserved.
//

import SwiftUI

extension EnvironmentValues {
    @Entry var selectionControlsStyleContext: CommonStyleContext = .default
}

extension View {

    func selectionControlsStyleContext(_ styleContext: CommonStyleContext) -> some View {
        self.environment(\.selectionControlsStyleContext, styleContext)
    }
}
