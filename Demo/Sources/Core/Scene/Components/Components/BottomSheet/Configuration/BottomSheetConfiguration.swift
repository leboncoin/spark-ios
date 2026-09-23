//
//  BottomSheetConfiguration.swift
//  SparkDemo
//
//  Created by robin.lemaire on 29/01/2025.
//  Copyright © 2025 Leboncoin. All rights reserved.
//

import Foundation

class BottomSheetConfiguration: ComponentConfiguration {

    // MARK: - Properties

    var contentType: BottomSheetContentType = .random

    // MARK: - Methods

    override func random() {
        self.contentType = .random
    }
}
