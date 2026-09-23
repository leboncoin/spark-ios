//
//  Image+InitExtension.swift
//  SparkResources
//
//  Created by robin.lemaire on 17/09/2026.
//  Copyright © 2026 Leboncoin. All rights reserved.
//

import SwiftUI

public extension Image {

    /// Creates an image for the given Spark icon.
    ///
    /// - Parameter path: The key path to the icon on ``ImageResource/Spark``.
    init(spark path: KeyPath<ImageResource.Spark.Type, ImageResource>) {
        self.init(ImageResource.Spark.self[keyPath: path])
    }

    /// Creates an image for the given Spark criteria icon.
    ///
    /// - Parameter path: The key path to the icon on ``ImageResource/SparkCriteria``.
    init(sparkCriteria path: KeyPath<ImageResource.SparkCriteria.Type, ImageResource>) {
        self.init(ImageResource.SparkCriteria.self[keyPath: path])
    }
}
