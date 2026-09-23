//
//  TabUISegment.swift
//  SparkComponentSelectionControls
//
//  Created by robin.lemaire on 24/02/2026.
//  Copyright © 2026 Leboncoin. All rights reserved.
//

import UIKit

/// A simple struct for defining segment using in ``SparkUITab``.
public struct TabUISegment {

    // MARK: - Properties

    /// The title of the segment.
    internal let title: String?

    /// The attributed title of the segment.
    internal let attributedTitle: NSAttributedString?

    /// The image of the segment.
    internal let image: UIImage?

    // MARK: - Public Initialization

    /// Creates a tab segment from an attributed title and an image.
    ///
    /// - Parameters:
    ///  - title: The title for the segment, that describes the purpose of the segment.
    ///  - image: The image of the segment.
    public init(
        title: String,
        image: UIImage
    ) {
        self.title = title
        self.attributedTitle = nil
        self.image = image
    }

    /// Creates a tab segment from an attributed title and an image.
    ///
    /// - Parameters:
    ///  - attributedTitle: The attributed title for the segment, that describes the purpose of the segment.
    ///  - image: The image of the segment.
    public init(
        attributedTitle: NSAttributedString,
        image: UIImage
    ) {
        self.title = nil
        self.attributedTitle = attributedTitle
        self.image = image
    }

    // MARK: - Internal Initialization

    init(image: UIImage) {
        self.title = nil
        self.attributedTitle = nil
        self.image = image
    }

    init(
        title: String,
        image: UIImage? = nil
    ) {
        self.title = title
        self.attributedTitle = nil
        self.image = image
    }

    init(
        attributedTitle: NSAttributedString,
        image: UIImage? = nil
    ) {
        self.title = nil
        self.attributedTitle = attributedTitle
        self.image = image
    }
}
