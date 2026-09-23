//
//  CardIntent+ButtonExtension.swift
//  SparkComponentCard
//
//  Created by robin.lemaire on 11/06/2026.
//  Copyright © 2026 Leboncoin. All rights reserved.
//

import SparkComponentButton

extension CardIntent {

    var buttonIntent: ButtonIntent {
        switch self {
        case .accent: .accent
        case .alert: .alert
        case .error: .danger
        case .info: .info
        case .main: .main
        case .neutral: .neutral
        case .success: .success
        case .support: .support
        case .surface: .default
        }
    }
}

