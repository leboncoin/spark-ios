//
//  Optional+Extension.swift
//  SparkCommon
//
//  Created by robin.lemaire on 24/01/2024.
//  Copyright © 2024 Leboncoin. All rights reserved.
//

import Foundation

@_spi(SI_SPI) public extension Optional where Wrapped: Collection {

    var isEmptyOrNil: Bool {
        return self?.isEmpty ?? true
    }
}
