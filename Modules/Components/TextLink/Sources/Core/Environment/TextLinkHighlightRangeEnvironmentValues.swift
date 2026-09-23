//
//  TextLinkHighlightRangeEnvironmentValues.swift
//  SparkComponentTextLink
//
//  Created by robin.lemaire on 29/10/2025.
//  Copyright © 2025 Leboncoin. All rights reserved.
//

import SwiftUI

struct TextLinkRange: Equatable {
    var value: NSRange?
}

extension EnvironmentValues {
    @Entry var textLinkHighlightRange: TextLinkRange = .init()
}

public extension View {

    /// Set the **highlight range** on the ``SparkTextLink``.
    ///
    /// The default value for this property is *nil*.
    func sparkTextLinkHighlightRange(_ range: NSRange?) -> some View {
        self.environment(\.textLinkHighlightRange, .init(value: range))
    }
}
