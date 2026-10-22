//
//  SparkConfigurationTrait.swift
//  SparkCoreSnapshotTests
//
//  Created by robin.lemaire on 21/10/2026.
//  Copyright © 2026 Leboncoin. All rights reserved.
//

import Testing
import SparkTheme

/// Load the *SparkConfiguration* before running the suite or the test.
/// Usage: `@Suite(.sparkConfiguration)`.
@_spi(SI_SPI) public struct SparkConfigurationTrait: SuiteTrait, TestTrait, TestScoping {

    // MARK: - Properties

    /// The trait is applied to all the tests of the suite.
    public let isRecursive = true

    // MARK: - Methods

    /// Load the *SparkConfiguration* on the main actor, then run the test.
    public func provideScope(
        for test: Test,
        testCase: Test.Case?,
        performing function: @Sendable () async throws -> Void
    ) async throws {
        await MainActor.run {
            SparkConfiguration.load()
        }
        try await function()
    }
}

// MARK: - Trait

@_spi(SI_SPI) public extension Trait where Self == SparkConfigurationTrait {

    /// Load the *SparkConfiguration* before running the suite or the test.
    static var sparkConfiguration: Self {
        Self()
    }
}
