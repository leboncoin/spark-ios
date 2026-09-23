//
//  RadioButtonScenarioConfiguration.swift
//  SparkComponentRadioButton
//
//  Created by louis.borlee on 21/10/2024.
//  Copyright © 2024 Leboncoin. All rights reserved.
//

import UIKit
@testable import SparkComponentRadioButton
@_spi(SI_SPI) @testable import SparkCommon
@_spi(SI_SPI) @testable import SparkCommonSnapshotTesting

struct RadioButtonScenarioConfiguration: CustomStringConvertible {

    let description: String
    let intent: RadioButtonIntent
    let radioButtons: [SingleRadioButtonConfiguration]
    let groupLayout: RadioButtonGroupLayout
    let labelAlignment: RadioButtonLabelAlignment
    let hasExpendedContainer: Bool
    let showTapArea: Bool
    let modes: [ComponentSnapshotTestMode]
    let sizes: [UIContentSizeCategory]

    var testName: String {
        return "\(self)-\(self.intent)-\(self.groupLayout)-\(self.labelAlignment)-\(self.showTapArea ? "withTapArea" : "withoutTapArea")-\(self.hasExpendedContainer ? "expendedContainer" : "defaultContainer")"
    }

    struct SingleRadioButtonConfiguration {
        let text: String
        let isSelected: Bool
        let isEnabled: Bool
        let isHighlighted: Bool
    }
}

extension RadioButtonGroupLayout: CustomStringConvertible {
    public var description: String {
        switch self {
        case .horizontal: return "horizontal"
        case .vertical: return "vertical"
        }
    }
}

extension RadioButtonLabelAlignment: CustomStringConvertible {
    public var description: String {
        switch self {
        case .leading: return "textLeading"
        case .trailing: return "textTrailing"
        }
    }
}
