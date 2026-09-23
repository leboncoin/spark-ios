//
//  ColorsAI.swift
//  SparkTheming
//
//  Created by robin.lemaire on 02/06/2026.
//  Copyright © 2023 Leboncoin. All rights reserved.
//

// sourcery: AutoMockable
public protocol ColorsAI: Hashable, Equatable {
    var ai: any ColorToken { get }
    var onAI: any ColorToken { get }
    var aiContainer: any ColorToken { get }
    var onAIContainer: any ColorToken { get }
}

// MARK: - Hashable & Equatable

public extension ColorsAI {

    func hash(into hasher: inout Hasher) {
        hasher.combine(self.ai)
        hasher.combine(self.onAI)
        hasher.combine(self.aiContainer)
        hasher.combine(self.onAIContainer)
    }

    func equals(_ other: any ColorsAI) -> Bool {
        return self.ai.equals(other.ai) &&
        self.onAI.equals(other.onAI) &&
        self.aiContainer.equals(other.aiContainer) &&
        self.onAIContainer.equals(other.onAIContainer)
    }

    static func == (lhs: Self, rhs: Self) -> Bool {
        return lhs.equals(rhs)
    }
}
