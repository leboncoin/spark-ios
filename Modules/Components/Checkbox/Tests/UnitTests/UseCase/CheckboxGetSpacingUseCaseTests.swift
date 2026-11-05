//
//  CheckboxGetSpacingUseCaseTests.swift
//  SparkComponentCheckboxUnitTests
//
//  Created by Michael Zimmermann on 17.11.23.
//  Copyright © 2023 Leboncoin. All rights reserved.
//

import Testing
@testable import SparkComponentCheckbox
@_spi(SI_SPI) import SparkThemingTesting

@Suite("Checkbox Get Spacing UseCase Tests")
struct CheckboxGetSpacingUseCaseTests {

    var sut: CheckboxGetSpacingUseCase!
    var layoutSpacing: LayoutSpacingGeneratedMock!

    init() {
        self.layoutSpacing = LayoutSpacingGeneratedMock.mocked()
        self.sut = CheckboxGetSpacingUseCase()
    }

    @Test("Left alignment spacing")
    func leftAlignmentSpacing() {
        let spacing = sut.execute(layoutSpacing: self.layoutSpacing, alignment: .left)

        #expect(spacing == self.layoutSpacing.medium)
    }

    @Test("Right alignment spacing")
    func rightAlignmentSpacing() {
        let spacing = sut.execute(layoutSpacing: self.layoutSpacing, alignment: .right)

        #expect(spacing == self.layoutSpacing.xxxLarge)
    }
}
