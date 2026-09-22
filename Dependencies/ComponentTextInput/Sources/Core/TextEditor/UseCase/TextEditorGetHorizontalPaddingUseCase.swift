//
//  TextEditorGetHorizontalPaddingUseCase.swift
//  SparkComponentTextInput
//
//  Created by robin.lemaire on 11/06/2025.
//  Copyright © 2025 Leboncoin. All rights reserved.
//

import Foundation
import SparkTheming
import SwiftUI

// sourcery: AutoMockable, AutoMockTest
protocol TextEditorGetHorizontalPaddingUseCaseable {
    func execute(spacings: TextInputSpacings) -> CGFloat
}

final class TextEditorGetHorizontalPaddingUseCase: TextEditorGetHorizontalPaddingUseCaseable {

    // MARK: - Methods

    func execute(spacings: TextInputSpacings) -> CGFloat {
        return spacings.horizontal - 4
    }
}
