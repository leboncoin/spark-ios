//
//  RadioButtonStateAttribute.swift
//  SparkRadioButton
//
//  Created by michael.zimmermann on 18.09.23.
//  Copyright © 2023 Leboncoin. All rights reserved.
//

import Foundation
@_spi(SI_SPI) import SparkCommon

struct RadioButtonStateAttribute: Updateable {
    var isSelected: Bool
    var isEnabled: Bool
}
