//
//  DotIndicatorSize+InteractionExtensionTests.swift
//  SparkComponentDotIndicatorTests
//
//  Created by Robin Lemaire on 24/11/2026.
//  Copyright © 2026 Leboncoin. All rights reserved.
//

import Testing
@testable import SparkComponentDotIndicator

// MARK: - Tests

struct DotIndicatorSizeInteractionExtensionTests {

    @Test("Has tap interaction should return true only for large", arguments: DotIndicatorSize.allCases)
    func hasTapInteractionShouldReturnTrueOnlyForLarge(size: DotIndicatorSize) {
        #expect(size.hasTapInteraction == (size == .large))
    }
}
