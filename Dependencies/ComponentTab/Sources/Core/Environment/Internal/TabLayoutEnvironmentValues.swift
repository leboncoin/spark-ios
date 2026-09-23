//
//  TabLayoutEnvironmentValues.swift
//  SparkComponentTab
//
//  Created by robin.lemaire on 23/02/2026.
//  Copyright © 2026 Leboncoin. All rights reserved.
//

import SwiftUI

extension EnvironmentValues {
    @Entry var tabLayout = TabLayout()
}

extension View {

    func tabLayout(_ value: TabLayout) -> some View {
        self.environment(\.tabLayout, value)
    }
}
