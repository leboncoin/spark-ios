//
//  SkyColors.swift
//  Spark
//
//  Created by alex.vecherov on 05.06.23.
//  Copyright © 2023 Leboncoin. All rights reserved.
//

import UIKit
import SwiftUI

struct SkyColors: Colors {

    private class ClassForBundle {}

    var main: ColorsMain = ColorsMainDefault(
        main: ColorTokenDefault(named: "main", in: Bundle(for: ClassForBundle.self)),
        onMain: ColorTokenDefault(named: "on-main", in: Bundle(for: ClassForBundle.self)),
        mainVariant: ColorTokenDefault(named: "main-variant", in: Bundle(for: ClassForBundle.self)),
        onMainVariant: ColorTokenDefault(named: "on-main-variant", in: Bundle(for: ClassForBundle.self)),
        mainContainer: ColorTokenDefault(named: "main-container", in: Bundle(for: ClassForBundle.self)),
        onMainContainer: ColorTokenDefault(named: "on-main-container", in: Bundle(for: ClassForBundle.self)))

    let support: ColorsSupport = ColorsSupportDefault(
        support: ColorTokenDefault(named: "support", in: Bundle(for: ClassForBundle.self)),
        onSupport: ColorTokenDefault(named: "on-support", in: Bundle(for: ClassForBundle.self)),
        supportVariant: ColorTokenDefault(named: "support-variant", in: Bundle(for: ClassForBundle.self)),
        onSupportVariant: ColorTokenDefault(named: "on-support-variant", in: Bundle(for: ClassForBundle.self)),
        supportContainer: ColorTokenDefault(named: "support-container", in: Bundle(for: ClassForBundle.self)),
        onSupportContainer: ColorTokenDefault(named: "on-support-container", in: Bundle(for: ClassForBundle.self)))

    let accent: ColorsAccent = ColorsAccentDefault(
        accent: ColorTokenDefault(named: "accent", in: Bundle(for: ClassForBundle.self)),
        onAccent: ColorTokenDefault(named: "on-accent", in: Bundle(for: ClassForBundle.self)),
        accentVariant: ColorTokenDefault(named: "accent-variant", in: Bundle(for: ClassForBundle.self)),
        onAccentVariant: ColorTokenDefault(named: "on-accent-variant", in: Bundle(for: ClassForBundle.self)),
        accentContainer: ColorTokenDefault(named: "accent-container", in: Bundle(for: ClassForBundle.self)),
        onAccentContainer: ColorTokenDefault(named: "on-accent-container", in: Bundle(for: ClassForBundle.self)))

    let basic: ColorsBasic = ColorsBasicDefault(
        basic: ColorTokenDefault(named: "basic", in: Bundle(for: ClassForBundle.self)),
        onBasic: ColorTokenDefault(named: "on-basic", in: Bundle(for: ClassForBundle.self)),
        basicContainer: ColorTokenDefault(named: "basic-container", in: Bundle(for: ClassForBundle.self)),
        onBasicContainer: ColorTokenDefault(named: "on-basic-container", in: Bundle(for: ClassForBundle.self)))

    let base: ColorsBase = ColorsBaseDefault(
        background: ColorTokenDefault(named: "background", in: Bundle(for: ClassForBundle.self)),
        onBackground: ColorTokenDefault(named: "on-background", in: Bundle(for: ClassForBundle.self)),
        backgroundVariant: ColorTokenDefault(named: "background-variant", in: Bundle(for: ClassForBundle.self)),
        onBackgroundVariant: ColorTokenDefault(named: "on-background-variant", in: Bundle(for: ClassForBundle.self)),
        surface: ColorTokenDefault(named: "surface", in: Bundle(for: ClassForBundle.self)),
        onSurface: ColorTokenDefault(named: "on-surface", in: Bundle(for: ClassForBundle.self)),
        surfaceInverse: ColorTokenDefault(named: "surface-inverse", in: Bundle(for: ClassForBundle.self)),
        onSurfaceInverse: ColorTokenDefault(named: "on-surface-inverse", in: Bundle(for: ClassForBundle.self)),
        outline: ColorTokenDefault(named: "outline", in: Bundle(for: ClassForBundle.self)),
        outlineHigh: ColorTokenDefault(named: "outline-high", in: Bundle(for: ClassForBundle.self)),
        overlay: ColorTokenDefault(named: "overlay", in: Bundle(for: ClassForBundle.self)),
        onOverlay: ColorTokenDefault(named: "on-overlay", in: Bundle(for: ClassForBundle.self)))

