//
//  ColorToken+ExtensionTests.swift
//  SparkThemingTesting
//
//  Created by louis.borlee on 13/09/2023.
//  Copyright © 2023 Leboncoin. All rights reserved.
//

import SparkTheming

public extension ColorToken {
    var isClear: Bool {
        return self.color == .clear && self.uiColor == .clear
    }
}
