//
//  URL+MockExtension.swift
//  SparkComponentAvatar
//
//  Created by robin.lemaire on 23/07/2026.
//  Copyright © 2026 Leboncoin. All rights reserved.
//

import Foundation
import Testing

extension URL {

    static var mock: URL {
        get {
            do {
                return try #require(.init(string: "https://apple.com/"))
            } catch {
                fatalError("URL must be setted")
            }
        }
    }
}
