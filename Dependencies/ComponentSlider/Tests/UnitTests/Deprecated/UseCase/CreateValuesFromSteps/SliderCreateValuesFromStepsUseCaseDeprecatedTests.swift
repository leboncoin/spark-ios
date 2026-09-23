//
//  SliderCreateValuesFromStepsUseCaseTests.swift
//  SparkComponentSliderUnitTests
//
//  Created by louis.borlee on 23/11/2023.
//  Copyright © 2023 Leboncoin. All rights reserved.
//

import XCTest
@testable import SparkComponentSlider

final class SliderCreateValuesFromStepsUseCaseDeprecatedTests: XCTestCase {

    private let sut = SliderCreateValuesFromStepsUseCaseDeprecated()

    func test_execute_throws_invalid_range() {
        XCTAssertThrowsError(try self.sut.execute(from: 800, to: 200, steps: 4), "Execute should throw") { error in
            XCTAssertEqual(
                error as? SliderCreateValuesFromStepsUseCasableDeprecatedError,
                SliderCreateValuesFromStepsUseCasableDeprecatedError.invalidRange,
                "Error should be \(SliderCreateValuesFromStepsUseCasableDeprecatedError.invalidRange) but is \(error)"
            )
        }
    }

    func test_execute_throws_invalid_step_less_than_zero() {
        XCTAssertThrowsError(try self.sut.execute(from: 200, to: 800, steps: -1), "Execute should throw") { error in
            XCTAssertEqual(
                error as? SliderCreateValuesFromStepsUseCasableDeprecatedError,
                SliderCreateValuesFromStepsUseCasableDeprecatedError.invalidStep,
                "Error should be \(SliderCreateValuesFromStepsUseCasableDeprecatedError.invalidStep) but is \(error)"
            )
        }

    }

    func test_execute_throws_invalid_step_zero() {
        XCTAssertThrowsError(try self.sut.execute(from: 200, to: 800, steps: .zero), "Execute should throw") { error in
            XCTAssertEqual(
                error as? SliderCreateValuesFromStepsUseCasableDeprecatedError,
                SliderCreateValuesFromStepsUseCasableDeprecatedError.invalidStep,
                "Error should be \(SliderCreateValuesFromStepsUseCasableDeprecatedError.invalidStep) but is \(error)"
            )
        }

    }

    func test_execute_throws_invalid_step_greater_than_to_minus_from() {
        XCTAssertThrowsError(try self.sut.execute(from: 200, to: 800, steps: 800), "Execute should throw") { error in
            XCTAssertEqual(
                error as? SliderCreateValuesFromStepsUseCasableDeprecatedError,
                SliderCreateValuesFromStepsUseCasableDeprecatedError.invalidStep,
                "Error should be \(SliderCreateValuesFromStepsUseCasableDeprecatedError.invalidStep) but is \(error)"
            )
        }
    }

    func test_execute_adding_last_value() throws {
        let values = try XCTUnwrap(self.sut.execute(from: 0, to: 1, steps: 0.7),
                                   "Couldn't unwrap values")
        XCTAssertEqual(values, [0, 0.7, 1])
    }

    func test_execute() throws {
        let values = try XCTUnwrap(self.sut.execute(from: 50_000, to: 200_000, steps: 50_000),
                                   "Couldn't unwrap values")
        XCTAssertEqual(values, [
            50_000,
            100_000,
            150_000,
            200_000
        ])
    }
}
