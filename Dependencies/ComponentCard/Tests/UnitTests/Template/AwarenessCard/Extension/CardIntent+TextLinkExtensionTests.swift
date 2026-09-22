//
//  CardIntent+TextLinkExtensionTests.swift
//  SparkComponentCardTests
//
//  Created by robin.lemaire on 17/06/2026.
//  Copyright © 2026 Leboncoin. All rights reserved.
//

import Testing
import SparkComponentTextLink
@testable import SparkComponentCard
@_spi(SI_SPI) import SparkCommonTesting
import SparkTheme
@testable @_spi(SI_SPI) import SparkThemingTesting

// MARK: - Tests

@Suite("CardIntent+TextLinkExtension Tests")
struct CardIntentTextLinkExtensionTests {

    // MARK: - Properties

    private let theme = ThemeGeneratedMock.mocked()

    // MARK: - Tests

    @Test("Test textLinkIntent for all CardIntent cases")
    func testTextLinkIntentMapping() {
        // GIVEN / WHEN / THEN
        let accentIntent = CardIntent.accent.textLinkIntent(theme: self.theme)
        let alertIntent = CardIntent.alert.textLinkIntent(theme: self.theme)
        let errorIntent = CardIntent.error.textLinkIntent(theme: self.theme)
        let infoIntent = CardIntent.info.textLinkIntent(theme: self.theme)
        let mainIntent = CardIntent.main.textLinkIntent(theme: self.theme)
        let neutralIntent = CardIntent.neutral.textLinkIntent(theme: self.theme)
        let successIntent = CardIntent.success.textLinkIntent(theme: self.theme)
        let supportIntent = CardIntent.support.textLinkIntent(theme: self.theme)
        let surfaceIntent = CardIntent.surface.textLinkIntent(theme: self.theme)

        // Verify custom colors are returned for all except surface
        if case .custom(let color) = accentIntent {
            #expect(color.equals(self.theme.colors.accent.onAccentContainer))
        } else {
            Issue.record("Expected custom intent for accent")
        }

        if case .custom(let color) = alertIntent {
            #expect(color.equals(self.theme.colors.feedback.onAlertContainer))
        } else {
            Issue.record("Expected custom intent for alert")
        }

        if case .custom(let color) = errorIntent {
            #expect(color.equals(self.theme.colors.feedback.onErrorContainer))
        } else {
            Issue.record("Expected custom intent for error")
        }

        if case .custom(let color) = infoIntent {
            #expect(color.equals(self.theme.colors.feedback.onInfoContainer))
        } else {
            Issue.record("Expected custom intent for info")
        }

        if case .custom(let color) = mainIntent {
            #expect(color.equals(self.theme.colors.main.onMainContainer))
        } else {
            Issue.record("Expected custom intent for main")
        }

        if case .custom(let color) = neutralIntent {
            #expect(color.equals(self.theme.colors.feedback.onNeutralContainer))
        } else {
            Issue.record("Expected custom intent for neutral")
        }

        if case .custom(let color) = successIntent {
            #expect(color.equals(self.theme.colors.feedback.onSuccessContainer))
        } else {
            Issue.record("Expected custom intent for success")
        }

        if case .custom(let color) = supportIntent {
            #expect(color.equals(self.theme.colors.support.onSupportContainer))
        } else {
            Issue.record("Expected custom intent for support")
        }

        #expect(surfaceIntent == .default)
    }

    @Test("Test textLinkIntent for all cases", arguments: CardIntent.allCases)
    func testAllCases(cardIntent: CardIntent) {
        // GIVEN / WHEN
        let textLinkIntent = cardIntent.textLinkIntent(theme: self.theme)

        // THEN
        switch cardIntent {
        case .accent:
            if case .custom(let color) = textLinkIntent {
                #expect(color.equals(self.theme.colors.accent.onAccentContainer))
            } else {
                Issue.record("Expected custom intent for accent")
            }
        case .alert:
            if case .custom(let color) = textLinkIntent {
                #expect(color.equals(self.theme.colors.feedback.onAlertContainer))
            } else {
                Issue.record("Expected custom intent for alert")
            }
        case .error:
            if case .custom(let color) = textLinkIntent {
                #expect(color.equals(self.theme.colors.feedback.onErrorContainer))
            } else {
                Issue.record("Expected custom intent for error")
            }
        case .info:
            if case .custom(let color) = textLinkIntent {
                #expect(color.equals(self.theme.colors.feedback.onInfoContainer))
            } else {
                Issue.record("Expected custom intent for info")
            }
        case .main:
            if case .custom(let color) = textLinkIntent {
                #expect(color.equals(self.theme.colors.main.onMainContainer))
            } else {
                Issue.record("Expected custom intent for main")
            }
        case .neutral:
            if case .custom(let color) = textLinkIntent {
                #expect(color.equals(self.theme.colors.feedback.onNeutralContainer))
            } else {
                Issue.record("Expected custom intent for neutral")
            }
        case .success:
            if case .custom(let color) = textLinkIntent {
                #expect(color.equals(self.theme.colors.feedback.onSuccessContainer))
            } else {
                Issue.record("Expected custom intent for success")
            }
        case .support:
            if case .custom(let color) = textLinkIntent {
                #expect(color.equals(self.theme.colors.support.onSupportContainer))
            } else {
                Issue.record("Expected custom intent for support")
            }
        case .surface:
            #expect(textLinkIntent == .default)
        }
    }
}
