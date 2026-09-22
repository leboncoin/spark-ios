//
//  ColorsMock.swift
//  SparkThemeUnitTests
//
//  Created by robin.lemaire on 15/09/2025.
//  Copyright © 2025 Leboncoin. All rights reserved.
//

import XCTest
import SparkTheming
@_spi(SI_SPI) import SparkThemingTesting

final class ColorsMock {

    // MARK: - Test Data

    static func createMock1() -> ColorsDefault {
        return ColorsDefault(
            main: ColorsMainDefault(
                main: ColorTokenGeneratedMock.red(),
                onMain: ColorTokenGeneratedMock.blue(),
                mainVariant: ColorTokenGeneratedMock.green(),
                onMainVariant: ColorTokenGeneratedMock.orange(),
                mainContainer: ColorTokenGeneratedMock.yellow(),
                onMainContainer: ColorTokenGeneratedMock.purple()
            ),
            support: ColorsSupportDefault(
                support: ColorTokenGeneratedMock.red(),
                onSupport: ColorTokenGeneratedMock.blue(),
                supportVariant: ColorTokenGeneratedMock.green(),
                onSupportVariant: ColorTokenGeneratedMock.orange(),
                supportContainer: ColorTokenGeneratedMock.yellow(),
                onSupportContainer: ColorTokenGeneratedMock.purple()
            ),
            accent: ColorsAccentDefault(
                accent: ColorTokenGeneratedMock.red(),
                onAccent: ColorTokenGeneratedMock.blue(),
                accentVariant: ColorTokenGeneratedMock.green(),
                onAccentVariant: ColorTokenGeneratedMock.orange(),
                accentContainer: ColorTokenGeneratedMock.yellow(),
                onAccentContainer: ColorTokenGeneratedMock.purple()
            ),
            base: ColorsBaseDefault(
                background: ColorTokenGeneratedMock.red(),
                onBackground: ColorTokenGeneratedMock.blue(),
                backgroundVariant: ColorTokenGeneratedMock.green(),
                onBackgroundVariant: ColorTokenGeneratedMock.orange(),
                surface: ColorTokenGeneratedMock.yellow(),
                onSurface: ColorTokenGeneratedMock.purple(),
                surfaceInverse: ColorTokenGeneratedMock.red(),
                onSurfaceInverse: ColorTokenGeneratedMock.blue(),
                surfaceDark: ColorTokenGeneratedMock.green(),
                onSurfaceDark: ColorTokenGeneratedMock.orange(),
                outline: ColorTokenGeneratedMock.green(),
                outlineHigh: ColorTokenGeneratedMock.orange(),
                overlay: ColorTokenGeneratedMock.yellow(),
                onOverlay: ColorTokenGeneratedMock.purple()
            ),
            feedback: ColorsFeedbackDefault(
                success: ColorTokenGeneratedMock.red(),
                onSuccess: ColorTokenGeneratedMock.blue(),
                successContainer: ColorTokenGeneratedMock.green(),
                onSuccessContainer: ColorTokenGeneratedMock.orange(),
                alert: ColorTokenGeneratedMock.yellow(),
                onAlert: ColorTokenGeneratedMock.purple(),
                alertContainer: ColorTokenGeneratedMock.red(),
                onAlertContainer: ColorTokenGeneratedMock.blue(),
                error: ColorTokenGeneratedMock.green(),
                onError: ColorTokenGeneratedMock.orange(),
                errorContainer: ColorTokenGeneratedMock.yellow(),
                onErrorContainer: ColorTokenGeneratedMock.purple(),
                info: ColorTokenGeneratedMock.red(),
                onInfo: ColorTokenGeneratedMock.blue(),
                infoContainer: ColorTokenGeneratedMock.red(),
                onInfoContainer: ColorTokenGeneratedMock.blue(),
                neutral: ColorTokenGeneratedMock.green(),
                onNeutral: ColorTokenGeneratedMock.orange(),
                neutralContainer: ColorTokenGeneratedMock.yellow(),
                onNeutralContainer: ColorTokenGeneratedMock.purple()
            ),
            states: ColorsStatesDefault(
                mainPressed: ColorTokenGeneratedMock.red(),
                mainVariantPressed: ColorTokenGeneratedMock.blue(),
                mainContainerPressed: ColorTokenGeneratedMock.green(),
                supportPressed: ColorTokenGeneratedMock.orange(),
                supportVariantPressed: ColorTokenGeneratedMock.yellow(),
                supportContainerPressed: ColorTokenGeneratedMock.purple(),
                accentPressed: ColorTokenGeneratedMock.red(),
                accentVariantPressed: ColorTokenGeneratedMock.blue(),
                accentContainerPressed: ColorTokenGeneratedMock.green(),
                surfacePressed: ColorTokenGeneratedMock.purple(),
                surfaceInversePressed: ColorTokenGeneratedMock.red(),
                surfaceDarkPressed: ColorTokenGeneratedMock.blue(),
                successPressed: ColorTokenGeneratedMock.red(),
                successContainerPressed: ColorTokenGeneratedMock.blue(),
                alertPressed: ColorTokenGeneratedMock.green(),
                alertContainerPressed: ColorTokenGeneratedMock.red(),
                errorPressed: ColorTokenGeneratedMock.blue(),
                errorContainerPressed: ColorTokenGeneratedMock.green(),
                infoPressed: ColorTokenGeneratedMock.orange(),
                infoContainerPressed: ColorTokenGeneratedMock.yellow(),
                neutralPressed: ColorTokenGeneratedMock.purple(),
                neutralContainerPressed: ColorTokenGeneratedMock.red(),
                aiPressed: ColorTokenGeneratedMock.blue(),
                aiContainerPressed: ColorTokenGeneratedMock.green(),
                focusPressed: ColorTokenGeneratedMock.orange(),
                focusContainerPressed: ColorTokenGeneratedMock.yellow(),
                newPressed: ColorTokenGeneratedMock.purple(),
                newContainerPressed: ColorTokenGeneratedMock.red(),
                businessPressed: ColorTokenGeneratedMock.blue(),
                businessContainerPressed: ColorTokenGeneratedMock.green(),
                servicePressed: ColorTokenGeneratedMock.orange(),
                serviceContainerPressed: ColorTokenGeneratedMock.yellow()
            ),
            ai: ColorsAIDefault(
                ai: ColorTokenGeneratedMock.red(),
                onAI: ColorTokenGeneratedMock.blue(),
                aiContainer: ColorTokenGeneratedMock.green(),
                onAIContainer: ColorTokenGeneratedMock.orange()
            ),
            focus: ColorsFocusDefault(
                focus: ColorTokenGeneratedMock.red(),
                onFocus: ColorTokenGeneratedMock.blue(),
                focusContainer: ColorTokenGeneratedMock.green(),
                onFocusContainer: ColorTokenGeneratedMock.orange()
            ),
            new: ColorsNewDefault(
                new: ColorTokenGeneratedMock.yellow(),
                onNew: ColorTokenGeneratedMock.purple(),
                newContainer: ColorTokenGeneratedMock.red(),
                onNewContainer: ColorTokenGeneratedMock.blue()
            ),
            business: ColorsBusinessDefault(
                business: ColorTokenGeneratedMock.green(),
                onBusiness: ColorTokenGeneratedMock.orange(),
                businessContainer: ColorTokenGeneratedMock.yellow(),
                onBusinessContainer: ColorTokenGeneratedMock.purple()
            ),
            service: ColorsServiceDefault(
                service: ColorTokenGeneratedMock.red(),
                onService: ColorTokenGeneratedMock.blue(),
                serviceContainer: ColorTokenGeneratedMock.green(),
                onServiceContainer: ColorTokenGeneratedMock.orange()
            )
        )
    }

