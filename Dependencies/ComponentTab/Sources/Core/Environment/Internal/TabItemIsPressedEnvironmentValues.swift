//
//  TabItemIsPressedEnvironmentValues.swift
//  SparkComponentTab
//
//  Created by robin.lemaire on 23/02/2026.
//  Copyright © 2026 Leboncoin. All rights reserved.
//

import SwiftUI

extension EnvironmentValues {
    @Entry var tabItemIsPressed: Bool = false
}

extension View {

    func tabItemIsPressed(_ value: Bool) -> some View {
        self.environment(\.tabItemIsPressed, value)
    }
}
