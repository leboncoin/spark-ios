//
//  ButtonGetSizesUseCase.swift
//  SparkComponentButton
//
//  Created by robin.lemaire on 10/03/2026.
//  Copyright © 2026 Leboncoin. All rights reserved.
//

import Foundation

// sourcery: AutoMockable, AutoMockTest
protocol ButtonGetSizesUseCaseable {
    func execute(
        size: ButtonSize,
        type: ButtonType,
        contentVisibility: ButtonContentVisibility,
        removeStyles: Bool,
        isLoading: Bool
    ) -> ButtonSizes
}

struct ButtonGetSizesUseCase: ButtonGetSizesUseCaseable {

    // MARK: - Constants

    private enum Constants {
        enum Height {
            static var small: CGFloat = 32
            static var medium: CGFloat = 44
            static var large: CGFloat = 56
        }

        enum ImageSize {
            static var medium: CGFloat = 16
            static var large: CGFloat = 24
        }
    }

    // MARK: - Methods

    func execute(
        size: ButtonSize,
        type: ButtonType,
        contentVisibility: ButtonContentVisibility,
        removeStyles: Bool,
        isLoading: Bool
    ) -> ButtonSizes {
        let contentSize: CGFloat
        switch size {
        case .small:
            contentSize = Constants.Height.small
        case .medium:
            contentSize = Constants.Height.medium
        case .large:
            contentSize = Constants.Height.large
        }

        // The value is differente only when there is only an image and the size is large
        let imageSize: CGFloat = (type == .iconButton && size == .large) ? Constants.ImageSize.large : Constants.ImageSize.medium

        // Component has a fix width (means component is an icon button)
        let isFixedWidth = type == .iconButton || (!contentVisibility.showLabel && !isLoading)

        // No style means also no fixed height
        let isFixedHeight = !removeStyles
        let maxHeight: CGFloat? = removeStyles ? .infinity : nil

        return .init(
            height: contentSize,
            width: contentSize,
            isFixedHeight: isFixedHeight,
            isFixedWidth: isFixedWidth,
            maxHeight: maxHeight,
            imageSize: imageSize
        )
    }
}
