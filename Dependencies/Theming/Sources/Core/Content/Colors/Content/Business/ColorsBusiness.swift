//
//  ColorsBusiness.swift
//  SparkTheming
//
//  Created by robin.lemaire on 27/08/2026.
//  Copyright © 2026 Leboncoin. All rights reserved.
//

// sourcery: AutoMockable
public protocol ColorsBusiness: Hashable, Equatable {
    var business: any ColorToken { get }
    var onBusiness: any ColorToken { get }
    var businessContainer: any ColorToken { get }
    var onBusinessContainer: any ColorToken { get }
}

// MARK: - Hashable & Equatable

public extension ColorsBusiness {

    func hash(into hasher: inout Hasher) {
        hasher.combine(self.business)
        hasher.combine(self.onBusiness)
        hasher.combine(self.businessContainer)
        hasher.combine(self.onBusinessContainer)
    }

    func equals(_ other: any ColorsBusiness) -> Bool {
        return self.business.equals(other.business) &&
        self.onBusiness.equals(other.onBusiness) &&
        self.businessContainer.equals(other.businessContainer) &&
        self.onBusinessContainer.equals(other.onBusinessContainer)
    }

    static func == (lhs: Self, rhs: Self) -> Bool {
        return lhs.equals(rhs)
    }
}
