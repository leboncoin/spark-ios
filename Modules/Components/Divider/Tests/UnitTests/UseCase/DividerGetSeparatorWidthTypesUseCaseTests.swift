//
//  DividerGetSeparatorWidthTypesUseCaseTests.swift
//  SparkComponentDividerTests
//
//  Created by robin.lemaire on 18/11/2025.
//  Copyright © 2025 Leboncoin. All rights reserved.
//

import Testing

@testable import SparkComponentDivider

@Suite("Divider Get Separator Width Types UseCase Tests")
struct DividerGetSeparatorWidthTypesUseCaseTests {

    // MARK: - Properties

    private let useCase: DividerGetSeparatorWidthTypesUseCase

    // MARK: - Setup

    init() {
        self.useCase = DividerGetSeparatorWidthTypesUseCase()
    }

    // MARK: - Execute Tests - Vertical Axis

    @Test("Execute vertical top")
    func executeVerticalTop() {
        // GIVEN
        let alignment: DividerAlignment = .top
        let axis: DividerAxis = .vertical

        // WHEN
        let result = self.useCase.execute(alignment: alignment, axis: axis)

        // THEN
        #expect(
            result.first == .fixed,
            "First separator should be fixed for vertical axis with top alignment"
        )
        #expect(
            result.last == .dynamic,
            "Last separator should be dynamic for vertical axis with top alignment"
        )
    }

    @Test("Execute vertical bottom")
    func executeVerticalBottom() {
        // GIVEN
        let alignment: DividerAlignment = .bottom
        let axis: DividerAxis = .vertical

        // WHEN
        let result = self.useCase.execute(alignment: alignment, axis: axis)

        // THEN
        #expect(
            result.first == .dynamic,
            "First separator should be dynamic for vertical axis with bottom alignment"
        )
        #expect(
            result.last == .fixed,
            "Last separator should be fixed for vertical axis with bottom alignment"
        )
    }

    @Test("Execute vertical center")
    func executeVerticalCenter() {
        // GIVEN
        let alignment: DividerAlignment = .center
        let axis: DividerAxis = .vertical

        // WHEN
        let result = self.useCase.execute(alignment: alignment, axis: axis)

        // THEN
        #expect(
            result.first == .equal,
            "First separator should be equal for vertical axis with center alignment"
        )
        #expect(
            result.last == .equal,
            "Last separator should be equal for vertical axis with center alignment"
        )
    }

    @Test("Execute vertical leading")
    func executeVerticalLeading() {
        // GIVEN
        let alignment: DividerAlignment = .leading
        let axis: DividerAxis = .vertical

        // WHEN
        let result = self.useCase.execute(alignment: alignment, axis: axis)

        // THEN
        #expect(
            result.first == .equal,
            "First separator should be equal for vertical axis with leading alignment"
        )
        #expect(
            result.last == .equal,
            "Last separator should be equal for vertical axis with leading alignment"
        )
    }

    @Test("Execute vertical trailing")
    func executeVerticalTrailing() {
        // GIVEN
        let alignment: DividerAlignment = .trailing
        let axis: DividerAxis = .vertical

        // WHEN
        let result = self.useCase.execute(alignment: alignment, axis: axis)

        // THEN
        #expect(
            result.first == .equal,
            "First separator should be equal for vertical axis with trailing alignment"
        )
        #expect(
            result.last == .equal,
            "Last separator should be equal for vertical axis with trailing alignment"
        )
    }

    // MARK: - Execute Tests - Horizontal Axis

    @Test("Execute horizontal leading")
    func executeHorizontalLeading() {
        // GIVEN
        let alignment: DividerAlignment = .leading
        let axis: DividerAxis = .horizontal

        // WHEN
        let result = self.useCase.execute(alignment: alignment, axis: axis)

        // THEN
        #expect(
            result.first == .fixed,
            "First separator should be fixed for horizontal axis with leading alignment"
        )
        #expect(
            result.last == .dynamic,
            "Last separator should be dynamic for horizontal axis with leading alignment"
        )
    }

    @Test("Execute horizontal trailing")
    func executeHorizontalTrailing() {
        // GIVEN
        let alignment: DividerAlignment = .trailing
        let axis: DividerAxis = .horizontal

        // WHEN
        let result = self.useCase.execute(alignment: alignment, axis: axis)

        // THEN
        #expect(
            result.first == .dynamic,
            "First separator should be dynamic for horizontal axis with trailing alignment"
        )
        #expect(
            result.last == .fixed,
            "Last separator should be fixed for horizontal axis with trailing alignment"
        )
    }

    @Test("Execute horizontal center")
    func executeHorizontalCenter() {
        // GIVEN
        let alignment: DividerAlignment = .center
        let axis: DividerAxis = .horizontal

        // WHEN
        let result = self.useCase.execute(alignment: alignment, axis: axis)

        // THEN
        #expect(
            result.first == .equal,
            "First separator should be equal for horizontal axis with center alignment"
        )
        #expect(
            result.last == .equal,
            "Last separator should be equal for horizontal axis with center alignment"
        )
    }

    @Test("Execute horizontal top")
    func executeHorizontalTop() {
        // GIVEN
        let alignment: DividerAlignment = .top
        let axis: DividerAxis = .horizontal

        // WHEN
        let result = self.useCase.execute(alignment: alignment, axis: axis)

        // THEN
        #expect(
            result.first == .equal,
            "First separator should be equal for horizontal axis with top alignment"
        )
        #expect(
            result.last == .equal,
            "Last separator should be equal for horizontal axis with top alignment"
        )
    }

    @Test("Execute horizontal bottom")
    func executeHorizontalBottom() {
        // GIVEN
        let alignment: DividerAlignment = .bottom
        let axis: DividerAxis = .horizontal

        // WHEN
        let result = self.useCase.execute(alignment: alignment, axis: axis)

        // THEN
        #expect(
            result.first == .equal,
            "First separator should be equal for horizontal axis with bottom alignment"
        )
        #expect(
            result.last == .equal,
            "Last separator should be equal for horizontal axis with bottom alignment"
        )
    }
}
