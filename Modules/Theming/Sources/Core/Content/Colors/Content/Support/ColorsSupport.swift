//
//  ColorsSupport.swift
//  SparkTheming
//
//  Created by louis.borlee on 23/03/2023.
//  Copyright © 2023 Leboncoin. All rights reserved.
//

// sourcery: AutoMockable
public protocol ColorsSupport: Hashable, Equatable {
    var support: any ColorToken { get }
    var onSupport: any ColorToken { get }
    var supportVariant: any ColorToken { get }
    var onSupportVariant: any ColorToken { get }
    var supportContainer: any ColorToken { get }
    var onSupportContainer: any ColorToken { get }
}

// MARK: - Hashable & Equatable

public extension ColorsSupport {

    func hash(into hasher: inout Hasher) {
        hasher.combine(self.support)
        hasher.combine(self.onSupport)
        hasher.combine(self.supportVariant)
        hasher.combine(self.onSupportVariant)
        hasher.combine(self.supportContainer)
        hasher.combine(self.onSupportContainer)
    }

    func equals(_ other: any ColorsSupport) -> Bool {
        return self.support.equals(other.support) &&
        self.onSupport.equals(other.onSupport) &&
        self.supportVariant.equals(other.supportVariant) &&
        self.onSupportVariant.equals(other.onSupportVariant) &&
        self.supportContainer.equals(other.supportContainer) &&
        self.onSupportContainer.equals(other.onSupportContainer)
    }

    static func == (lhs: Self, rhs: Self) -> Bool {
        return lhs.equals(rhs)
    }
}

