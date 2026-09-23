//
//  Either.swift
//  SparkCommon
//
//  Created by michael.zimmermann on 19.06.23.
//  Copyright © 2023 Leboncoin. All rights reserved.
//

import Foundation

@_spi(SI_SPI) @frozen public enum Either<Left, Right> {
    case left(Left)
    case right(Right)
}

// MARK: - Equatable

@_spi(SI_SPI) extension Either: Equatable where Left: Equatable, Right: Equatable {
}

// MARK: - Properties

@_spi(SI_SPI) public extension Either {
    var rightValue: Right {
        switch self {
        case let .right(value): return value
        case .left: fatalError("No value for right part")
        }
    }

    var leftValue: Left {
        switch self {
        case let .left(value): return value
        case .right: fatalError("No value for left part")
        }
    }
}

@_spi(SI_SPI) public extension Either {
    static func of(_ left: Left?, or right: Right) -> Either {
        if let left = left {
            return .left(left)
        } else {
            return .right(right)
        }
    }
}
