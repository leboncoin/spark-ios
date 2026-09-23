//
//  ColorsNewDefault.swift
//  SparkTheming
//
//  Created by robin.lemaire on 27/08/2026.
//  Copyright © 2026 Leboncoin. All rights reserved.
//

public struct ColorsNewDefault: ColorsNew {

    // MARK: - Properties

    public let new: any ColorToken
    public let onNew: any ColorToken
    public let newContainer: any ColorToken
    public let onNewContainer: any ColorToken

    // MARK: - Init

    public init(
        new: any ColorToken,
        onNew: any ColorToken,
        newContainer: any ColorToken,
        onNewContainer: any ColorToken
    ) {
        self.new = new
        self.onNew = onNew
        self.newContainer = newContainer
        self.onNewContainer = onNewContainer
    }
}
