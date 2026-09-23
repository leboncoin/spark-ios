//
//  InputOTPGetIsSeparatorUseCaseTests.swift
//  SparkComponentInputOTPTests
//
//  Created by robin.lemaire on 04/06/2026.
//  Copyright © 2026 Leboncoin. All rights reserved.
//

@testable import SparkComponentInputOTP
import Testing

@Suite("Input OTP Get Is Separator Use Case Tests")
struct InputOTPGetIsSeparatorUseCaseTests {

    // MARK: - Properties

    let sut: InputOTPGetIsSeparatorUseCase

    // MARK: - Initialization

    init() {
        self.sut = InputOTPGetIsSeparatorUseCase()
    }

    // MARK: - Tests

    @Test("Digits four returns false")
    func digitsFourReturnsFalse() throws {
        // GIVEN / WHEN
        let isSeparator = self.sut.execute(digits: .four)

        // THEN
        #expect(isSeparator == false)
    }

    @Test("Digits six returns true")
    func digitsSixReturnsTrue() throws {
        // GIVEN / WHEN
        let isSeparator = self.sut.execute(digits: .six)

        // THEN
        #expect(isSeparator == true)
    }

    @Test("Digits eight returns true")
    func digitsEightReturnsTrue() throws {
        // GIVEN / WHEN
        let isSeparator = self.sut.execute(digits: .eight)

        // THEN
        #expect(isSeparator == true)
    }
}
