//
//  RadioButtonUIItemTests.swift
//  SparkComponentRadioButtonTests
//
//  Created by michael.zimmermann on 31.08.23.
//  Copyright © 2023 Leboncoin. All rights reserved.
//

@testable import SparkComponentRadioButton
import Foundation
import Testing

@Suite("Radio Button UI Item Tests")
struct RadioButtonUIItemTests {

    // MARK: - Tests
    @Test("Equal")
    func equal() {
        let sut = RadioButtonUIItem(id: 1, label: "Label")

        #expect(sut == RadioButtonUIItem(id: 1, label: "Label"))
    }

    @Test("Equal attributed")
    func equalAttributed() {
        let sut = RadioButtonUIItem(id: 1, label: NSAttributedString(string: "Label"))

        #expect(sut == RadioButtonUIItem(id: 1, label: "Label"))
    }

    @Test("Not equal different ids")
    func notEqualDifferentIds() {
        let sut = RadioButtonUIItem(id: 1, label: "Label")

        #expect(sut != RadioButtonUIItem(id: 2, label: "Label"))
    }

    @Test("Not equal different labels")
    func notEqualDifferentLabels() {
        let sut = RadioButtonUIItem(id: 1, label: "Label")

        #expect(sut != RadioButtonUIItem(id: 2, label: ""))
    }
}
