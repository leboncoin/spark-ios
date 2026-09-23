//
//  InsettableShape+StrokeExtension.swift
//  SparkCommon
//
//  Created by robin.lemaire on 20/10/2025.
//  Copyright © 2025 Leboncoin. All rights reserved.
//

import SwiftUI
import SparkTheming

internal extension InsettableShape {

    // MARK: - Internal Methods

    @ViewBuilder
    func stroke(
        colorToken: any ColorToken,
        width: CGFloat,
        dash: CGFloat?,
        position: BorderPosition
    ) -> some View {
        switch position {
        case .inner:
            self.strokeBorder(
                colorToken: colorToken,
                width: width,
                dash: dash
            )

        case .overlay, .outer:
            self.stroke(
                colorToken: colorToken,
                width: width,
                dash: dash
            )
        }
    }

    // MARK: - Private Methods

    @ViewBuilder
    private func strokeBorder(
        colorToken: any ColorToken,
        width: CGFloat,
        dash: CGFloat?
    ) -> some View {
        if let dash, dash > 0 {
            self.strokeBorder(
                colorToken.color,
                style: StrokeStyle(
                    lineWidth: width,
                    dash: dash.toDashArray
                )
            )
        } else {
            self.strokeBorder(
                colorToken.color,
                lineWidth: width
            )
        }
    }

    @ViewBuilder
    private func stroke(
        colorToken: any ColorToken,
        width: CGFloat,
        dash: CGFloat?
    ) -> some View {
        if let dash, dash > 0 {
            self.stroke(
                colorToken.color,
                style: StrokeStyle(
                    lineWidth: width,
                    dash: dash.toDashArray
                )
            )
        } else {
            self.stroke(
                colorToken.color,
                lineWidth: width
            )
        }
    }
}
