//
//  Bundle+CurrentExtension.swift
//  SparkComponentRating
//
//  Created by robin.lemaire on 09/01/2026.
//  Copyright © 2026 Leboncoin. All rights reserved.
//

import Foundation
import SparkTheming

extension Bundle {

    // MARK: - Class

    private final class Class {}

    // MARK: - Static Properties

    static var current: Bundle {
#if SWIFT_PACKAGE
        Bundle.module
#else
        Bundle(for: Class.self)
#endif
    }
}
