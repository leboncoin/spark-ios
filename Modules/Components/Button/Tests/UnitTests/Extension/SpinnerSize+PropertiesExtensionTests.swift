//
//  SpinnerSize+PropertiesExtensionTests.swift
//  SparkComponentButtonTests
//
//  Created by robin.lemaire on 13/03/2026.
//  Copyright © 2026 Leboncoin. All rights reserved.
//

@testable import SparkComponentButton
import SparkComponentSpinner
import Testing

@Suite("Spinner Size Properties Extension Tests")
struct SpinnerSizePropertiesExtensionTests {

    // MARK: - Tests

    @Test("OnButton returns small")
    func onButtonReturnsSmall() {
        // GIVEN / WHEN
        let size = SpinnerSize.onButton

        // THEN
        #expect(size == .small)
    }

    @Test("OnButton is static property")
    func onButtonIsStaticProperty() {
        // GIVEN / WHEN
        // Access via type, not instance
        let size = SpinnerSize.onButton

        // THEN
        #expect(size == .small)
    }
}
