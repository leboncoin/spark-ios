//
//  EitherTests.swift
//  SparkCoreTests
//
//  Created by michael.zimmermann on 19.06.23.
//  Copyright © 2023 Leboncoin. All rights reserved.
//

import Foundation
@_spi(SI_SPI) @testable import SparkCommon
import Testing

@Suite("Either Tests")
struct EitherTests {

    @Test("Left value")
    func leftValue() {
        let sut: Either<Int, String> = .left(1)
        #expect(sut.leftValue == 1)
    }

    @Test("Right value")
    func rightValue() {
        let sut: Either<Int, String> = .right("A")
        #expect(sut.rightValue == "A")
    }

    @Test("Or value")
    func orValue() {
        let sut: Either<Int, String> = .of(1, or: "Hello")
        #expect(sut == .left(1))
    }

    @Test("Or other value")
    func orOtherValue() {
        let sut: Either<Int, String> = .of(nil, or: "Hello")
        #expect(sut == .right("Hello"))
    }
}
