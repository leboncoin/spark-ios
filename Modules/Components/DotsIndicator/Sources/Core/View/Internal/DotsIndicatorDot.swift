//
//  DotsIndicatorDot.swift
//  SparkComponentDotsIndicator
//
//  Created by Robin Lemaire on 24/11/2026.
//  Copyright © 2026 Leboncoin. All rights reserved.
//

import SwiftUI

/// A dot of the dots indicator (active or inactive).
struct DotsIndicatorDot: View {

    // MARK: - Properties

    let isActive: Bool

    // MARK: - View

    var body: some View {
        Rectangle()
            .dotsIndicatorDot(isActive: self.isActive)
    }
}
