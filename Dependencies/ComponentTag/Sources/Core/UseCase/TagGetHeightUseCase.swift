//
//  TagGetHeightUseCase.swift
//  SparkComponentTag
//
//  Created by robin.lemaire on 05/08/2025.
//  Copyright © 2025 Leboncoin. All rights reserved.
//

import Foundation
import SparkTheming
import SwiftUI

// sourcery: AutoMockable, AutoMockTest
protocol TagGetHeightUseCaseable {
    func execute(size: TagSize) -> CGFloat
}

final class TagGetHeightUseCase: TagGetHeightUseCaseable {

    // MARK: - Methods

    func execute(size: TagSize) -> CGFloat {
        return switch size {
        case .medium: 20
        case .large: 24
        }
    }
}
