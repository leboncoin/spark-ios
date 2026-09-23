//
//  ColorsMain.swift
//  SparkTheming
//
//  Created by louis.borlee on 23/03/2023.
//  Copyright © 2023 Leboncoin. All rights reserved.
//

// sourcery: AutoMockable
public protocol ColorsMain: Hashable, Equatable {
    var main: any ColorToken { get }
    var onMain: any ColorToken { get }
    var mainVariant: any ColorToken { get }
    var onMainVariant: any ColorToken { get }
    var mainContainer: any ColorToken { get }
    var onMainContainer: any ColorToken { get }
}

// MARK: - Hashable & Equatable

public extension ColorsMain {

    func hash(into hasher: inout Hasher) {
        hasher.combine(self.main)
        hasher.combine(self.onMain)
        hasher.combine(self.mainVariant)
        hasher.combine(self.onMainVariant)
        hasher.combine(self.mainContainer)
        hasher.combine(self.onMainContainer)
    }

    func equals(_ other: any ColorsMain) -> Bool {
        return self.main.equals(other.main) &&
        self.onMain.equals(other.onMain) &&
        self.mainVariant.equals(other.mainVariant) &&
        self.onMainVariant.equals(other.onMainVariant) &&
        self.mainContainer.equals(other.mainContainer) &&
        self.onMainContainer.equals(other.onMainContainer)
    }

    static func == (lhs: Self, rhs: Self) -> Bool {
        return lhs.equals(rhs)
    }
}

