//
//  Data+MockExtension.swift
//  SparkComponentFileUpload
//
//  Created by robin.lemaire on 30/04/2026.
//  Copyright © 2026 Leboncoin. All rights reserved.
//

import Foundation

@_spi(SI_SPI) public extension Data {

    static var mock: Data {
        Data(count: 1024)
    }

    static var mock2: Data {
        Data(count: 2024)
    }
}
