//
//  ColorsBusinessDefault.swift
//  SparkTheming
//
//  Created by robin.lemaire on 27/08/2026.
//  Copyright © 2026 Leboncoin. All rights reserved.
//

public struct ColorsBusinessDefault: ColorsBusiness {

    // MARK: - Properties

    public let business: any ColorToken
    public let onBusiness: any ColorToken
    public let businessContainer: any ColorToken
    public let onBusinessContainer: any ColorToken

    // MARK: - Init

    public init(
        business: any ColorToken,
        onBusiness: any ColorToken,
        businessContainer: any ColorToken,
        onBusinessContainer: any ColorToken
    ) {
        self.business = business
        self.onBusiness = onBusiness
        self.businessContainer = businessContainer
        self.onBusinessContainer = onBusinessContainer
    }
}
