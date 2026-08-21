//
//  Bundle+CurrentExtension.swift
//  Resources
//
//  Created by robin.lemaire on 10/02/2026.
//  Copyright © 2026 Leboncoin. All rights reserved.
//

import Foundation

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
