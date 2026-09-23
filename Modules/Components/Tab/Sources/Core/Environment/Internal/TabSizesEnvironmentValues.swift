//
//  TabSizesEnvironmentValues.swift
//  SparkComponentTab
//
//  Created by robin.lemaire on 23/02/2026.
//  Copyright © 2026 Leboncoin. All rights reserved.
//

import SwiftUI

extension EnvironmentValues {
    @Entry var tabSizes = TabSizes()
}

extension View {

    func tabSizes(_ value: TabSizes) -> some View {
        self.environment(\.tabSizes, value)
    }
}
