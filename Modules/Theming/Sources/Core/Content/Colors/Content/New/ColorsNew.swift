//
//  ColorsNew.swift
//  SparkTheming
//
//  Created by robin.lemaire on 27/08/2026.
//  Copyright © 2026 Leboncoin. All rights reserved.
//

// sourcery: AutoMockable
public protocol ColorsNew: Hashable, Equatable {
    var new: any ColorToken { get }
    var onNew: any ColorToken { get }
    var newContainer: any ColorToken { get }
    var onNewContainer: any ColorToken { get }
}

// MARK: - Hashable & Equatable

public extension ColorsNew {

    func hash(into hasher: inout Hasher) {
        hasher.combine(self.new)
        hasher.combine(self.onNew)
        hasher.combine(self.newContainer)
        hasher.combine(self.onNewContainer)
    }

    func equals(_ other: any ColorsNew) -> Bool {
        return self.new.equals(other.new) &&
        self.onNew.equals(other.onNew) &&
        self.newContainer.equals(other.newContainer) &&
        self.onNewContainer.equals(other.onNewContainer)
    }

    static func == (lhs: Self, rhs: Self) -> Bool {
        return lhs.equals(rhs)
    }
}
