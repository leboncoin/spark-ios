//
//  TabItemTypeEnvironmentValues.swift
//  SparkComponentTab
//
//  Created by robin.lemaire on 23/02/2026.
//  Copyright © 2026 Leboncoin. All rights reserved.
//

import SwiftUI

extension EnvironmentValues {
    @Entry var tabContext: TabContext = .collecting
}

extension View {

    func tabContext(_ value: TabContext) -> some View {
        self.environment(\.tabContext, value)
    }
}
