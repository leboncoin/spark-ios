//
//  NumberFormatter+SharedExtensionTests.swift
//  SparkComponentRatingTests
//
//  Created by robin.lemaire on 15/01/2026.
//  Copyright © 2026 Leboncoin. All rights reserved.
//

import Foundation
import Testing
@testable import SparkComponentRating

@Suite("Number Formatter Shared Extension Tests")
struct NumberFormatterSharedExtensionTests {

    // MARK: - Properties

    var formatter: NumberFormatter!

    // MARK: - Setup

    init() {

        self.formatter = NumberFormatter.shared
    }

    // MARK: - Tests

    @Test("Shared formatter configuration")
    func sharedFormatterConfiguration() {
        // GIVEN / WHEN
        let formatter = NumberFormatter.shared

        // THEN
        #expect(formatter.minimumFractionDigits == 0)
        #expect(formatter.maximumFractionDigits == 2)
    }

    @Test("Shared formatter is singleton")
    func sharedFormatterIsSingleton() {
        // GIVEN / WHEN
        let formatter1 = NumberFormatter.shared
        let formatter2 = NumberFormatter.shared

        // THEN
        #expect(formatter1 === formatter2)
    }
}
