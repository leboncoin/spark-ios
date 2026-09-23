//
//  SparkColors.swift
//  SparkTheme
//
//  Created by robin.lemaire on 28/02/2023.
//  Copyright © 2023 Leboncoin. All rights reserved.
//

import SparkTheming
import UIKit
import SwiftUI

struct SparkColors: Colors {

    // MARK: - Properties

    let main: any ColorsMain = ColorsMainDefault(
        main: ColorTokenDefault(named: "main", in: .module),
        onMain: ColorTokenDefault(named: "on-main", in: .module),
        mainVariant: ColorTokenDefault(named: "main-variant", in: .module),
        onMainVariant: ColorTokenDefault(named: "on-main-variant", in: .module),
        mainContainer: ColorTokenDefault(named: "main-container", in: .module),
        onMainContainer: ColorTokenDefault(named: "on-main-container", in: .module)
    )

    let support: any ColorsSupport = ColorsSupportDefault(
        support: ColorTokenDefault(named: "support", in: .module),
        onSupport: ColorTokenDefault(named: "on-support", in: .module),
        supportVariant: ColorTokenDefault(named: "support-variant", in: .module),
        onSupportVariant: ColorTokenDefault(named: "on-support-variant", in: .module),
        supportContainer: ColorTokenDefault(named: "support-container", in: .module),
        onSupportContainer: ColorTokenDefault(named: "on-support-container", in: .module)
    )

    let accent: any ColorsAccent = ColorsAccentDefault(
        accent: ColorTokenDefault(named: "accent", in: .module),
        onAccent: ColorTokenDefault(named: "on-accent", in: .module),
        accentVariant: ColorTokenDefault(named: "accent-variant", in: .module),
        onAccentVariant: ColorTokenDefault(named: "on-accent-variant", in: .module),
        accentContainer: ColorTokenDefault(named: "accent-container", in: .module),
        onAccentContainer: ColorTokenDefault(named: "on-accent-container", in: .module)
    )

    let base: any ColorsBase = ColorsBaseDefault(
        background: ColorTokenDefault(named: "background", in: .module),
        onBackground: ColorTokenDefault(named: "on-background", in: .module),
        backgroundVariant: ColorTokenDefault(named: "background-variant", in: .module),
        onBackgroundVariant: ColorTokenDefault(named: "on-background-variant", in: .module),
        surface: ColorTokenDefault(named: "surface", in: .module),
        onSurface: ColorTokenDefault(named: "on-surface", in: .module),
        surfaceInverse: ColorTokenDefault(named: "surface-inverse", in: .module),
        onSurfaceInverse: ColorTokenDefault(named: "on-surface-inverse", in: .module),
        surfaceDark: ColorTokenDefault(named: "surface-dark", in: .module),
        onSurfaceDark: ColorTokenDefault(named: "on-surface-dark", in: .module),
        outline: ColorTokenDefault(named: "outline", in: .module),
        outlineHigh: ColorTokenDefault(named: "outline-high", in: .module),
        overlay: ColorTokenDefault(named: "overlay", in: .module),
        onOverlay: ColorTokenDefault(named: "on-overlay", in: .module)
    )

    let feedback: any ColorsFeedback = ColorsFeedbackDefault(
        success: ColorTokenDefault(named: "success", in: .module),
        onSuccess: ColorTokenDefault(named: "on-success", in: .module),
        successContainer: ColorTokenDefault(named: "success-container", in: .module),
        onSuccessContainer: ColorTokenDefault(named: "on-success-container", in: .module),
        alert: ColorTokenDefault(named: "alert", in: .module),
        onAlert: ColorTokenDefault(named: "on-alert", in: .module),
        alertContainer: ColorTokenDefault(named: "alert-container", in: .module),
        onAlertContainer: ColorTokenDefault(named: "on-alert-container", in: .module),
        error: ColorTokenDefault(named: "error", in: .module),
        onError: ColorTokenDefault(named: "on-error", in: .module),
        errorContainer: ColorTokenDefault(named: "error-container", in: .module),
        onErrorContainer: ColorTokenDefault(named: "on-error-container", in: .module),
        info: ColorTokenDefault(named: "info", in: .module),
        onInfo: ColorTokenDefault(named: "on-info", in: .module),
        infoContainer: ColorTokenDefault(named: "info-container", in: .module),
        onInfoContainer: ColorTokenDefault(named: "on-info-container", in: .module),
        neutral: ColorTokenDefault(named: "neutral", in: .module),
        onNeutral: ColorTokenDefault(named: "on-neutral", in: .module),
        neutralContainer: ColorTokenDefault(named: "neutral-container", in: .module),
        onNeutralContainer: ColorTokenDefault(named: "on-neutral-container", in: .module)
    )

