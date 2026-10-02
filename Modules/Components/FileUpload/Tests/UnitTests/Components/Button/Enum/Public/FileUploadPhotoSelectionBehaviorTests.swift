//
//  FileUploadPhotoSelectionBehaviorTests.swift
//  SparkComponentFileUploadTests
//
//  Created by robin.lemaire on 24/03/2026.
//  Copyright © 2026 Leboncoin. All rights reserved.
//

import Foundation
@testable import SparkComponentFileUpload
import PhotosUI
import Testing

@Suite("FileUploadPhotoSelectionBehavior Tests")
struct FileUploadPhotoSelectionBehaviorTests {

    // MARK: - Tests

    @Test("All cases contains expected cases")
    func allCasesContainsExpectedCases() {
        // GIVEN
        let expectedCases: [FileUploadPhotoSelectionBehavior] = [
            .default,
            .ordered,
            .continuous,
            .continuousAndOrdered
        ]

        // WHEN / THEN
        #expect(FileUploadPhotoSelectionBehavior.allCases.count == expectedCases.count)
        #expect(Set(FileUploadPhotoSelectionBehavior.allCases) == Set(expectedCases))
    }

    // MARK: - pickerSelectionBehavior Tests

    @Test("Picker selection behavior is default when behavior is default")
    func pickerSelectionBehaviorIsDefaultWhenBehaviorIsDefault() {
        // GIVEN / WHEN
        let behavior = FileUploadPhotoSelectionBehavior.default

        // THEN
        #expect(behavior.pickerSelectionBehavior == .default)
    }

    @Test("Picker selection behavior is ordered when behavior is ordered")
    func pickerSelectionBehaviorIsOrderedWhenBehaviorIsOrdered() {
        // GIVEN / WHEN
        let behavior = FileUploadPhotoSelectionBehavior.ordered

        // THEN
        #expect(behavior.pickerSelectionBehavior == .ordered)
    }

    @Test("Picker selection behavior is continuous when behavior is continuous")
    func pickerSelectionBehaviorIsContinuousWhenBehaviorIsContinuous() {
        // GIVEN / WHEN
        let behavior = FileUploadPhotoSelectionBehavior.continuous

        // THEN
        #expect(behavior.pickerSelectionBehavior == .continuous)
    }

    @Test("Picker selection behavior is continuousAndOrdered when behavior is continuousAndOrdered")
    func pickerSelectionBehaviorIsContinuousAndOrderedWhenBehaviorIsContinuousAndOrdered() {
        // GIVEN / WHEN
        let behavior = FileUploadPhotoSelectionBehavior.continuousAndOrdered

        // THEN
        #expect(behavior.pickerSelectionBehavior == .continuousAndOrdered)
    }

    @Test("Picker selection behavior handles all cases without crashing")
    func pickerSelectionBehaviorHandlesAllCasesWithoutCrashing() {
        // GIVEN / WHEN / THEN
        for behavior in FileUploadPhotoSelectionBehavior.allCases {
            // Should not crash when accessing pickerSelectionBehavior
            _ = behavior.pickerSelectionBehavior
        }
    }
}
