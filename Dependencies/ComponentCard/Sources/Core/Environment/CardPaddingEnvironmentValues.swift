//
//  CardPaddingEnvironmentValues.swift
//  SparkComponentCard
//
//  Created by robin.lemaire on 16/06/2026.
//  Copyright © 2026 Leboncoin. All rights reserved.
//

import SwiftUI

extension EnvironmentValues {
    @Entry var cardPadding: CardPadding = .default
}

public extension View {

    /// Set the **padding** on the ``SparkCard``.
    ///
    /// The default value for this property is *CardPadding.default*.
    func sparkCardPadding(_ padding: CardPadding) -> some View {
        self.environment(\.cardPadding, padding)
    }

    /// Set the **padding** on the ``SparkCard``.
    ///
    /// The default value for this property is *true*.
    @available(*, deprecated, message: "Replace by sparkCardPadding.")
    func sparkCardIsPadding(_ isPadding: Bool) -> some View {
        self.environment(\.cardPadding, isPadding ? .all : .none)
    }
}
