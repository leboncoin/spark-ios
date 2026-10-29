//
//  FormFieldGetColorsUseCaseTests.swift
//  SparkComponentFormField
//
//  Created by alican.aycil on 26.03.24.
//  Copyright © 2024 Leboncoin. All rights reserved.
//

import Testing
import SwiftUI
@testable import SparkComponentFormField
@_spi(SI_SPI) import SparkThemingTesting

@MainActor
@Suite("FormField Get Colors UseCase Tests")
struct FormFieldGetColorsUseCaseTests {

    // MARK: - Tests

    @Test("Execute for all feedback cases")
    func executeForAllFeedbackCases() {
        // GIVEN
        let themeMocked = ThemeGeneratedMock.mocked()

        let useCase = FormFieldGetColorsUseCase()

        // WHEN
        for feedbackState in FormFieldFeedbackState.allCases {
            let colors = useCase.execute(from: themeMocked, feedback: feedbackState)
            let expectedColors = feedbackState.colors(from: themeMocked)

            // THEN
            #expect(
                colors.title.uiColor == expectedColors.title.uiColor,
                "Wrong title when feedbackState is equals to .\(feedbackState)"
            )
            #expect(
                colors.require.uiColor == expectedColors.require.uiColor,
                "Wrong require when feedbackState is equals to .\(feedbackState)"
            )
            #expect(
                colors.helper.uiColor == expectedColors.helper.uiColor,
                "Wrong helper when feedbackState is equals to .\(feedbackState)"
            )
            #expect(
                colors.secondaryHelper.uiColor == expectedColors.secondaryHelper.uiColor,
                "Wrong secondaryHelper when feedbackState is equals to .\(feedbackState)"
            )
        }
    }
}

// MARK: - Extension

private extension FormFieldFeedbackState {

    func colors(from theme: ThemeGeneratedMock) -> FormFieldColors {
        let expectedCommonColor = theme.colors.base.onSurface.opacity(theme.dims.dim1)

        return switch self {
        case .default:
                .init(
                    title: theme.colors.base.onSurface,
                    clearButton: theme.colors.feedback.onNeutralContainer,
                    require: expectedCommonColor,
                    helper: expectedCommonColor,
                    secondaryHelper: expectedCommonColor
                )
        case .error:
                .init(
                    title: theme.colors.base.onSurface,
                    clearButton: theme.colors.feedback.onNeutralContainer,
                    require: expectedCommonColor,
                    helper: theme.colors.feedback.error,
                    secondaryHelper: expectedCommonColor
                )
        }
    }
}
