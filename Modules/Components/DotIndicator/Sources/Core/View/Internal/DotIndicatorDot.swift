//
//  DotIndicatorDot.swift
//  SparkComponentDotIndicator
//
//  Created by Robin Lemaire on 24/11/2026.
//  Copyright © 2026 Leboncoin. All rights reserved.
//

import SwiftUI

/// A dot of the dot indicator (active or inactive).
struct DotIndicatorDot: View {

    // MARK: - Properties

    let isActive: Bool

    // MARK: - View

    var body: some View {
        Rectangle()
            .dotIndicatorDot(isActive: self.isActive)
    }
}
