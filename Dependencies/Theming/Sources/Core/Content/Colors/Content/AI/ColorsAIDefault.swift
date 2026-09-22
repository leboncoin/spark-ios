//
//  ColorsAIDefault.swift
//  SparkTheming
//
//  Created by robin.lemaire on 02/06/2026.
//  Copyright © 2023 Leboncoin. All rights reserved.
//

public struct ColorsAIDefault: ColorsAI {

    // MARK: - Properties

    public let ai: any ColorToken
    public let onAI: any ColorToken
    public let aiContainer: any ColorToken
    public let onAIContainer: any ColorToken

    // MARK: - Init

    public init(
        ai: any ColorToken,
        onAI: any ColorToken,
        aiContainer: any ColorToken,
        onAIContainer: any ColorToken
    ) {
        self.ai = ai
        self.onAI = onAI
        self.aiContainer = aiContainer
        self.onAIContainer = onAIContainer
    }
}
