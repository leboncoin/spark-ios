//
//  TextFieldGetContentPaddingUseCase.swift
//  SparkComponentTextInput
//
//  Created by robin.lemaire on 11/06/2025.
//  Copyright © 2025 Leboncoin. All rights reserved.
//

import Foundation
import SparkTheming
import SwiftUI

// sourcery: AutoMockable, AutoMockTest
protocol TextFieldGetContentPaddingUseCaseable {
    func execute(spacings: TextInputSpacings, isClearButton: Bool) -> TextFieldContentPadding
}

final class TextFieldGetContentPaddingUseCase: TextFieldGetContentPaddingUseCaseable {

    // MARK: - Methods

    func execute(spacings: TextInputSpacings, isClearButton: Bool) -> TextFieldContentPadding {
        return .init(
            top: .zero,
            leading: spacings.horizontal,
            bottom: .zero,
            trailing: spacings.horizontal,
            inputTrailing: isClearButton ? .zero : spacings.horizontal
        )
    }
}
