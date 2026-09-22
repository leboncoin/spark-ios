//
//  ControlStateText+Extension.swift
//  SparkComponentButton
//
//  Created by robin.lemaire on 18/09/2025.
//  Copyright © 2025 Leboncoin. All rights reserved.
//

@_spi(SI_SPI) import SparkCommon

extension ControlStateText {

    @available(*, deprecated, message: "Not used anymore by SparkButton or SparkUIButton")
    var isText: Bool {
        self.text != nil || self.attributedText != nil
    }
}
