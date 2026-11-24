//
//  DotIndicatorSize+InteractionExtension.swift
//  SparkComponentDotIndicator
//
//  Created by Robin Lemaire on 24/11/2026.
//  Copyright © 2026 Leboncoin. All rights reserved.
//

import Foundation

extension DotIndicatorSize {

    // MARK: - Properties

    /// Only the **large** size can have the tap interaction.
    var hasTapInteraction: Bool {
        return self == .large
    }
}
