//
//  FileUploadButtonViewModelTests.swift
//  SparkComponentFileUploadTests
//
//  Created by robin.lemaire on 24/03/2026.
//  Copyright © 2026 Leboncoin. All rights reserved.
//

import Foundation
import SwiftUI
import Combine
import PhotosUI
import UniformTypeIdentifiers

@testable import SparkComponentFileUpload
@_spi(SI_SPI) @testable import SparkComponentFileUploadTesting
import Testing

@Suite("FileUploadButton ViewModel Tests")
struct FileUploadButtonViewModelTests {

    // MARK: - Initialization

    @Test("Initialization should use default values")
    func initializationShouldUseDefaultValues() {
        // GIVEN / WHEN
        let stub = Stub()
        let viewModel = stub.viewModel

        // THEN
        #expect(viewModel.photoTypes == nil)
        #expect(viewModel.fileTypes == nil)

        expectEqualToExpected(
            on: stub,
            otherContentType: .default
        )

        expectNotCalled(
            on: stub,
            getContentTypeUseCase: true
        )
    }

    @Test("Initialization with all use cases should inject dependencies")
    func initializationWithAllUseCasesShouldInjectDependencies() {
        // GIVEN / WHEN
        let stub = Stub()
        let viewModel = stub.viewModel

        // THEN
        #expect(viewModel.photoTypes == nil)
        #expect(viewModel.fileTypes == nil)
        #expect(viewModel.contentType == .default)
    }

    // MARK: - Setup

    @Test("Setup should call use case")
    func setupShouldCallUseCase() {
        // GIVEN
        let stub = Stub()
        let viewModel = stub.viewModel

        // WHEN
        viewModel.setup(stub: stub)

        // THEN
        expectEqualToExpected(on: stub)

        FileUploadButtonGetContentTypeUseCaseableMockTest.expect(
            stub.getContentTypeUseCaseMock,
            expectedNumberOfCalls: 1,
            givenPhotoTypes: stub.givenPhotoTypes,
            givenFileTypes: stub.givenFileTypes,
            expectedReturnValue: stub.expectedContentType
        )
    }

    // MARK: - Property Changes

    @Test("PhotoTypes when changed should call use case")
    func photoTypesWhenChangedShouldCallUseCase() {
        // GIVEN
        let stub = Stub()
        let viewModel = stub.viewModel
        viewModel.setup(stub: stub)

        stub.resetMockedData()

        let newPhotoTypes: [PHPickerFilter] = [.livePhotos]

        // WHEN
        viewModel.photoTypes = newPhotoTypes

        // THEN
        expectEqualToExpected(on: stub)

        FileUploadButtonGetContentTypeUseCaseableMockTest.expect(
            stub.getContentTypeUseCaseMock,
            expectedNumberOfCalls: 1,
            givenPhotoTypes: newPhotoTypes,
            givenFileTypes: stub.givenFileTypes,
            expectedReturnValue: stub.expectedContentType
        )
    }

    @Test("FileTypes when changed should call use case")
    func fileTypesWhenChangedShouldCallUseCase() {
        // GIVEN
        let stub = Stub()
        let viewModel = stub.viewModel
        viewModel.setup(stub: stub)

        stub.resetMockedData()

        let newFileTypes: [UTType] = [.text, .html]

        // WHEN
        viewModel.fileTypes = newFileTypes

        // THEN
        expectEqualToExpected(on: stub)

        FileUploadButtonGetContentTypeUseCaseableMockTest.expect(
            stub.getContentTypeUseCaseMock,
            expectedNumberOfCalls: 1,
            givenPhotoTypes: stub.givenPhotoTypes,
            givenFileTypes: newFileTypes,
            expectedReturnValue: stub.expectedContentType
        )
    }

    // MARK: - Properties Changed Before Setup

    @Test("Properties changed before setup should not call use case")
    func propertiesChangedBeforeSetupShouldNotCallUseCase() {
        // GIVEN
        let stub = Stub()
        let viewModel = stub.viewModel

        // WHEN
        viewModel.photoTypes = [.images]
        viewModel.fileTypes = [.pdf]

        // THEN
        expectEqualToExpected(
            on: stub,
            otherContentType: .default
        )

        expectNotCalled(
            on: stub,
            getContentTypeUseCase: true
        )
    }

    @Test("Properties changed without value change should not call use case")
    func propertiesChangedWithoutValueChangeShouldNotCallUseCase() {
        // GIVEN
        let stub = Stub()
        let viewModel = stub.viewModel

        viewModel.setup(stub: stub)
        stub.resetMockedData()

        // WHEN
        viewModel.photoTypes = stub.givenPhotoTypes
        viewModel.fileTypes = stub.givenFileTypes

        // THEN
        expectEqualToExpected(on: stub)

        expectNotCalled(
            on: stub,
            getContentTypeUseCase: true
        )
    }

    @Test("Properties changed with nil values should not call use case")
    func propertiesChangedWithNilValuesShouldNotCallUseCase() {
        // GIVEN
        let stub = Stub()
        let viewModel = stub.viewModel

        viewModel.setup(stub: stub)
        stub.resetMockedData()

        // WHEN
        viewModel.photoTypes = nil
        viewModel.fileTypes = nil

        // THEN
        expectEqualToExpected(on: stub)

        expectNotCalled(
            on: stub,
            getContentTypeUseCase: true
        )
    }
}

// MARK: - Stub

private final class Stub {

    // MARK: - Properties

    let givenPhotoTypes: [PHPickerFilter] = [.images, .videos]
    let givenFileTypes: [UTType] = [.pdf, .text]

    let expectedContentType: FileUploadButtonContentType = .all

    // MARK: - Use Case Mocks

    let getContentTypeUseCaseMock: FileUploadButtonGetContentTypeUseCaseableGeneratedMock

    // MARK: - ViewModel

    let viewModel: FileUploadButtonViewModel

    // MARK: - Initialization

    init() {
        let getContentTypeUseCaseMock = FileUploadButtonGetContentTypeUseCaseableGeneratedMock()
        getContentTypeUseCaseMock.executeWithPhotoTypesAndFileTypesReturnValue = self.expectedContentType

        self.viewModel = FileUploadButtonViewModel(
            getContentTypeUseCase: getContentTypeUseCaseMock
        )

        self.getContentTypeUseCaseMock = getContentTypeUseCaseMock
    }

    // MARK: - Methods

    func resetMockedData() {
        self.getContentTypeUseCaseMock.reset()
    }
}

// MARK: - Extension

private extension FileUploadButtonViewModel {

    func setup(stub: Stub) {
        self.setup(
            photoTypes: stub.givenPhotoTypes,
            fileTypes: stub.givenFileTypes
        )
    }
}

// MARK: - Expectations

private func expectNotCalled(
    on stub: Stub,
    getContentTypeUseCase: Bool = false,
    sourceLocation: Testing.SourceLocation = #_sourceLocation
) {
    FileUploadButtonGetContentTypeUseCaseableMockTest.expectCalled(
        stub.getContentTypeUseCaseMock,
        executeWithPhotoTypesAndFileTypesCalled: !getContentTypeUseCase,
        sourceLocation: sourceLocation
    )
}

private func expectEqualToExpected(
    on stub: Stub,
    otherContentType: FileUploadButtonContentType? = nil,
    sourceLocation: Testing.SourceLocation = #_sourceLocation
) {
    let viewModel = stub.viewModel

    let expectedContentType = otherContentType ?? stub.expectedContentType

    #expect(
        viewModel.contentType == expectedContentType,
        "Wrong contentType value",
        sourceLocation: sourceLocation
    )
}