    static func createMock2() -> ColorsDefault {
        return ColorsDefault(
            main: ColorsMainDefault(
                main: ColorTokenGeneratedMock.red(),
                onMain: ColorTokenGeneratedMock.blue(),
                mainVariant: ColorTokenGeneratedMock.green(),
                onMainVariant: ColorTokenGeneratedMock.orange(),
                mainContainer: ColorTokenGeneratedMock.yellow(),
                onMainContainer: ColorTokenGeneratedMock.purple()
            ),
            support: ColorsSupportDefault(
                support: ColorTokenGeneratedMock.red(),
                onSupport: ColorTokenGeneratedMock.blue(),
                supportVariant: ColorTokenGeneratedMock.green(),
                onSupportVariant: ColorTokenGeneratedMock.orange(),
                supportContainer: ColorTokenGeneratedMock.yellow(),
                onSupportContainer: ColorTokenGeneratedMock.purple()
            ),
            accent: ColorsAccentDefault(
                accent: ColorTokenGeneratedMock.red(),
                onAccent: ColorTokenGeneratedMock.blue(),
                accentVariant: ColorTokenGeneratedMock.green(),
                onAccentVariant: ColorTokenGeneratedMock.orange(),
                accentContainer: ColorTokenGeneratedMock.yellow(),
                onAccentContainer: ColorTokenGeneratedMock.purple()
            ),
            base: ColorsBaseDefault(
                background: ColorTokenGeneratedMock.red(),
                onBackground: ColorTokenGeneratedMock.blue(),
                backgroundVariant: ColorTokenGeneratedMock.green(),
                onBackgroundVariant: ColorTokenGeneratedMock.orange(),
                surface: ColorTokenGeneratedMock.yellow(),
                onSurface: ColorTokenGeneratedMock.purple(),
                surfaceInverse: ColorTokenGeneratedMock.red(),
                onSurfaceInverse: ColorTokenGeneratedMock.blue(),
                surfaceDark: ColorTokenGeneratedMock.green(),
                onSurfaceDark: ColorTokenGeneratedMock.orange(),
                outline: ColorTokenGeneratedMock.green(),
                outlineHigh: ColorTokenGeneratedMock.orange(),
                overlay: ColorTokenGeneratedMock.yellow(),
                onOverlay: ColorTokenGeneratedMock.purple()
            ),
            feedback: ColorsFeedbackDefault(
                success: ColorTokenGeneratedMock.red(),
                onSuccess: ColorTokenGeneratedMock.blue(),
                successContainer: ColorTokenGeneratedMock.green(),
                onSuccessContainer: ColorTokenGeneratedMock.orange(),
                alert: ColorTokenGeneratedMock.yellow(),
                onAlert: ColorTokenGeneratedMock.purple(),
                alertContainer: ColorTokenGeneratedMock.red(),
                onAlertContainer: ColorTokenGeneratedMock.blue(),
                error: ColorTokenGeneratedMock.green(),
                onError: ColorTokenGeneratedMock.orange(),
                errorContainer: ColorTokenGeneratedMock.yellow(),
                onErrorContainer: ColorTokenGeneratedMock.purple(),
                info: ColorTokenGeneratedMock.red(),
                onInfo: ColorTokenGeneratedMock.blue(),
                infoContainer: ColorTokenGeneratedMock.red(),
                onInfoContainer: ColorTokenGeneratedMock.blue(),
                neutral: ColorTokenGeneratedMock.green(),
                onNeutral: ColorTokenGeneratedMock.orange(),
                neutralContainer: ColorTokenGeneratedMock.yellow(),
                onNeutralContainer: ColorTokenGeneratedMock.purple()
            ),
            states: ColorsStatesDefault(
                mainPressed: ColorTokenGeneratedMock.red(),
                mainVariantPressed: ColorTokenGeneratedMock.blue(),
                mainContainerPressed: ColorTokenGeneratedMock.green(),
                supportPressed: ColorTokenGeneratedMock.orange(),
                supportVariantPressed: ColorTokenGeneratedMock.yellow(),
                supportContainerPressed: ColorTokenGeneratedMock.purple(),
                accentPressed: ColorTokenGeneratedMock.red(),
                accentVariantPressed: ColorTokenGeneratedMock.blue(),
                accentContainerPressed: ColorTokenGeneratedMock.green(),
                surfacePressed: ColorTokenGeneratedMock.purple(),
                surfaceInversePressed: ColorTokenGeneratedMock.red(),
                surfaceDarkPressed: ColorTokenGeneratedMock.blue(),
                successPressed: ColorTokenGeneratedMock.red(),
                successContainerPressed: ColorTokenGeneratedMock.blue(),
                alertPressed: ColorTokenGeneratedMock.green(),
                alertContainerPressed: ColorTokenGeneratedMock.red(),
                errorPressed: ColorTokenGeneratedMock.blue(),
                errorContainerPressed: ColorTokenGeneratedMock.green(),
                infoPressed: ColorTokenGeneratedMock.orange(),
                infoContainerPressed: ColorTokenGeneratedMock.yellow(),
                neutralPressed: ColorTokenGeneratedMock.purple(),
                neutralContainerPressed: ColorTokenGeneratedMock.red(),
                aiPressed: ColorTokenGeneratedMock.blue(),
                aiContainerPressed: ColorTokenGeneratedMock.green(),
                focusPressed: ColorTokenGeneratedMock.orange(),
                focusContainerPressed: ColorTokenGeneratedMock.yellow(),
                newPressed: ColorTokenGeneratedMock.purple(),
                newContainerPressed: ColorTokenGeneratedMock.red(),
                businessPressed: ColorTokenGeneratedMock.blue(),
                businessContainerPressed: ColorTokenGeneratedMock.green(),
                servicePressed: ColorTokenGeneratedMock.orange(),
                serviceContainerPressed: ColorTokenGeneratedMock.yellow()
            ),
            ai: ColorsAIDefault(
                ai: ColorTokenGeneratedMock.red(),
                onAI: ColorTokenGeneratedMock.blue(),
                aiContainer: ColorTokenGeneratedMock.green(),
                onAIContainer: ColorTokenGeneratedMock.orange()
            ),
            focus: ColorsFocusDefault(
                focus: ColorTokenGeneratedMock.red(),
                onFocus: ColorTokenGeneratedMock.blue(),
                focusContainer: ColorTokenGeneratedMock.green(),
                onFocusContainer: ColorTokenGeneratedMock.orange()
            ),
            new: ColorsNewDefault(
                new: ColorTokenGeneratedMock.yellow(),
                onNew: ColorTokenGeneratedMock.purple(),
                newContainer: ColorTokenGeneratedMock.red(),
                onNewContainer: ColorTokenGeneratedMock.blue()
            ),
            business: ColorsBusinessDefault(
                business: ColorTokenGeneratedMock.green(),
                onBusiness: ColorTokenGeneratedMock.orange(),
                businessContainer: ColorTokenGeneratedMock.yellow(),
                onBusinessContainer: ColorTokenGeneratedMock.purple()
            ),
            service: ColorsServiceDefault(
                service: ColorTokenGeneratedMock.red(),
                onService: ColorTokenGeneratedMock.blue(),
                serviceContainer: ColorTokenGeneratedMock.green(),
                onServiceContainer: ColorTokenGeneratedMock.orange()
            )
        )
    }

