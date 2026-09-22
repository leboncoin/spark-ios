//
//  FileUploadConvertURLServicingMock.swift
//  SparkComponentFileUpload
//
//  Created by robin.lemaire on 09/04/2026.
//  Copyright © 2026 Leboncoin. All rights reserved.
//

import Foundation
import Testing

import Combine
import SparkTheming

@_spi(SI_SPI) import SparkCommon
@_spi(SI_SPI) import SparkCommonTesting
@_spi(SI_SPI) import SparkThemingTesting

@testable import SparkComponentFileUpload

@_spi(SI_SPI) public final class FileUploadConvertURLServicingMockTest {

    // MARK: - Initialization

    private init() {
    }

    // MARK: - Swift Testing

    public static func expectCallsCount(
        _ mock: FileUploadConvertURLServicingMock,
        executeWithUrlNumberOfCalls numberOfCalls: Int,
        sourceLocation: Testing.SourceLocation = #_sourceLocation
    ) {
        #expect(
            mock.executeWithUrlCallsCount == numberOfCalls,
            "Wrong execute<Convertible>(from url: URL) number of called on FileUploadConvertURLServicing. Expected \(numberOfCalls), got \(mock.executeWithUrlCallsCount)",
            sourceLocation: sourceLocation
        )
    }

    public static func expectCalled(
        _ mock: FileUploadConvertURLServicingMock,
        executeWithUrlCalled isCalled: Bool,
        sourceLocation: Testing.SourceLocation = #_sourceLocation
    ) {
        #expect(
            mock.executeWithUrlCalled == isCalled,
            "Wrong execute<Convertible>(from url: URL) isCalled on FileUploadConvertURLServicing. Expected \(isCalled), got \(mock.executeWithUrlCalled)",
            sourceLocation: sourceLocation
        )
    }

    public static func expect<
        _Return: AnyObject
    >(
        _ mock: FileUploadConvertURLServicingMock,
        expectedNumberOfCalls: Int,
        givenUrl: URL? = nil,
        expectedReturnValue: _Return,
        sourceLocation: Testing.SourceLocation = #_sourceLocation
    ) {
        // Count
        #expect(
            mock.executeWithUrlCallsCount == expectedNumberOfCalls,
            "Wrong execute<Convertible>(from url: URL) number of called on FileUploadConvertURLServicing. Expected \(expectedNumberOfCalls), got \(mock.executeWithUrlCallsCount)",
            sourceLocation: sourceLocation
        )

        // Parameters
        if expectedNumberOfCalls > 0 {
            // Url
            if let givenUrl {

                #expect(
                    mock.executeWithUrlReceivedUrl == givenUrl,
                    "Wrong execute<Convertible>(from url: URL) url parameter on FileUploadConvertURLServicing. Expected \(String(describing: givenUrl)), got \(String(describing: mock.executeWithUrlReceivedUrl))",
                    sourceLocation: sourceLocation
                )
            } else {
                #expect(
                    mock.executeWithUrlReceivedUrl == nil,
                    "Wrong execute<Convertible>(from url: URL) url parameter value on FileUploadConvertURLServicing. Should be nil but got \(String(describing: mock.executeWithUrlReceivedUrl))",
                    sourceLocation: sourceLocation
                )
            }

        }

        // Return
        guard let returnValue = mock.executeWithUrlReturnValue as? _Return else {
            Issue.record("Wrong execute<Convertible>(from url: URL) return value type on FileUploadConvertURLServicing", sourceLocation: sourceLocation)
            return
        }
        #expect(
            returnValue === expectedReturnValue,
            "Wrong execute<Convertible>(from url: URL) return value on FileUploadConvertURLServicing",
            sourceLocation: sourceLocation
        )
    }

}

// swiftlint:disable force_cast
@_spi(SI_SPI) public final class FileUploadConvertURLServicingMock: SparkComponentFileUpload.FileUploadConvertURLServicing, ResetGeneratedMock {

    // MARK: - Properties

    public var executeWithUrlThrowableError: Error?
    public var executeWithUrlCallsCount = 0
    public var executeWithUrlCalled: Bool {
        return self.executeWithUrlCallsCount > 0
    }
    public var executeWithUrlReceivedUrl: (URL)?
    public var executeWithUrlReceivedInvocations: [URL] = []

    public var executeWithUrlReturnValue: Any!
    public var _executeWithUrl: ((URL) throws -> Any?)?

    // MARK: - Initialization

    public init() {}

    // MARK: - execute<Convertible>

    public func execute<Convertible>(from url: URL) throws -> Convertible where Convertible: FileUploadConvertible {
        self.executeWithUrlCallsCount += 1
        self.executeWithUrlReceivedUrl = url
        self.executeWithUrlReceivedInvocations.append(url)

        return (try self._executeWithUrl.flatMap { try $0(url) } ?? self.executeWithUrlReturnValue) as! Convertible
    }

    // MARK: Reset 

    public func reset() {
        self.executeWithUrlCallsCount = 0
        self.executeWithUrlReceivedUrl = nil
        self.executeWithUrlReceivedInvocations = []
    }
}

