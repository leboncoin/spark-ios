//
//  Bundle+CurrentExtension.swift
//  SparkComponentFormField
//
//  Created by robin.lemaire on 07/05/2025.
//  Copyright © 2025 Leboncoin. All rights reserved.
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
