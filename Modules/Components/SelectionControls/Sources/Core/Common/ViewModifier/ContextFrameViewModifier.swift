//
//  ContextFrameViewModifier.swift
//  SparkComponentSelectionControls
//
//  Created by robin.lemaire on 10/02/2026.
//  Copyright © 2026 Leboncoin. All rights reserved.
//

import SwiftUI

private struct ContextFrameViewModifier: ViewModifier {

    // MARK: - Properties

    @Environment(\.selectionControlsStyleContext) private var styleContext

    // MARK: - Initialization

    func body(content: Content) -> some View {
        switch self.styleContext {
        case .alone: content
        case .group(let axis):
            switch axis {
            case .horizontal: content
            case .vertical:
                content.frame(maxWidth: .infinity, alignment: .leading)
                    .contentShape(Rectangle())
            }
        }
    }
}

// MARK: - Extension

extension View {

    func contextFrame() -> some View {
        self.modifier(ContextFrameViewModifier())
    }
}
