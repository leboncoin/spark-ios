//
//  String+LocalizedExtensionTests.swift
//  SparkComponentFileUploadTests
//
//  Created by robin.lemaire on 08/04/2026.
//  Copyright © 2026 Leboncoin. All rights reserved.
//

@testable import SparkComponentFileUpload
import Testing

@Suite("String Localized Extension Tests")
struct StringLocalizedExtensionTests {

    // MARK: - Tests

    // MARK: Button Localized Strings

    @Test("buttonFromPhotosApp returns non-empty string")
    func buttonFromPhotosAppReturnsNonEmptyString() {
        // WHEN
        let result = String.buttonFromPhotosApp

        // THEN
        #expect(!result.isEmpty)
    }

    @Test("buttonFromFilesApp returns non-empty string")
    func buttonFromFilesAppReturnsNonEmptyString() {
        // WHEN
        let result = String.buttonFromFilesApp

        // THEN
        #expect(!result.isEmpty)
    }

    @Test("buttonFromCamera returns non-empty string")
    func buttonFromCameraReturnsNonEmptyString() {
        // WHEN
        let result = String.buttonFromCamera

        // THEN
        #expect(!result.isEmpty)
    }

    // MARK: Preview Localized Strings

    @Test("previewAlertTitle returns non-empty string")
    func previewAlertTitleReturnsNonEmptyString() {
        // WHEN
        let result = String.previewAlertTitle

        // THEN
        #expect(!result.isEmpty)
    }

    @Test("previewAlertCancel returns non-empty string")
    func previewAlertCancelReturnsNonEmptyString() {
        // WHEN
        let result = String.previewAlertCancel

        // THEN
        #expect(!result.isEmpty)
    }

    @Test("previewAlertDelete returns non-empty string")
    func previewAlertDeleteReturnsNonEmptyString() {
        // WHEN
        let result = String.previewAlertDelete

        // THEN
        #expect(!result.isEmpty)
    }

    // MARK: Preview Alert Message Method

    @Test("previewAlertMessage returns formatted string with filename")
    func previewAlertMessageReturnsFormattedStringWithFilename() {
        // GIVEN
        let fileName = "test_file.pdf"

        // WHEN
        let result = String.previewAlertMessage(fileName: fileName)

        // THEN
        #expect(!result.isEmpty)
        #expect(result.contains(fileName))
    }

    @Test("previewAlertMessage handles empty filename")
    func previewAlertMessageHandlesEmptyFilename() {
        // GIVEN
        let fileName = ""

        // WHEN
        let result = String.previewAlertMessage(fileName: fileName)

        // THEN
        #expect(!result.isEmpty)
    }

    @Test("previewAlertMessage handles special characters in filename")
    func previewAlertMessageHandlesSpecialCharactersInFilename() {
        // GIVEN
        let fileName = "test@file#123.pdf"

        // WHEN
        let result = String.previewAlertMessage(fileName: fileName)

        // THEN
        #expect(!result.isEmpty)
        #expect(result.contains(fileName))
    }

    // MARK: Preview Remove Button Accessibility Label Method

    @Test("previewRemoveButtonAccessibilityLabel returns formatted string with filename")
    func previewRemoveButtonAccessibilityLabelReturnsFormattedStringWithFilename() {
        // GIVEN
        let fileName = "document.pdf"

        // WHEN
        let result = String.previewRemoveButtonAccessibilityLabel(fileName: fileName)

        // THEN
        #expect(!result.isEmpty)
        #expect(result.contains(fileName))
    }

    @Test("previewRemoveButtonAccessibilityLabel handles empty filename")
    func previewRemoveButtonAccessibilityLabelHandlesEmptyFilename() {
        // GIVEN
        let fileName = ""

        // WHEN
        let result = String.previewRemoveButtonAccessibilityLabel(fileName: fileName)

        // THEN
        #expect(!result.isEmpty)
    }

    @Test("previewRemoveButtonAccessibilityLabel handles special characters in filename")
    func previewRemoveButtonAccessibilityLabelHandlesSpecialCharactersInFilename() {
        // GIVEN
        let fileName = "file@#$%^.txt"

        // WHEN
        let result = String.previewRemoveButtonAccessibilityLabel(fileName: fileName)

        // THEN
        #expect(!result.isEmpty)
        #expect(result.contains(fileName))
    }

    @Test("previewRemoveButtonAccessibilityLabel handles unicode characters in filename")
    func previewRemoveButtonAccessibilityLabelHandlesUnicodeCharactersInFilename() {
        // GIVEN
        let fileName = "文件.pdf"

        // WHEN
        let result = String.previewRemoveButtonAccessibilityLabel(fileName: fileName)

        // THEN
        #expect(!result.isEmpty)
        #expect(result.contains(fileName))
    }

    // MARK: Preview View Button Accessibility Hint

    @Test("previewViewButtonAccessibilityHint returns non-empty string")
    func previewViewButtonAccessibilityHintReturnsNonEmptyString() {
        // WHEN
        let result = String.previewViewButtonAccessibilityHint

        // THEN
        #expect(!result.isEmpty)
    }

    @Test("previewViewButtonAccessibilityHint returns consistent value")
    func previewViewButtonAccessibilityHintReturnsConsistentValue() {
        // WHEN
        let result1 = String.previewViewButtonAccessibilityHint
        let result2 = String.previewViewButtonAccessibilityHint

        // THEN
        #expect(result1 == result2)
    }
}