    let feedback: ColorsFeedback = ColorsFeedbackDefault(
        success: ColorTokenDefault(named: "success", in: Bundle(for: ClassForBundle.self)),
        onSuccess: ColorTokenDefault(named: "on-success", in: Bundle(for: ClassForBundle.self)),
        successContainer: ColorTokenDefault(named: "success-container", in: Bundle(for: ClassForBundle.self)),
        onSuccessContainer: ColorTokenDefault(named: "on-success-container", in: Bundle(for: ClassForBundle.self)),
        alert: ColorTokenDefault(named: "alert", in: Bundle(for: ClassForBundle.self)),
        onAlert: ColorTokenDefault(named: "on-alert", in: Bundle(for: ClassForBundle.self)),
        alertContainer: ColorTokenDefault(named: "alert-container", in: Bundle(for: ClassForBundle.self)),
        onAlertContainer: ColorTokenDefault(named: "on-alert-container", in: Bundle(for: ClassForBundle.self)),
        error: ColorTokenDefault(named: "error", in: Bundle(for: ClassForBundle.self)),
        onError: ColorTokenDefault(named: "on-error", in: Bundle(for: ClassForBundle.self)),
        errorContainer: ColorTokenDefault(named: "error-container", in: Bundle(for: ClassForBundle.self)),
        onErrorContainer: ColorTokenDefault(named: "on-error-container", in: Bundle(for: ClassForBundle.self)),
        info: ColorTokenDefault(named: "info", in: Bundle(for: ClassForBundle.self)),
        onInfo: ColorTokenDefault(named: "on-info", in: Bundle(for: ClassForBundle.self)),
        infoContainer: ColorTokenDefault(named: "info-container", in: Bundle(for: ClassForBundle.self)),
        onInfoContainer: ColorTokenDefault(named: "on-info-container", in: Bundle(for: ClassForBundle.self)),
        neutral: ColorTokenDefault(named: "neutral", in: Bundle(for: ClassForBundle.self)),
        onNeutral: ColorTokenDefault(named: "on-neutral", in: Bundle(for: ClassForBundle.self)),
        neutralContainer: ColorTokenDefault(named: "neutral-container", in: Bundle(for: ClassForBundle.self)),
        onNeutralContainer: ColorTokenDefault(named: "on-neutral-container", in: Bundle(for: ClassForBundle.self))
    )

    let states: ColorsStates = ColorsStatesDefault(
        mainPressed: ColorTokenDefault(named: "main-pressed", in: Bundle(for: ClassForBundle.self)),
        mainVariantPressed: ColorTokenDefault(named: "main-variant-pressed", in: Bundle(for: ClassForBundle.self)),
        mainContainerPressed: ColorTokenDefault(named: "main-container-pressed", in: Bundle(for: ClassForBundle.self)),
        supportPressed: ColorTokenDefault(named: "support-pressed", in: Bundle(for: ClassForBundle.self)),
        supportVariantPressed: ColorTokenDefault(named: "support-variant-pressed", in: Bundle(for: ClassForBundle.self)),
        supportContainerPressed: ColorTokenDefault(named: "support-container-pressed", in: Bundle(for: ClassForBundle.self)),
        accentPressed: ColorTokenDefault(named: "accent-pressed", in: Bundle(for: ClassForBundle.self)),
        accentVariantPressed: ColorTokenDefault(named: "accent-variant-pressed", in: Bundle(for: ClassForBundle.self)),
        accentContainerPressed: ColorTokenDefault(named: "accent-container-pressed", in: Bundle(for: ClassForBundle.self)),
        basicPressed: ColorTokenDefault(named: "basic-pressed", in: Bundle(for: ClassForBundle.self)),
        basicContainerPressed: ColorTokenDefault(named: "basic-container-pressed", in: Bundle(for: ClassForBundle.self)),
        surfacePressed: ColorTokenDefault(named: "surface-pressed", in: Bundle(for: ClassForBundle.self)),
        surfaceInversePressed: ColorTokenDefault(named: "surface-inverse-pressed", in: Bundle(for: ClassForBundle.self)),
        successPressed: ColorTokenDefault(named: "success-pressed", in: Bundle(for: ClassForBundle.self)),
        successContainerPressed: ColorTokenDefault(named: "success-container-pressed", in: Bundle(for: ClassForBundle.self)),
        alertPressed: ColorTokenDefault(named: "alert-pressed", in: Bundle(for: ClassForBundle.self)),
        alertContainerPressed: ColorTokenDefault(named: "alert-container-pressed", in: Bundle(for: ClassForBundle.self)),
        errorPressed: ColorTokenDefault(named: "error-pressed", in: Bundle(for: ClassForBundle.self)),
        errorContainerPressed: ColorTokenDefault(named: "error-container-pressed", in: Bundle(for: ClassForBundle.self)),
        infoPressed: ColorTokenDefault(named: "info-pressed", in: Bundle(for: ClassForBundle.self)),
        infoContainerPressed: ColorTokenDefault(named: "info-container-pressed", in: Bundle(for: ClassForBundle.self)),
        neutralPressed: ColorTokenDefault(named: "neutral-pressed", in: Bundle(for: ClassForBundle.self)),
        neutralContainerPressed: ColorTokenDefault(named: "neutral-container-pressed", in: Bundle(for: ClassForBundle.self)))
}
