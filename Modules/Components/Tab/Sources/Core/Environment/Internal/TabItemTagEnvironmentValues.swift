//
//  TabItemTagEnvironmentValues.swift
//  SparkComponentTab
//
//  Created by robin.lemaire on 23/02/2026.
//  Copyright © 2026 Leboncoin. All rights reserved.
//

import SwiftUI

extension EnvironmentValues {
    @Entry var tabItemTag: AnyHashable?
}

extension View {

    func tabItemTag(_ value: AnyHashable?) -> some View {
        self.environment(\.tabItemTag, value)
    }
}
