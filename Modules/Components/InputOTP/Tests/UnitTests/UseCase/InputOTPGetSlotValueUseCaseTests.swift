//
//  InputOTPGetSlotValueUseCaseTests.swift
//  SparkComponentInputOTPTests
//
//  Created by robin.lemaire on 05/06/2026.
//  Copyright © 2026 Leboncoin. All rights reserved.
//

@testable import SparkComponentInputOTP
import Testing

@Suite("Input OTP Get Slot Value Use Case Tests")
struct InputOTPGetSlotValueUseCaseTests {

    // MARK: - Properties

    let sut: InputOTPGetSlotValueUseCase

    // MARK: - Initialization

    init() {
        self.sut = InputOTPGetSlotValueUseCase()
    }

    // MARK: - Tests

    @Test("Returns nil when index is greater than value count")
    func returnsNilWhenIndexIsGreaterThanValueCount() throws {
        // GIVEN
        let givenValue = "123456"
        let givenIndex = 6

        // WHEN
        let slotValue = self.sut.execute(
            value: givenValue,
            index: givenIndex
        )

        // THEN
        #expect(slotValue == nil)
    }

    @Test("Returns nil when index is equal to value count")
    func returnsNilWhenIndexIsEqualToValueCount() throws {
        // GIVEN
        let givenValue = "123456"
        let givenIndex = 6

        // WHEN
        let slotValue = self.sut.execute(
            value: givenValue,
            index: givenIndex
        )

        // THEN
        #expect(slotValue == nil)
    }

    @Test("Returns nil when value is empty")
    func returnsNilWhenValueIsEmpty() throws {
        // GIVEN
        let givenValue = ""
        let givenIndex = 0

        // WHEN
        let slotValue = self.sut.execute(
            value: givenValue,
            index: givenIndex
        )

        // THEN
        #expect(slotValue == nil)
    }

    @Test("Returns first character when index is zero")
    func returnsFirstCharacterWhenIndexIsZero() throws {
        // GIVEN
        let givenValue = "123456"
        let givenIndex = 0

        // WHEN
        let slotValue = self.sut.execute(
            value: givenValue,
            index: givenIndex
        )

        // THEN
        #expect(slotValue == "1")
    }

    @Test("Returns character at middle index")
    func returnsCharacterAtMiddleIndex() throws {
        // GIVEN
        let givenValue = "123456"
        let givenIndex = 3

        // WHEN
        let slotValue = self.sut.execute(
            value: givenValue,
            index: givenIndex
        )

        // THEN
        #expect(slotValue == "4")
    }

    @Test("Returns last character when index is value count minus one")
    func returnsLastCharacterWhenIndexIsValueCountMinusOne() throws {
        // GIVEN
        let givenValue = "123456"
        let givenIndex = 5

        // WHEN
        let slotValue = self.sut.execute(
            value: givenValue,
            index: givenIndex
        )

        // THEN
        #expect(slotValue == "6")
    }

    @Test("Returns character for single character value")
    func returnsCharacterForSingleCharacterValue() throws {
        // GIVEN
        let givenValue = "A"
        let givenIndex = 0

        // WHEN
        let slotValue = self.sut.execute(
            value: givenValue,
            index: givenIndex
        )

        // THEN
        #expect(slotValue == "A")
    }

    @Test("Returns correct character with alphanumeric value")
    func returnsCorrectCharacterWithAlphanumericValue() throws {
        // GIVEN
        let givenValue = "A1B2C3"
        let givenIndex = 2

        // WHEN
        let slotValue = self.sut.execute(
            value: givenValue,
            index: givenIndex
        )

        // THEN
        #expect(slotValue == "B")
    }
}
