//
//  AvatarGetBorderUseCaseTests.swift
//  SparkComponentAvatarTests
//
//  Created by robin.lemaire on 02/07/2026.
//  Copyright © 2026 Leboncoin. All rights reserved.
//

import Testing
@testable import SparkComponentAvatar
@_spi(SI_SPI) import SparkTheming
@_spi(SI_SPI) import SparkThemingTesting

// MARK: - Tests

struct AvatarGetBorderUseCaseTests {

    // MARK: - Properties

    private let sut = AvatarGetBorderUseCase()
    private let theme = ThemeGeneratedMock.mocked()

    // MARK: - Tests

    @Test(
        arguments: [
            (AvatarSize.xs, AvatarContentType.user),
            (.sm, .user),
            (.md, .user)
        ]
    )
    func executeWithSmallSizeUserContentTypeAndBorderShouldReturnExpectedBorder(size: AvatarSize, contentType: AvatarContentType) {
        // WHEN
        let result = self.sut.execute(
            theme: self.theme,
            isBorder: true,
            size: size,
            contentType: contentType
        )

        let expectedBorder = AvatarBorder(
            radius: self.theme.border.radius.full,
            width: self.theme.border.width.small
        )

        // THEN
        #expect(result == expectedBorder)
    }

    @Test(
        arguments: [
            (AvatarSize.lg, AvatarContentType.user),
            (.xl, .user),
            (.xxl, .user),
            (.xxxl, .user)
        ]
    )
    func executeWithLargeSizeUserContentTypeAndBorderShouldReturnExpectedBorder(size: AvatarSize, contentType: AvatarContentType) {
        // WHEN
        let result = self.sut.execute(
            theme: self.theme,
            isBorder: true,
            size: size,
            contentType: contentType
        )

        let expectedBorder = AvatarBorder(
            radius: self.theme.border.radius.full,
            width: self.theme.border.width.medium
        )

        // THEN
        #expect(result == expectedBorder)
    }

    @Test(
        arguments: [
            (AvatarSize.xs, AvatarContentType.company),
            (.sm, .company),
            (.md, .company)
        ]
    )
    func executeWithSmallSizeCompanyContentTypeAndBorderShouldReturnExpectedBorder(size: AvatarSize, contentType: AvatarContentType) {
        // WHEN
        let result = self.sut.execute(
            theme: self.theme,
            isBorder: true,
            size: size,
            contentType: contentType
        )

        let expectedBorder = AvatarBorder(
            radius: self.theme.border.radius.medium,
            width: self.theme.border.width.small
        )

        // THEN
        #expect(result == expectedBorder)
    }

    @Test(
        arguments: [
            (AvatarSize.lg, AvatarContentType.company),
            (.xl, .company),
            (.xxl, .company),
            (.xxxl, .company)
        ]
    )
    func executeWithLargeSizeCompanyContentTypeAndBorderShouldReturnExpectedBorder(size: AvatarSize, contentType: AvatarContentType) {
        // WHEN
        let result = self.sut.execute(
            theme: self.theme,
            isBorder: true,
            size: size,
            contentType: contentType
        )

        let expectedBorder = AvatarBorder(
            radius: self.theme.border.radius.medium,
            width: self.theme.border.width.medium
        )

        // THEN
        #expect(result == expectedBorder)
    }

    @Test(
        arguments: [
            (AvatarSize.xs, AvatarContentType.user),
            (.sm, .user),
            (.md, .user),
            (.lg, .user),
            (.xl, .user),
            (.xxl, .user),
            (.xxxl, .user)
        ]
    )
    func executeWithUserContentTypeAndNoBorderShouldReturnExpectedBorder(size: AvatarSize, contentType: AvatarContentType) {
        // WHEN
        let result = self.sut.execute(
            theme: self.theme,
            isBorder: false,
            size: size,
            contentType: contentType
        )

        let expectedBorder = AvatarBorder(
            radius: self.theme.border.radius.full,
            width: self.theme.border.width.none
        )

        // THEN
        #expect(result == expectedBorder)
    }

    @Test(
        arguments: [
            (AvatarSize.xs, AvatarContentType.company),
            (.sm, .company),
            (.md, .company),
            (.lg, .company),
            (.xl, .company),
            (.xxl, .company),
            (.xxxl, .company)
        ]
    )
    func executeWithCompanyContentTypeAndNoBorderShouldReturnExpectedBorder(size: AvatarSize, contentType: AvatarContentType) {
        // WHEN
        let result = self.sut.execute(
            theme: self.theme,
            isBorder: false,
            size: size,
            contentType: contentType
        )

        let expectedBorder = AvatarBorder(
            radius: self.theme.border.radius.medium,
            width: self.theme.border.width.none
        )

        // THEN
        #expect(result == expectedBorder)
    }
}
