//
//  Publisher-SubscribeTests.swift
//  SparkCoreTests
//
//  Created by michael.zimmermann on 13.07.23.
//  Copyright © 2023 Leboncoin. All rights reserved.
//

import Combine
@_spi(SI_SPI) @testable import SparkCommon
import XCTest

final class Publisher_SubscribeTests: XCTestCase {
    private var subscriptions = Set<AnyCancellable>()

    func test_subscribe() {
        let sut = CurrentValueSubject<Int, Never>(10).eraseToAnyPublisher()

        let exp = expectation(description: "Value should be emitted")
        sut.subscribe(in: &self.subscriptions) { value in
            XCTAssertEqual(value, 10)
            exp.fulfill()
        }

        wait(for: [exp], timeout: 0.1)
    }
}
