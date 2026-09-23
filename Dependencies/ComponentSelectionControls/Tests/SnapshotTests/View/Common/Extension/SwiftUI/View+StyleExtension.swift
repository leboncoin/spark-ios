//
//  View+StyleExtension.swift
//  SparkComponentSelectionControls
//
//  Created by robin.lemaire on 12/09/2025.
//  Copyright © 2025 Leboncoin. All rights reserved.
//

import SwiftUI

extension View {

    @ViewBuilder
    func style(forDocumentation: Bool, useLargePadding: Bool = false) -> some View {
        if forDocumentation {
            self.padding(useLargePadding ? CommonSnapshotConstants.largePadding : 4)
                .background(.background)
                .fixedSize()
        } else {
            self.background(Color(uiColor: .secondarySystemBackground))
                .padding(useLargePadding ? CommonSnapshotConstants.largePadding : CommonSnapshotConstants.padding)
                .fixedSize()
                .background(.background)
        }
    }
}
