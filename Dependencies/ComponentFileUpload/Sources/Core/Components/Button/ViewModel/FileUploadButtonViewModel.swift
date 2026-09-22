//
//  FileUploadButtonViewModel.swift
//  SparkComponentFileUpload
//
//  Created by robin.lemaire on 01/04/2026.
//  Copyright © 2026 Leboncoin. All rights reserved.
//

import SwiftUI
@_spi(SI_SPI) import SparkTheming
import SwiftUI
import PhotosUI
import UIKit

// sourcery: AutoPublisherTest, AutoViewModelStub
final class FileUploadButtonViewModel: ObservableObject {

    // MARK: - Published Properties

    @Published private(set) var contentType: FileUploadButtonContentType = .default

    // MARK: - Properties

    var photoTypes: [PHPickerFilter]? {
        didSet {
            guard oldValue != self.photoTypes, self.alreadyUpdateAll else { return }

            self.setContentType()
        }
    }

    var fileTypes: [UTType]? {
        didSet {
            guard oldValue != self.fileTypes, self.alreadyUpdateAll else { return }

            self.setContentType()
        }
    }

    // MARK: - Private Properties

    private var alreadyUpdateAll = false

    // MARK: - Use Case Properties

    private let getContentTypeUseCase: any FileUploadButtonGetContentTypeUseCaseable

    // MARK: - Initialization

    init(getContentTypeUseCase: any FileUploadButtonGetContentTypeUseCaseable = FileUploadButtonGetContentTypeUseCase()) {
        self.getContentTypeUseCase = getContentTypeUseCase
    }

    // MARK: - Setup

    func setup(
        photoTypes: [PHPickerFilter],
        fileTypes: [UTType]
    ) {
        self.photoTypes = photoTypes
        self.fileTypes = fileTypes

        self.setContentType()

        self.alreadyUpdateAll = true
    }

    // MARK: - Private Setter

    private func setContentType() {
        guard let photoTypes, let fileTypes else { return }

        self.contentType = self.getContentTypeUseCase.execute(
            photoTypes: photoTypes,
            fileTypes: fileTypes
        )
    }
}
