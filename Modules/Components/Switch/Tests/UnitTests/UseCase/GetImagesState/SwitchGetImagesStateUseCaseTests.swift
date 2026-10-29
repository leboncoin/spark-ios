//
//  SwitchGetImagesStateUseCaseTests.swift
//  SparkComponentSwitchTests
//
//  Created by robin.lemaire on 12/09/2023.
//  Copyright © 2023 Leboncoin. All rights reserved.
//

import Testing
import SwiftUI
@testable import SparkComponentSwitch
@_spi(SI_SPI) import SparkCommon
@_spi(SI_SPI) import SparkCommonTesting

@MainActor
@Suite("Switch Get Images State UseCase Tests")
final class SwitchGetImagesStateUseCaseTests {

    // MARK: - SwiftUI Properties

    private let onImageMock = Image("switchOn")
    private let offImageMock = Image("switchOff")

    private lazy var imagesMock: SwitchImagesEither = {
        return .right(
            .init(
                on: self.onImageMock,
                off: self.offImageMock
            )
        )
    }()

    // MARK: - UIKit Properties

    private let onUIImageMock = IconographyTests.shared.switchOn
    private let offUIImageMock = IconographyTests.shared.switchOff

    private lazy var uiImagesMock: SwitchImagesEither = {
        return .left(
            .init(
                on: self.onUIImageMock,
                off: self.offUIImageMock
            )
        )
    }()

    // MARK: - UIKit Images Tests

    @Test("Execute when is on is true and is UI kit images")
    func executeWhenIsOnIsTrueAndIsUIKitImages() throws {
        try self.testExecute(
            givenIsOn: true,
            givenImages: self.uiImagesMock,
            givenIsSwiftUIVersion: false,
            expectedImage: .left(self.onUIImageMock)
        )
    }

    @Test("Execute when is on is false and is UI kit images")
    func executeWhenIsOnIsFalseAndIsUIKitImages() throws {
        try self.testExecute(
            givenIsOn: false,
            givenImages: self.uiImagesMock,
            givenIsSwiftUIVersion: false,
            expectedImage: .left(self.offUIImageMock)
        )
    }

    // MARK: - Swift Images Tests

    @Test("Execute when is on is true and is swift UI images")
    func executeWhenIsOnIsTrueAndIsSwiftUIImages() throws {
        try self.testExecute(
            givenIsOn: true,
            givenImages: self.imagesMock,
            givenIsSwiftUIVersion: true,
            expectedImage: .right(self.onImageMock)
        )
    }

    @Test("Execute when is on is false and is swift UI images")
    func executeWhenIsOnIsFalseAndIsSwiftUIImages() throws {
        try self.testExecute(
            givenIsOn: false,
            givenImages: self.imagesMock,
            givenIsSwiftUIVersion: true,
            expectedImage: .right(self.offImageMock)
        )
    }
}

// MARK: - Execute Testing

private extension SwitchGetImagesStateUseCaseTests {

    func testExecute(
        givenIsOn: Bool,
        givenImages: SwitchImagesEither,
        givenIsSwiftUIVersion: Bool,
        expectedImage: ImageEither
    ) throws {
        // GIVEN
        let errorPrefixMessage = " for \(givenIsOn) isOn"

        let useCase = SwitchGetImagesStateUseCase()

        // WHEN
        let imageState = useCase.execute(
            isOn: givenIsOn,
            images: givenImages
        )

        // THEN
        if givenIsSwiftUIVersion {
            if givenIsOn {
                #expect(
                    imageState.currentImage.rightValue == givenImages.rightValue.on,
                    "Wrong on image\(errorPrefixMessage)"
                )
            } else {
                #expect(
                    imageState.currentImage.rightValue == givenImages.rightValue.off,
                    "Wrong off image\(errorPrefixMessage)"
                )
            }
        } else {
            if givenIsOn {
                #expect(
                    imageState.currentImage.leftValue == givenImages.leftValue.on,
                    "Wrong on UIImage\(errorPrefixMessage)"
                )
            } else {
                #expect(
                    imageState.currentImage.leftValue == givenImages.leftValue.off,
                    "Wrong off UIImage\(errorPrefixMessage)"
                )
            }
        }

        #expect(
            imageState.images == givenImages,
            "Wrong on images\(errorPrefixMessage)"
        )

        #expect(
            imageState.onImageOpacity == (givenIsOn ? 1 : 0),
            "Wrong on onImageOpacity\(errorPrefixMessage)"
        )
        #expect(
            imageState.offImageOpacity == (givenIsOn ? 0 : 1),
            "Wrong on images\(errorPrefixMessage)"
        )
    }
}
