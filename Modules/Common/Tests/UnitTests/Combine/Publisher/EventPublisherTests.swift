//
//  EventPublisherTests.swift
//  SparkCore
//
//  Created by janniklas.freundt.ext on 31.05.23.
//  Copyright © 2023 Leboncoin. All rights reserved.
//

import Combine
@_spi(SI_SPI) @testable import SparkCommon
import SwiftUI
import Testing

@Suite("Event Publisher Tests")
@MainActor
final class EventPublisherTests {

    // MARK: - Properties
    private let button: UIButton
    private var cancellables = Set<AnyCancellable>()

    // MARK: - Initialization
    init() {
        self.button = UIButton(type: .system)
    }

    // MARK: - Tests
    @Test("Create should set the control and the event")
    func create() throws {
        // Given
        let sut = self.button.publisher(for: .touchUpOutside)

        // Then
        #expect(sut != nil)
        #expect(sut.control != nil)
        #expect(sut.event == .touchUpOutside)
        #expect(self.button.allControlEvents == [])
    }

    @Test("Control event should be registered on subscription")
    func controlEvent() throws {
        // Given
        let sut = self.button.publisher(for: .touchDragExit)

        // Then
        #expect(self.button.allControlEvents == [])

        // Given
        self.register(publisher: sut)

        // Then
        #expect(self.button.allControlEvents == .touchDragExit)
    }

    @Test("Multiple publishers should register all events")
    func multiplePublishers() throws {
        // Given
        let publisherTouchUpInside = self.button.publisher(for: .touchUpInside)
        let publisherTouchCancel = self.button.publisher(for: .touchCancel)

        // Then
        #expect(self.button.allControlEvents == [])

        // Given
        self.register(publisher: publisherTouchUpInside)
        self.register(publisher: publisherTouchCancel)

        // Then
        #expect(self.button.allControlEvents == [.touchUpInside, .touchCancel])
    }

    @Test("Cancel should remove the control event")
    func cancel() throws {
        // Given
        let sut = self.button.publisher(for: .touchDragExit)
        self.register(publisher: sut)

        // Then
        #expect(self.button.allControlEvents == .touchDragExit)

        // Given
        self.cancellables.removeAll()

        // Then
        #expect(self.button.allControlEvents == [])
    }

    // MARK: - Helper

    private func register(publisher: UIControl.EventPublisher) {
        publisher
            .sink(receiveValue: { _ in })
            .store(in: &self.cancellables)
    }
}
