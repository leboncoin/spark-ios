//
//  BorderRadiusState.swift
//  SparkCommon
//
//  Created by robin.lemaire on 01/08/2025.
//  Copyright © 2025 Leboncoin. All rights reserved.
//

enum BorderRadiusState: String, Hashable, CaseIterable {
    case `default`
    case dashed
    case highlighted

    // MARK: - Properties

    var name: String {
        self.rawValue.capitalized
    }
}
