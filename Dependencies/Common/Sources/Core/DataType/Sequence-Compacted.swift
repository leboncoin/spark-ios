//
//  Sequence-Compacted.swift
//  SparkCommon
//
//  Created by michael.zimmermann on 31.07.23.
//  Copyright © 2023 Leboncoin. All rights reserved.
//

import Foundation

@_spi(SI_SPI) public extension Sequence {
    func compacted<ElementOfResult>() -> [ElementOfResult] where Element == ElementOfResult?  {
        return self.compactMap { $0 }
    }
}
