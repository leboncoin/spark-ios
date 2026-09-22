//
//  ButtonGetStateUseCaseDeprecated.swift
//  SparkComponentButton
//
//  Created by robin.lemaire on 27/06/2023.
//  Copyright © 2023 Leboncoin. All rights reserved.
//

import SparkTheming

// sourcery: AutoMockable, AutoMockTest
@available(*, deprecated, message: "Not used anymore by SparkButton or SparkUIButton")
protocol ButtonGetStateUseCaseDeprecatedable {
    // sourcery: dims = "Identical"
    func execute(
        isEnabled: Bool,
        dims: any Dims
    ) -> ButtonStateDeprecated
}

@available(*, deprecated, message: "Not used anymore by SparkButton or SparkUIButton")
struct ButtonGetStateUseCaseDeprecated: ButtonGetStateUseCaseDeprecatedable {

    // MARK: - Methods

    func execute(
        isEnabled: Bool,
        dims: any Dims
    ) -> ButtonStateDeprecated {
        let opacity = isEnabled ? dims.none : dims.dim3

        return .init(
            isUserInteractionEnabled: isEnabled,
            opacity: opacity
        )
    }
}
