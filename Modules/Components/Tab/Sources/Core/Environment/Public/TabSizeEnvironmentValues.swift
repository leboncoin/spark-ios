//
//  TabSizeEnvironmentValues.swift
//  SparkComponentTab
//
//  Created by robin.lemaire on 23/02/2026.
//  Copyright © 2026 Leboncoin. All rights reserved.
//

import SwiftUI

extension EnvironmentValues {
    @Entry var tabSize: TabSize = .default
}

public extension View {

    /// Set the **size** on the Tab.
    ///
    /// The default value for this property is *TabSize.default*.
    func sparkTabSize(_ size: TabSize) -> some View {
        self.environment(\.tabSize, size)
    }
}
