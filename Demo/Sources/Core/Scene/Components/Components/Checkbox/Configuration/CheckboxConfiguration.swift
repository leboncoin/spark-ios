//
//  CheckboxConfiguration.swift
//  SparkDemo
//
//  Created by robin.lemaire on 30/01/2025.
//  Copyright © 2025 Leboncoin. All rights reserved.
//

import Foundation

class CheckboxConfiguration: ComponentConfiguration {

    // MARK: - Properties

    var intent: CheckboxIntent = .default
    var text = "My Checkbox"

    // MARK: - SwiftUI Properties Only

    var swiftUIIsCustomContent: Bool = false
    var swiftUISecondText = "is amazing"

    // MARK: - UIKit Properties Only

    var uiKitUseSelectionState: Bool = true
    var uiKitSelectionState: SparkComponentSelectionControls.CheckboxSelectionState = .unselected
    var uiKitIsAttributedText: Bool = false
    var uiKitIsAnimated: Bool = true

    // MARK: - Initialization

    required init() {
        super.init()

        self.accessibilityLabel.showConfiguration = true
        self.isEnabled.showConfiguration = true

        self.uiKitIsSelected.showConfiguration = true
        self.uiKitIsSelected.value = false

        self.uiKitControlType.showConfiguration = true
        self.uiKitControlType.cases = ComponentControlType.classic
        self.uiKitControlType.value = nil

        self.swiftUIWidth.showConfiguration = true
    }

    // MARK: - Getter

    func getInfoValue(from selectionState: SparkComponentSelectionControls.CheckboxSelectionState) -> String {
        return "Selection state : \(selectionState)"
    }

    func getUIKitInfoValue(from selectionState: SparkComponentSelectionControls.CheckboxSelectionState) -> String {
        return self.getInfoValue(from: selectionState) + " - \(self.uiKitIsSelected.value)"
    }

    // MARK: - Methods

    override func random() {
        self.intent = .random
    }
}
