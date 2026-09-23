//
//  ButtonGetSpacingsUseCaseDeprecated.swift
//  SparkComponentButton
//
//  Created by robin.lemaire on 23/06/2023.
//  Copyright © 2023 Leboncoin. All rights reserved.
//

import SparkTheming

// sourcery: AutoMockable, AutoMockTest
@available(*, deprecated, message: "Not used anymore by SparkButton or SparkUIButton")
protocol ButtonGetSpacingsUseCaseDeprecatedable {
    // sourcery: spacing = "Identical"
    func execute(spacing: any LayoutSpacing) -> ButtonLayout
}

@available(*, deprecated, message: "Not used anymore by SparkButton or SparkUIButton")
struct ButtonGetSpacingsUseCaseDeprecated: ButtonGetSpacingsUseCaseDeprecatedable {

    // MARK: - Methods

    func execute(spacing: any LayoutSpacing) -> ButtonLayout {
        return .init(
            horizontalSpacing: spacing.large,
            horizontalPadding: spacing.medium
        )
    }
}
