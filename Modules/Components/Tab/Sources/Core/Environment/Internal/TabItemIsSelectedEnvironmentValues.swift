//
//  TabItemIsSelectedEnvironmentValues.swift
//  SparkComponentTab
//
//  Created by robin.lemaire on 23/02/2026.
//  Copyright © 2026 Leboncoin. All rights reserved.
//

import SwiftUI

extension EnvironmentValues {
    @Entry var tabItemIsSelected: Bool = false
}

extension View {

    func tabItemIsSelected(_ value: Bool) -> some View {
        self.environment(\.tabItemIsSelected, value)
    }
}
