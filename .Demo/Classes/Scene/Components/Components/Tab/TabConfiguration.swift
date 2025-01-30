//
//  TabConfiguration.swift
//  SparkDemo
//
//  Created by robin.lemaire on 27/01/2025.
//  Copyright © 2025 Adevinta. All rights reserved.
//

import Foundation

class TabConfiguration: ComponentConfiguration {

    // MARK: - Properties

    var intent: TabIntent = .random
    var isText: Bool = true
    var isLongLabel: Bool = .random()
    var isIcon: Bool = .random()
    var isBadge: Bool = false {
        didSet {
            self.badgePosition = (0..<self.numberOfTabs).randomElement() ?? 0
        }
    }
    private(set) var badgePosition = 0
    var isEqualSize: Bool = .random()
    var tabSize: TabSize = .random
    var numberOfTabs = 4
    var isDisabledRandomTab: Bool = false {
        didSet {
            if self.isDisabledRandomTab {
                self.disabledTab = (0..<self.numberOfTabs).randomElement() ?? 0
            } else {
                self.disabledTab = 0
            }
        }
    }
    private(set) var disabledTab = 0

    // MARK: - Initialization

    required init() {
        super.init()

        self.isEnabled.showConfiguration = true
    }
}
