//
//  ChipContent.swift
//  SparkComponentChipTests
//
//  Created by michael.zimmermann on 20.09.23.
//  Copyright © 2023 Leboncoin. All rights reserved.
//

import Foundation
import SwiftUI
@_spi(SI_SPI) import SparkCommon

@available(*, deprecated, message: "Not used anymore by SparkChip")
public struct ChipContent: Updateable {
    public var title: String?
    public var icon: Image?
    public var component: AnyView?
}
