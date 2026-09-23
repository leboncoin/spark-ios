//
//  InputOTPGetShowSeparatorUseCaseTests.swift
//  SparkComponentInputOTPTests
//
//  Created by robin.lemaire on 05/06/2026.
//  Copyright © 2026 Leboncoin. All rights reserved.
//

@testable import SparkComponentInputOTP
import Testing

@Suite("Input OTP Get Show Separator Use Case Tests")
struct InputOTPGetShowSeparatorUseCaseTests {

    // MARK: - Properties

    let sut: InputOTPGetShowSeparatorUseCase

    // MARK: - Initialization

    init() {
        self.sut = InputOTPGetShowSeparatorUseCase()
    }

    // MARK: - Tests

    @Test("Returns false when isSeparator is false")
    func returnsFalseWhenIsSeparatorIsFalse() throws {
        // GIVEN / WHEN
        let showSeparator = self.sut.execute(
            isSeparator: false,
            index: 3,
            digits: .six
        )

        // THEN
        #expect(showSeparator == false)
    }

    @Test("Returns false when index is not at half digits")
    func returnsFalseWhenIndexIsNotAtHalfDigits() throws {
        // GIVEN / WHEN
        let showSeparator = self.sut.execute(
            isSeparator: true,
            index: 2,
            digits: .six
        )

        // THEN
        #expect(showSeparator == false)
    }

    @Test("Returns true when isSeparator is true and index is at half of four digits")
    func returnsTrueWhenIsSeparatorIsTrueAndIndexIsAtHalfOfFourDigits() throws {
        // GIVEN / WHEN
        let showSeparator = self.sut.execute(
            isSeparator: true,
            index: 2,
            digits: .four
        )

        // THEN
        #expect(showSeparator == true)
    }

    @Test("Returns true when isSeparator is true and index is at half of six digits")
    func returnsTrueWhenIsSeparatorIsTrueAndIndexIsAtHalfOfSixDigits() throws {
        // GIVEN / WHEN
        let showSeparator = self.sut.execute(
            isSeparator: true,
            index: 3,
            digits: .six
        )

        // THEN
        #expect(showSeparator == true)
    }

    @Test("Returns true when isSeparator is true and index is at half of eight digits")
    func returnsTrueWhenIsSeparatorIsTrueAndIndexIsAtHalfOfEightDigits() throws {
        // GIVEN / WHEN
        let showSeparator = self.sut.execute(
            isSeparator: true,
            index: 4,
            digits: .eight
        )

        // THEN
        #expect(showSeparator == true)
    }

    @Test("Returns false when index is 0")
    func returnsFalseWhenIndexIsZero() throws {
        // GIVEN / WHEN
        let showSeparator = self.sut.execute(
            isSeparator: true,
            index: 0,
            digits: .six
        )

        // THEN
        #expect(showSeparator == false)
    }

    @Test("Returns false when index is last digit")
    func returnsFalseWhenIndexIsLastDigit() throws {
        // GIVEN / WHEN
        let showSeparator = self.sut.execute(
            isSeparator: true,
            index: 5,
            digits: .six
        )

        // THEN
        #expect(showSeparator == false)
    }
}
