//
//  FileUploadConvertibleMock.swift
//  SparkComponentFileUpload
//
//  Created by robin.lemaire on 09/04/2026.
//  Copyright © 2026 Leboncoin. All rights reserved.
//

import Foundation
@testable import SparkComponentFileUpload
import Testing

@_spi(SI_SPI) public final class FileUploadConvertibleMock: FileUploadConvertible, ResetGeneratedMock {

    // MARK: - Properties

    public var initWithNameAndFileExtensionAndSizeAndUrlAndDataReceivedArguments: (name: String, fileExtension: String, size: Double, url: URL, data: Data)?
    public var initWithNameAndFileExtensionAndSizeAndUrlAndDataReceivedInvocations: [(name: String, fileExtension: String, size: Double, url: URL, data: Data)] = []
    public var _initWithNameAndFileExtensionAndSizeAndUrlAndData: ((String, String, Double, URL, Data) -> Void)?

    // MARK: - Initialization

    public init(name: String, fileExtension: String, size: Double, url: URL, data: Data) {
        self.initWithNameAndFileExtensionAndSizeAndUrlAndDataReceivedArguments = (name: name, fileExtension: fileExtension, size: size, url: url, data: data)
        self.initWithNameAndFileExtensionAndSizeAndUrlAndDataReceivedInvocations.append((name: name, fileExtension: fileExtension, size: size, url: url, data: data))
        self._initWithNameAndFileExtensionAndSizeAndUrlAndData?(name, fileExtension, size, url, data)
    }

    // MARK: Reset

    public func reset() {
        self.initWithNameAndFileExtensionAndSizeAndUrlAndDataReceivedArguments = nil
        self.initWithNameAndFileExtensionAndSizeAndUrlAndDataReceivedInvocations = []
    }
}
