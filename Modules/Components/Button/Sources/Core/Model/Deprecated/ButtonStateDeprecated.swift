//
//  ButtonStateDeprecated.swift
//  SparkComponentButton
//
//  Created by robin.lemaire on 27/06/2023.
//  Copyright © 2023 Leboncoin. All rights reserved.
//

import Foundation

@available(*, deprecated, message: "Not used anymore by SparkButton or SparkUIButton")
struct ButtonStateDeprecated: Equatable {

    // MARK: - Properties

    let isUserInteractionEnabled: Bool
    let opacity: Double
}
