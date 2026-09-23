//
//  Bundle+Extension.swift
//  SparkTheme
//
//  Created by robin.lemaire on 02/03/2023.
//  Copyright © 2023 Leboncoin. All rights reserved.
//

import Foundation
import UIKit

extension Bundle {

    // MARK: - Constants

    private enum Constants {
        static let fontExtensions = ["ttf", "otf"]
    }

    // MARK: - Fonts

    /// Register all bundle fonts  (.ttf or .otf) to be used by Spark
    static func registerAllFonts() {
        // Get URLs
        let fontURLs = Constants.fontExtensions.compactMap { fontExtension in
            return Bundle.module.urls(forResourcesWithExtension: fontExtension, subdirectory: nil)
        }
        .flatMap {
            $0
        }
        .map {
            $0 as CFURL
        }

        guard !fontURLs.isEmpty else {
            fatalError("No font files found in the resource folder in the [SparkTheme] SPM")
        }

        // Try to register all customs fonts
        fontURLs.forEach {
            guard let fontDataProvider = CGDataProvider(url: $0) else {
                fatalError("Bad Font Data Provider in the resource folder in the [SparkTheme] SPM")
            }

            guard let font = CGFont(fontDataProvider) else {
                fatalError("CGFont conversion failed in the resource folder in the [SparkTheme] SPM")
            }

            var error: Unmanaged<CFError>?
            CTFontManagerRegisterGraphicsFont(font, &error)
        }
    }
}
