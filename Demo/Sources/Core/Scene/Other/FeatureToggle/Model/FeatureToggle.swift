//
//  FeatureToggle.swift
//  SparkDemo
//
//  Created by robin.lemaire on 06/05/2026.
//  Copyright © 2026 Leboncoin. All rights reserved.
//

import Foundation

final class FeatureToggle: ObservableObject {

    // MARK: - Properties

    static let shared = FeatureToggle()

    @Published var appearance: Bool = false {
        didSet {
            SparkFeatureToggleService.shared.appearance = self.appearance
        }
    }

    @Published var rebranding: Bool = false {
        didSet {
            SparkFeatureToggleService.shared.rebranding = self.rebranding
        }
    }

    @Published var visualIdentification: Bool = false {
        didSet {
            SparkFeatureToggleService.shared.visualIdentification = self.visualIdentification
        }
    }
}