    static func createDifferentMock() -> ColorsDefault {
        return ColorsDefault(
            main: ColorsMainDefault(
                main: ColorTokenGeneratedMock.clear,
                onMain: ColorTokenGeneratedMock.clear,
                mainVariant: ColorTokenGeneratedMock.clear,
                onMainVariant: ColorTokenGeneratedMock.clear,
                mainContainer: ColorTokenGeneratedMock.clear,
                onMainContainer: ColorTokenGeneratedMock.clear
            ),
            support: ColorsSupportDefault(
                support: ColorTokenGeneratedMock.clear,
                onSupport: ColorTokenGeneratedMock.clear,
                supportVariant: ColorTokenGeneratedMock.clear,
                onSupportVariant: ColorTokenGeneratedMock.clear,
                supportContainer: ColorTokenGeneratedMock.clear,
                onSupportContainer: ColorTokenGeneratedMock.clear
            ),
            accent: ColorsAccentDefault(
                accent: ColorTokenGeneratedMock.clear,
                onAccent: ColorTokenGeneratedMock.clear,
                accentVariant: ColorTokenGeneratedMock.clear,
                onAccentVariant: ColorTokenGeneratedMock.clear,
                accentContainer: ColorTokenGeneratedMock.clear,
                onAccentContainer: ColorTokenGeneratedMock.clear
            ),
            base: ColorsBaseDefault(
                background: ColorTokenGeneratedMock.clear,
                onBackground: ColorTokenGeneratedMock.clear,
                backgroundVariant: ColorTokenGeneratedMock.clear,
                onBackgroundVariant: ColorTokenGeneratedMock.clear,
                surface: ColorTokenGeneratedMock.clear,
                onSurface: ColorTokenGeneratedMock.clear,
                surfaceInverse: ColorTokenGeneratedMock.clear,
                onSurfaceInverse: ColorTokenGeneratedMock.clear,
                surfaceDark: ColorTokenGeneratedMock.clear,
                onSurfaceDark: ColorTokenGeneratedMock.clear,
                outline: ColorTokenGeneratedMock.clear,
                outlineHigh: ColorTokenGeneratedMock.clear,
                overlay: ColorTokenGeneratedMock.clear,
                onOverlay: ColorTokenGeneratedMock.clear
            ),
            feedback: ColorsFeedbackDefault(
                success: ColorTokenGeneratedMock.clear,
                onSuccess: ColorTokenGeneratedMock.clear,
                successContainer: ColorTokenGeneratedMock.clear,
                onSuccessContainer: ColorTokenGeneratedMock.clear,
                alert: ColorTokenGeneratedMock.clear,
                onAlert: ColorTokenGeneratedMock.clear,
                alertContainer: ColorTokenGeneratedMock.clear,
                onAlertContainer: ColorTokenGeneratedMock.clear,
                error: ColorTokenGeneratedMock.clear,
                onError: ColorTokenGeneratedMock.clear,
                errorContainer: ColorTokenGeneratedMock.clear,
                onErrorContainer: ColorTokenGeneratedMock.clear,
                info: ColorTokenGeneratedMock.clear,
                onInfo: ColorTokenGeneratedMock.clear,
                infoContainer: ColorTokenGeneratedMock.clear,
                onInfoContainer: ColorTokenGeneratedMock.clear,
                neutral: ColorTokenGeneratedMock.clear,
                onNeutral: ColorTokenGeneratedMock.clear,
                neutralContainer: ColorTokenGeneratedMock.clear,
                onNeutralContainer: ColorTokenGeneratedMock.clear
            ),
            states: ColorsStatesDefault(
                mainPressed: ColorTokenGeneratedMock.clear,
                mainVariantPressed: ColorTokenGeneratedMock.clear,
                mainContainerPressed: ColorTokenGeneratedMock.clear,
                supportPressed: ColorTokenGeneratedMock.clear,
                supportVariantPressed: ColorTokenGeneratedMock.clear,
                supportContainerPressed: ColorTokenGeneratedMock.clear,
                accentPressed: ColorTokenGeneratedMock.clear,
                accentVariantPressed: ColorTokenGeneratedMock.clear,
                accentContainerPressed: ColorTokenGeneratedMock.clear,
                surfacePressed: ColorTokenGeneratedMock.clear,
                surfaceInversePressed: ColorTokenGeneratedMock.clear,
                surfaceDarkPressed: ColorTokenGeneratedMock.clear,
                successPressed: ColorTokenGeneratedMock.clear,
                successContainerPressed: ColorTokenGeneratedMock.clear,
                alertPressed: ColorTokenGeneratedMock.clear,
                alertContainerPressed: ColorTokenGeneratedMock.clear,
                errorPressed: ColorTokenGeneratedMock.clear,
                errorContainerPressed: ColorTokenGeneratedMock.clear,
                infoPressed: ColorTokenGeneratedMock.clear,
                infoContainerPressed: ColorTokenGeneratedMock.clear,
                neutralPressed: ColorTokenGeneratedMock.clear,
                neutralContainerPressed: ColorTokenGeneratedMock.clear,
                aiPressed: ColorTokenGeneratedMock.clear,
                aiContainerPressed: ColorTokenGeneratedMock.clear,
                focusPressed: ColorTokenGeneratedMock.clear,
                focusContainerPressed: ColorTokenGeneratedMock.clear,
                newPressed: ColorTokenGeneratedMock.clear,
                newContainerPressed: ColorTokenGeneratedMock.clear,
                businessPressed: ColorTokenGeneratedMock.clear,
                businessContainerPressed: ColorTokenGeneratedMock.clear,
                servicePressed: ColorTokenGeneratedMock.clear,
                serviceContainerPressed: ColorTokenGeneratedMock.clear
            ),
            ai: ColorsAIDefault(
                ai: ColorTokenGeneratedMock.clear,
                onAI: ColorTokenGeneratedMock.clear,
                aiContainer: ColorTokenGeneratedMock.clear,
                onAIContainer: ColorTokenGeneratedMock.clear
            ),
            focus: ColorsFocusDefault(
                focus: ColorTokenGeneratedMock.clear,
                onFocus: ColorTokenGeneratedMock.clear,
                focusContainer: ColorTokenGeneratedMock.clear,
                onFocusContainer: ColorTokenGeneratedMock.clear
            ),
            new: ColorsNewDefault(
                new: ColorTokenGeneratedMock.clear,
                onNew: ColorTokenGeneratedMock.clear,
                newContainer: ColorTokenGeneratedMock.clear,
                onNewContainer: ColorTokenGeneratedMock.clear
            ),
            business: ColorsBusinessDefault(
                business: ColorTokenGeneratedMock.clear,
                onBusiness: ColorTokenGeneratedMock.clear,
                businessContainer: ColorTokenGeneratedMock.clear,
                onBusinessContainer: ColorTokenGeneratedMock.clear
            ),
            service: ColorsServiceDefault(
                service: ColorTokenGeneratedMock.clear,
                onService: ColorTokenGeneratedMock.clear,
                serviceContainer: ColorTokenGeneratedMock.clear,
                onServiceContainer: ColorTokenGeneratedMock.clear
            )
        )
    }
}
