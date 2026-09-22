//
//  ColorsStates.swift
//  SparkTheming
//
//  Created by louis.borlee on 23/03/2023.
//  Copyright © 2023 Leboncoin. All rights reserved.
//

// sourcery: AutoMockable
public protocol ColorsStates: Hashable, Equatable {

    // MARK: - Main

    var mainPressed: any ColorToken { get }
    var mainVariantPressed: any ColorToken { get }
    var mainContainerPressed: any ColorToken { get }

    // MARK: - Support

    var supportPressed: any ColorToken { get }
    var supportVariantPressed: any ColorToken { get }
    var supportContainerPressed: any ColorToken { get }

    // MARK: - Accent

    var accentPressed: any ColorToken { get }
    var accentVariantPressed: any ColorToken { get }
    var accentContainerPressed: any ColorToken { get }

    // MARK: - Base

    var surfacePressed: any ColorToken { get }
    var surfaceInversePressed: any ColorToken { get }
    var surfaceDarkPressed: any ColorToken { get }

    // MARK: - Feedback

    var successPressed: any ColorToken { get }
    var successContainerPressed: any ColorToken { get }
    var alertPressed: any ColorToken { get }
    var alertContainerPressed: any ColorToken { get }
    var errorPressed: any ColorToken { get }
    var errorContainerPressed: any ColorToken { get }
    var infoPressed: any ColorToken { get }
    var infoContainerPressed: any ColorToken { get }
    var neutralPressed: any ColorToken { get }
    var neutralContainerPressed: any ColorToken { get }

    // MARK: - AI

    var aiPressed: any ColorToken { get }
    var aiContainerPressed: any ColorToken { get }

    // MARK: - Focus

    var focusPressed: any ColorToken { get }
    var focusContainerPressed: any ColorToken { get }

    // MARK: - New

    var newPressed: any ColorToken { get }
    var newContainerPressed: any ColorToken { get }

    // MARK: - Business

    var businessPressed: any ColorToken { get }
    var businessContainerPressed: any ColorToken { get }

    // MARK: - Service

    var servicePressed: any ColorToken { get }
    var serviceContainerPressed: any ColorToken { get }
}

// MARK: - Hashable & Equatable

public extension ColorsStates {

    func hash(into hasher: inout Hasher) {
        hasher.combine(self.mainPressed)
        hasher.combine(self.mainVariantPressed)
        hasher.combine(self.mainContainerPressed)

        hasher.combine(self.supportPressed)
        hasher.combine(self.supportVariantPressed)
        hasher.combine(self.supportContainerPressed)

        hasher.combine(self.accentPressed)
        hasher.combine(self.accentVariantPressed)
        hasher.combine(self.accentContainerPressed)

        hasher.combine(self.surfacePressed)
        hasher.combine(self.surfaceInversePressed)
        hasher.combine(self.surfaceDarkPressed)
        hasher.combine(self.successPressed)
        hasher.combine(self.successContainerPressed)
        hasher.combine(self.alertPressed)
        hasher.combine(self.alertContainerPressed)
        hasher.combine(self.errorPressed)
        hasher.combine(self.errorContainerPressed)
        hasher.combine(self.infoPressed)
        hasher.combine(self.infoContainerPressed)
        hasher.combine(self.neutralPressed)
        hasher.combine(self.neutralContainerPressed)
        hasher.combine(self.aiPressed)
        hasher.combine(self.aiContainerPressed)
        hasher.combine(self.focusPressed)
        hasher.combine(self.focusContainerPressed)
        hasher.combine(self.newPressed)
        hasher.combine(self.newContainerPressed)
        hasher.combine(self.businessPressed)
        hasher.combine(self.businessContainerPressed)
        hasher.combine(self.servicePressed)
        hasher.combine(self.serviceContainerPressed)
    }

    func equals(_ other: any ColorsStates) -> Bool {
        return self.mainPressed.equals(other.mainPressed) &&
        self.mainVariantPressed.equals(other.mainVariantPressed) &&
        self.mainContainerPressed.equals(other.mainContainerPressed) &&

        self.supportPressed.equals(other.supportPressed) &&
        self.supportVariantPressed.equals(other.supportVariantPressed) &&
        self.supportContainerPressed.equals(other.supportContainerPressed) &&

        self.accentPressed.equals(other.accentPressed) &&
        self.accentVariantPressed.equals(other.accentVariantPressed) &&
        self.accentContainerPressed.equals(other.accentContainerPressed) &&

        self.surfacePressed.equals(other.surfacePressed) &&
        self.surfaceInversePressed.equals(other.surfaceInversePressed) &&
        self.surfaceDarkPressed.equals(other.surfaceDarkPressed) &&
        self.successPressed.equals(other.successPressed) &&
        self.successContainerPressed.equals(other.successContainerPressed) &&
        self.alertPressed.equals(other.alertPressed) &&
        self.alertContainerPressed.equals(other.alertContainerPressed) &&
        self.errorPressed.equals(other.errorPressed) &&
        self.errorContainerPressed.equals(other.errorContainerPressed) &&
        self.infoPressed.equals(other.infoPressed) &&
        self.infoContainerPressed.equals(other.infoContainerPressed) &&
        self.neutralPressed.equals(other.neutralPressed) &&
        self.neutralContainerPressed.equals(other.neutralContainerPressed) &&
        self.aiPressed.equals(other.aiPressed) &&
        self.aiContainerPressed.equals(other.aiContainerPressed) &&
        self.focusPressed.equals(other.focusPressed) &&
        self.focusContainerPressed.equals(other.focusContainerPressed) &&
        self.newPressed.equals(other.newPressed) &&
        self.newContainerPressed.equals(other.newContainerPressed) &&
        self.businessPressed.equals(other.businessPressed) &&
        self.businessContainerPressed.equals(other.businessContainerPressed) &&
        self.servicePressed.equals(other.servicePressed) &&
        self.serviceContainerPressed.equals(other.serviceContainerPressed)
    }

    static func == (lhs: Self, rhs: Self) -> Bool {
        return lhs.equals(rhs)
    }
}

