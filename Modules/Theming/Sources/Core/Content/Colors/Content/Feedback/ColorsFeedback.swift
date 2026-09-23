//
//  ColorsFeedback.swift
//  SparkTheming
//
//  Created by louis.borlee on 23/03/2023.
//  Copyright © 2023 Leboncoin. All rights reserved.
//

// sourcery: AutoMockable
public protocol ColorsFeedback: Hashable, Equatable {

    // MARK: - Success

    var success: any ColorToken { get }
    var onSuccess: any ColorToken { get }
    var successContainer: any ColorToken { get }
    var onSuccessContainer: any ColorToken { get }

    // MARK: - Alert

    var alert: any ColorToken { get }
    var onAlert: any ColorToken { get }
    var alertContainer: any ColorToken { get }
    var onAlertContainer: any ColorToken { get }

    // MARK: - Error

    var error: any ColorToken { get }
    var onError: any ColorToken { get }
    var errorContainer: any ColorToken { get }
    var onErrorContainer: any ColorToken { get }

    // MARK: - Info

    var info: any ColorToken { get }
    var onInfo: any ColorToken { get }
    var infoContainer: any ColorToken { get }
    var onInfoContainer: any ColorToken { get }

    // MARK: - Neutral

    var neutral: any ColorToken { get }
    var onNeutral: any ColorToken { get }
    var neutralContainer: any ColorToken { get }
    var onNeutralContainer: any ColorToken { get }
}

// MARK: - Hashable & Equatable

public extension ColorsFeedback {

    func hash(into hasher: inout Hasher) {
        hasher.combine(self.success)
        hasher.combine(self.onSuccess)
        hasher.combine(self.successContainer)
        hasher.combine(self.onSuccessContainer)

        hasher.combine(self.alert)
        hasher.combine(self.onAlert)
        hasher.combine(self.alertContainer)
        hasher.combine(self.onAlertContainer)

        hasher.combine(self.error)
        hasher.combine(self.onError)
        hasher.combine(self.errorContainer)
        hasher.combine(self.onErrorContainer)

        hasher.combine(self.info)
        hasher.combine(self.onInfo)
        hasher.combine(self.infoContainer)
        hasher.combine(self.onInfoContainer)

        hasher.combine(self.neutral)
        hasher.combine(self.onNeutral)
        hasher.combine(self.neutralContainer)
        hasher.combine(self.onNeutralContainer)
    }

    func equals(_ other: any ColorsFeedback) -> Bool {
        return self.success.equals(other.success) &&
        self.onSuccess.equals(other.onSuccess) &&
        self.successContainer.equals(other.successContainer) &&
        self.onSuccessContainer.equals(other.onSuccessContainer) &&

        self.alert.equals(other.alert) &&
        self.onAlert.equals(other.onAlert) &&
        self.alertContainer.equals(other.alertContainer) &&
        self.onAlertContainer.equals(other.onAlertContainer) &&

        self.error.equals(other.error) &&
        self.onError.equals(other.onError) &&
        self.errorContainer.equals(other.errorContainer) &&
        self.onErrorContainer.equals(other.onErrorContainer) &&

        self.info.equals(other.info) &&
        self.onInfo.equals(other.onInfo) &&
        self.infoContainer.equals(other.infoContainer) &&
        self.onInfoContainer.equals(other.onInfoContainer) &&

        self.neutral.equals(other.neutral) &&
        self.onNeutral.equals(other.onNeutral) &&
        self.neutralContainer.equals(other.neutralContainer) &&
        self.onNeutralContainer.equals(other.onNeutralContainer)
    }

    static func == (lhs: Self, rhs: Self) -> Bool {
        return lhs.equals(rhs)
    }
}

