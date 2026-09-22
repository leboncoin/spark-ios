//
//  ColorItemViewModel.swift
//  SparkDemo
//
//  Created by robin.lemaire on 01/03/2023.
//  Copyright © 2023 Leboncoin. All rights reserved.
//

import SwiftUI

struct ColorItemViewModel: Hashable {

    // MARK: - Properties

    let name: String
    let color: Color

    // MARK: - Initialization

    init(name: String,
         colorToken: any ColorToken) {
        self.name = name
        self.color = colorToken.color
    }

    // MARK: - Hashable

    func hash(into hasher: inout Hasher) {
        hasher.combine(name)
    }
}
