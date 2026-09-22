//
//  ColorsService.swift
//  SparkTheming
//
//  Created by robin.lemaire on 27/08/2026.
//  Copyright © 2026 Leboncoin. All rights reserved.
//

// sourcery: AutoMockable
public protocol ColorsService: Hashable, Equatable {
    var service: any ColorToken { get }
    var onService: any ColorToken { get }
    var serviceContainer: any ColorToken { get }
    var onServiceContainer: any ColorToken { get }
}

// MARK: - Hashable & Equatable

public extension ColorsService {

    func hash(into hasher: inout Hasher) {
        hasher.combine(self.service)
        hasher.combine(self.onService)
        hasher.combine(self.serviceContainer)
        hasher.combine(self.onServiceContainer)
    }

    func equals(_ other: any ColorsService) -> Bool {
        return self.service.equals(other.service) &&
        self.onService.equals(other.onService) &&
        self.serviceContainer.equals(other.serviceContainer) &&
        self.onServiceContainer.equals(other.onServiceContainer)
    }

    static func == (lhs: Self, rhs: Self) -> Bool {
        return lhs.equals(rhs)
    }
}
