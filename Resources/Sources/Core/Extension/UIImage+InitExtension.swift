//
//  UIImage+InitExtension.swift
//  SparkResources
//
//  Created by robin.lemaire on 17/09/2026.
//  Copyright © 2026 Leboncoin. All rights reserved.
//

import UIKit

public extension UIImage {

    /// Creates an image for the given Spark icon.
    ///
    /// - Parameter path: The key path to the icon on ``ImageResource/Spark``.
    convenience init(spark path: KeyPath<ImageResource.Spark.Type, ImageResource>) {
        self.init(resource: ImageResource.Spark.self[keyPath: path])
    }

    /// Creates an image for the given Spark criteria icon.
    ///
    /// - Parameter path: The key path to the icon on ``ImageResource/SparkCriteria``.
    convenience init(sparkCriteria path: KeyPath<ImageResource.SparkCriteria.Type, ImageResource>) {
        self.init(resource: ImageResource.SparkCriteria.self[keyPath: path])
    }
}
