//
//  ButtonType.swift
//  SparkComponentButton
//
//  Created by robin.lemaire on 09/11/2023.
//  Copyright © 2023 Leboncoin. All rights reserved.
//

internal enum ButtonType: CaseIterable {
    case button
    case iconButton

    // MARK: - Initialization

    init(isTitle: Bool, isImage: Bool) {
        self = switch (isTitle, isImage) {
        case (false, true): .iconButton
        default: .button
        }
    }
}
