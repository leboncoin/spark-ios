//
//  FormFieldConstantsTests.swift
//  SparkComponentFormField
//
//  Created by robin.lemaire on 07/05/2025.
//  Copyright © 2025 Leboncoin. All rights reserved.
//

import Foundation
import Testing
@testable import SparkComponentFormField

@Suite("FormField Constants Tests")
struct FormFieldConstantsTests {

    // MARK: - Tests

    @Test("Icon size")
    func iconSize() {
        // GIVEN / WHEN / THEN
        #expect(
            FormFieldConstants.iconSize == 18
        )
    }

    @Test("Default title")
    func defaultTitle() {
        // GIVEN / WHEN / THEN
        #expect(
            FormFieldConstants.defaultTitle == String(localized: "clear", bundle: .current)
        )
    }
}
