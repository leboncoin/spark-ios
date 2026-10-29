//
//  EdgeInsets+ExtensionTests.swift
//  SparkCoreTests
//
//  Created by robin.lemaire on 06/04/2023.
//  Copyright © 2023 Leboncoin. All rights reserved.
//

import Testing
import SwiftUI
@_spi(SI_SPI) @testable import SparkCommon

@MainActor
@Suite("Edge Insets Extensions Tests")
struct EdgeInsetsExtensionsTests {

    // MARK: - Tests

    @Test("Init all")
    func initAll() {
        // GIVEN/WHEN
        let edgetInsets = EdgeInsets(all: 99)

        // THEN
        #expect(edgetInsets.top == 99, "Wrong top value")
        #expect(edgetInsets.leading == 99, "Wrong leading value")
        #expect(edgetInsets.bottom == 99, "Wrong bottom value")
        #expect(edgetInsets.trailing == 99, "Wrong trailing value")
    }

    @Test("Init vertical and horizontal")
    func initVerticalAndHorizontal() {
        // GIVEN/WHEN
        let edgetInsets = EdgeInsets(vertical: 13, horizontal: 44)

        // THEN
        #expect(edgetInsets.top == 13, "Wrong top value")
        #expect(edgetInsets.leading == 44, "Wrong leading value")
        #expect(edgetInsets.bottom == 13, "Wrong bottom value")
        #expect(edgetInsets.trailing == 44, "Wrong trailing value")
    }
}
