//
//  PublisherMock.swift
//  Spark
//
//  Created by robin.lemaire on 31/08/2023.
//  Copyright © 2023 Leboncoin. All rights reserved.
//

import Combine
import Foundation

@_spi(SI_SPI) public final class PublisherMock<T: Publisher> {

    // MARK: - Properties

    private let publisher: T
    public let name: String
    public var sinkValue: T.Output?
    public var sinkValues = [T.Output]()
    public var sinkCount = 0
    public var sinkCalled: Bool {
        return self.sinkCount > 0
    }

    // MARK: - Initialization

    public init(
        publisher: T,
        name: String = String(describing: T.Output.self)
    ) {
        self.publisher = publisher
        self.name = name
    }

    // MARK: - Methods

    public func reset() {
        self.sinkValue = nil
        self.sinkValues.removeAll()
        self.sinkCount = 0
    }
}

// MARK: - Tests Management

public extension PublisherMock where T.Failure == Never {

    func loadTesting(on subscriptions: inout Set<AnyCancellable>) {
        self.publisher.sink { [weak self] value in
            guard let self = self else { return }
            self.sinkCount += 1

            // T.Output is optional and nil ? We don't set the value
            if !((value as AnyObject) is NSNull) {
                self.sinkValue = value
                self.sinkValues.append(value)
            }
        }
        .store(in: &subscriptions)
    }
}
