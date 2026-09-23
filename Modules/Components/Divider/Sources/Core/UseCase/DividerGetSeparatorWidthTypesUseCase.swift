//
//
//  DividerGetSeparatorWidthTypesUseCase.swift
//  SparkComponentDivider
//
//  Created by robin.lemaire on 12/10/2025.
//  Copyright © 2025 Leboncoin. All rights reserved.
//

import Foundation
import SparkTheming

// sourcery: AutoMockable, AutoMockTest
protocol DividerGetSeparatorWidthTypesUseCaseable {
    func execute(alignment: DividerAlignment, axis: DividerAxis) -> DividerSeparatorWidthTypes
}

struct DividerGetSeparatorWidthTypesUseCase: DividerGetSeparatorWidthTypesUseCaseable {

    // MARK: - Methods

    func execute(
        alignment: DividerAlignment,
        axis: DividerAxis
    ) -> DividerSeparatorWidthTypes {
        return .init(
            first: self.execute(
                position: .first,
                alignment: alignment,
                axis: axis
            ),
            last: self.execute(
                position: .last,
                alignment: alignment,
                axis: axis
            )
        )
    }

    // MARK: - Private Methods

    private func execute(
        position: DividerSeparatorPosition,
        alignment: DividerAlignment,
        axis: DividerAxis
    ) -> DividerSeparatorWidthType{
        return switch (position, axis, alignment) {
        case (.first, .vertical, .top): .fixed
        case (.first, .horizontal, .leading): .fixed
        case (.first, .vertical, .bottom): .dynamic
        case (.first, .horizontal, .trailing): .dynamic
        case (.first, _, _): .equal

        case (.last, .vertical, .top): .dynamic
        case (.last, .horizontal, .leading): .dynamic
        case (.last, .vertical, .bottom): .fixed
        case (.last, .horizontal, .trailing): .fixed
        case (.last, _, _): .equal
        }
    }
}
