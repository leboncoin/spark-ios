//
//  ColorsServiceDefault.swift
//  SparkTheming
//
//  Created by robin.lemaire on 27/08/2026.
//  Copyright © 2026 Leboncoin. All rights reserved.
//

public struct ColorsServiceDefault: ColorsService {

    // MARK: - Properties

    public let service: any ColorToken
    public let onService: any ColorToken
    public let serviceContainer: any ColorToken
    public let onServiceContainer: any ColorToken

    // MARK: - Init

    public init(
        service: any ColorToken,
        onService: any ColorToken,
        serviceContainer: any ColorToken,
        onServiceContainer: any ColorToken
    ) {
        self.service = service
        self.onService = onService
        self.serviceContainer = serviceContainer
        self.onServiceContainer = onServiceContainer
    }
}
