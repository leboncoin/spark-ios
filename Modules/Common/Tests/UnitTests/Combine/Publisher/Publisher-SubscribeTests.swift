//
//  Publisher-SubscribeTests.swift
//  SparkCoreTests
//
//  Created by michael.zimmermann on 13.07.23.
//  Copyright © 2023 Leboncoin. All rights reserved.
//

import Combine
@_spi(SI_SPI) @testable import SparkCommon
import Testing

@MainActor
@Suite("Publisher Subscribe Tests")
final class PublisherSubscribeTests {
    private var subscriptions = Set<AnyCancellable>()

    @Test("Subscribe should emit the value")
    func subscribe() async {
        let sut = CurrentValueSubject<Int, Never>(10).eraseToAnyPublisher()

        await confirmation("Value should be emitted") { confirm in
            sut.subscribe(in: &self.subscriptions) { value in
                #expect(value == 10)
                confirm()
            }
        }
    }
}
