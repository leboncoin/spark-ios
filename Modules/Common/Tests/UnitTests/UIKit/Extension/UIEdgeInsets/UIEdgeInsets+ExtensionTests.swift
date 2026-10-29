//
//  UIEdgeInsets+ExtensionTests.swift
//  SparkCore
//
//  Created by robin.lemaire on 06/04/2023.
//  Copyright © 2023 Leboncoin. All rights reserved.
//

import Testing
import UIKit
@_spi(SI_SPI) @testable import SparkCommon

@MainActor
@Suite("UI Edge Insets Extension Tests")
struct UIEdgeInsetsExtensionTests {

    // MARK: - Tests

    @Test("Init all")
    func initAll() {
        // GIVEN/WHEN
        let edgetInsets = UIEdgeInsets(all: 99)

        // THEN
        #expect(edgetInsets.top == 99, "Wrong top value")
        #expect(edgetInsets.left == 99, "Wrong left value")
        #expect(edgetInsets.bottom == 99, "Wrong bottom value")
        #expect(edgetInsets.right == 99, "Wrong right value")
    }

    @Test("Init vertical and horizontal")
    func initVerticalAndHorizontal() {
        // GIVEN/WHEN
        let edgetInsets = UIEdgeInsets(vertical: 13, horizontal: 44)

        // THEN
        #expect(edgetInsets.top == 13, "Wrong top value")
        #expect(edgetInsets.left == 44, "Wrong left value")
        #expect(edgetInsets.bottom == 13, "Wrong bottom value")
        #expect(edgetInsets.right == 44, "Wrong right value")
    }
}
