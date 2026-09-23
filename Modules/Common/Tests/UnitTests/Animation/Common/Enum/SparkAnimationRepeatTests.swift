//
//  SparkAnimationRepeat.swift
//  SparkCommon
//
//  Created by robin.lemaire on 20/11/2024.
//  Copyright © 2024 Leboncoin. All rights reserved.
//

import XCTest
@testable import SparkCommon

class SparkAnimationRepeatTests: XCTestCase {

    func testNoneRepeat() {
        let animation = SparkAnimationRepeat.none
        XCTAssertFalse(
            animation.canContinue(counter: 0),
            "canContinue should be false when there is no repeat and the counter is equals to 0"
        )
        XCTAssertFalse(
            animation.canContinue(counter: 1),
            "canContinue should be false when there is no repeat and the counter is equals to 1"
        )
    }

    func testLimitedRepeat() {
        let animation = SparkAnimationRepeat.limited(3)
        XCTAssertTrue(
            animation.canContinue(counter: 0),
            "canContinue should be true when there is a limited repeat and the counter is equals to 0"
        )
        XCTAssertTrue(
            animation.canContinue(counter: 1),
            "canContinue should be true when there is a limited repeat and the counter is equals to 1"
        )
        XCTAssertTrue(
            animation.canContinue(counter: 2),
            "canContinue should be true when there is a limited repeat and the counter is equals to 2"
        )
        XCTAssertFalse(
            animation.canContinue(counter: 3),
            "canContinue should be false when there is a limited repeat and the counter is equals to 3"
        )
        XCTAssertFalse(
            animation.canContinue(counter: 4),
            "canContinue should be false when there is a limited repeat and the counter is equals to 4"
        )
    }

    func testUnlimitedRepeat() {
        let animation = SparkAnimationRepeat.unlimited
        XCTAssertTrue(
            animation.canContinue(counter: 0),
            "canContinue should be true when there is an unlimited repeat and the counter is equals to 0"
        )
        XCTAssertTrue(
            animation.canContinue(counter: 100),
            "canContinue should be true when there is an unlimited repeat and the counter is equals to 100"
        )
        XCTAssertTrue(
            animation.canContinue(counter: 1000),
            "canContinue should be true when there is an unlimited repeat and the counter is equals to 1000"
        )
    }
}
