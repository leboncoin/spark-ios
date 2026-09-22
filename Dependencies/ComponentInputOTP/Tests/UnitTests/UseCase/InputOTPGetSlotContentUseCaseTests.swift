//
//  InputOTPGetSlotContentUseCaseTests.swift
//  SparkComponentInputOTPTests
//
//  Created by robin.lemaire on 04/06/2026.
//  Copyright © 2026 Leboncoin. All rights reserved.
//

@testable import SparkComponentInputOTP
import Testing

@Suite("Input OTP Get Slot Content Use Case Tests")
struct InputOTPGetSlotContentUseCaseTests {

    // MARK: - Properties

    let sut: InputOTPGetSlotContentUseCase

    // MARK: - Initialization

    init() {
        self.sut = InputOTPGetSlotContentUseCase()
    }

    // MARK: - Tests

    @Test("Value with content returns value")
    func valueWithContentReturnsValue() throws {
        // GIVEN / WHEN
        let content = self.sut.execute(
            value: "5",
            isFocus: false
        )

        // THEN
        #expect(content == "5")
    }

    @Test("Empty value with focus returns focus constant")
    func emptyValueWithFocusReturnsFocusConstant() throws {
        // GIVEN / WHEN
        let content = self.sut.execute(
            value: nil,
            isFocus: true
        )

        // THEN
        #expect(content == InputOTPConstants.Content.focus)
    }

    @Test("Empty value without focus returns empty constant")
    func emptyValueWithoutFocusReturnsEmptyConstant() throws {
        // GIVEN / WHEN
        let content = self.sut.execute(
            value: nil,
            isFocus: false
        )

        // THEN
        #expect(content == InputOTPConstants.Content.empty)
    }

    @Test("Empty string with focus returns focus constant")
    func emptyStringWithFocusReturnsFocusConstant() throws {
        // GIVEN / WHEN
        let content = self.sut.execute(
            value: "",
            isFocus: true
        )

        // THEN
        #expect(content == InputOTPConstants.Content.focus)
    }
}