    let states: any ColorsStates = ColorsStatesDefault(
        mainPressed: ColorTokenDefault(named: "main-pressed", in: .module),
        mainVariantPressed: ColorTokenDefault(named: "main-variant-pressed", in: .module),
        mainContainerPressed: ColorTokenDefault(named: "main-container-pressed", in: .module),
        supportPressed: ColorTokenDefault(named: "support-pressed", in: .module),
        supportVariantPressed: ColorTokenDefault(named: "support-variant-pressed", in: .module),
        supportContainerPressed: ColorTokenDefault(named: "support-container-pressed", in: .module),
        accentPressed: ColorTokenDefault(named: "accent-pressed", in: .module),
        accentVariantPressed: ColorTokenDefault(named: "accent-variant-pressed", in: .module),
        accentContainerPressed: ColorTokenDefault(named: "accent-container-pressed", in: .module),
        surfacePressed: ColorTokenDefault(named: "surface-pressed", in: .module),
        surfaceInversePressed: ColorTokenDefault(named: "surface-inverse-pressed", in: .module),
        surfaceDarkPressed: ColorTokenDefault(named: "surface-dark-pressed", in: .module),
        successPressed: ColorTokenDefault(named: "success-pressed", in: .module),
        successContainerPressed: ColorTokenDefault(named: "success-container-pressed", in: .module),
        alertPressed: ColorTokenDefault(named: "alert-pressed", in: .module),
        alertContainerPressed: ColorTokenDefault(named: "alert-container-pressed", in: .module),
        errorPressed: ColorTokenDefault(named: "error-pressed", in: .module),
        errorContainerPressed: ColorTokenDefault(named: "error-container-pressed", in: .module),
        infoPressed: ColorTokenDefault(named: "info-pressed", in: .module),
        infoContainerPressed: ColorTokenDefault(named: "info-container-pressed", in: .module),
        neutralPressed: ColorTokenDefault(named: "neutral-pressed", in: .module),
        neutralContainerPressed: ColorTokenDefault(named: "neutral-container-pressed", in: .module),
        aiPressed: ColorTokenDefault(named: "ai-pressed", in: .module),
        aiContainerPressed: ColorTokenDefault(named: "ai-container-pressed", in: .module),
        focusPressed: ColorTokenDefault(named: "focus-pressed", in: .module),
        focusContainerPressed: ColorTokenDefault(named: "focus-container-pressed", in: .module),
        newPressed: ColorTokenDefault(named: "new-pressed", in: .module),
        newContainerPressed: ColorTokenDefault(named: "new-container-pressed", in: .module),
        businessPressed: ColorTokenDefault(named: "business-pressed", in: .module),
        businessContainerPressed: ColorTokenDefault(named: "business-container-pressed", in: .module),
        servicePressed: ColorTokenDefault(named: "service-pressed", in: .module),
        serviceContainerPressed: ColorTokenDefault(named: "service-container-pressed", in: .module)
    )

    let ai: any ColorsAI = ColorsAIDefault(
        ai: ColorTokenDefault(named: "ai", in: .module),
        onAI: ColorTokenDefault(named: "on-ai", in: .module),
        aiContainer: ColorTokenDefault(named: "ai-container", in: .module),
        onAIContainer: ColorTokenDefault(named: "on-ai-container", in: .module)
    )

    let focus: any ColorsFocus = ColorsFocusDefault(
        focus: ColorTokenDefault(named: "focus", in: .module),
        onFocus: ColorTokenDefault(named: "on-focus", in: .module),
        focusContainer: ColorTokenDefault(named: "focus-container", in: .module),
        onFocusContainer: ColorTokenDefault(named: "on-focus-container", in: .module)
    )

    let new: any ColorsNew = ColorsNewDefault(
        new: ColorTokenDefault(named: "new", in: .module),
        onNew: ColorTokenDefault(named: "on-new", in: .module),
        newContainer: ColorTokenDefault(named: "new-container", in: .module),
        onNewContainer: ColorTokenDefault(named: "on-new-container", in: .module)
    )

    let business: any ColorsBusiness = ColorsBusinessDefault(
        business: ColorTokenDefault(named: "business", in: .module),
        onBusiness: ColorTokenDefault(named: "on-business", in: .module),
        businessContainer: ColorTokenDefault(named: "business-container", in: .module),
        onBusinessContainer: ColorTokenDefault(named: "on-business-container", in: .module)
    )

    let service: any ColorsService = ColorsServiceDefault(
        service: ColorTokenDefault(named: "service", in: .module),
        onService: ColorTokenDefault(named: "on-service", in: .module),
        serviceContainer: ColorTokenDefault(named: "service-container", in: .module),
        onServiceContainer: ColorTokenDefault(named: "on-service-container", in: .module)
    )

    // MARK: - Initialization

    init() {}
}
