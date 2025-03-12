//
//  TextFieldAddonsConfiguration.swift
//  SparkDemo
//
//  Created by robin.lemaire on 24/01/2025.
//  Copyright © 2025 Leboncoin. All rights reserved.
//

import Foundation
import SwiftUI

class TextFieldAddonsConfiguration: TextFieldConfiguration {

    // MARK: - Properties

    var leftAddonContentType: TextFieldSideViewContentType = .random
    var isLeftAddonPadding: Bool = .random()
    var rightAddonContentType: TextFieldSideViewContentType = .random
    var isRightAddonPadding: Bool = .random()
}
