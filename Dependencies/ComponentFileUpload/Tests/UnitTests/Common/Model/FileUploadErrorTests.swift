//
//  FileUploadErrorTests.swift
//  SparkComponentFileUploadTests
//
//  Created by robin.lemaire on 15/04/2026.
//  Copyright © 2026 Leboncoin. All rights reserved.
//

import Foundation
@testable import SparkComponentFileUpload
import Testing

@Suite("FileUploadError Tests")
struct FileUploadErrorTests {

    // MARK: - Tests - Error Cases

    @Test("photoResourceNotFound case exists")
    func photoResourceNotFoundCaseExists() {
        // GIVEN / WHEN
        let error = FileUploadError.photoResourceNotFound

        // THEN
        switch error {
        case .photoResourceNotFound:
            #expect(Bool(true))
        default:
            Issue.record("Expected photoResourceNotFound case")
        }
    }

    @Test("photoTransfer case exists with nil error")
    func photoTransferCaseExistsWithNilError() {
        // GIVEN / WHEN
        let error = FileUploadError.photoTransfer(nil)

        // THEN
        switch error {
        case .photoTransfer(let associatedError):
            #expect(associatedError == nil)
        default:
            Issue.record("Expected photoTransfer case")
        }
    }

    @Test("photoTransfer case exists with error")
    func photoTransferCaseExistsWithError() {
        // GIVEN
        let underlyingError = NSError(domain: "test", code: 100)

        // WHEN
        let error = FileUploadError.photoTransfer(underlyingError)

        // THEN
        switch error {
        case .photoTransfer(let associatedError):
            #expect(associatedError?.localizedDescription == underlyingError.localizedDescription)
        default:
            Issue.record("Expected photoTransfer case")
        }
    }

    @Test("fileSizeNotFound case exists with nil error")
    func fileSizeNotFoundCaseExistsWithNilError() {
        // GIVEN / WHEN
        let error = FileUploadError.fileSizeNotFound(nil)

        // THEN
        switch error {
        case .fileSizeNotFound(let associatedError):
            #expect(associatedError == nil)
        default:
            Issue.record("Expected fileSizeNotFound case")
        }
    }

    @Test("fileSizeNotFound case exists with error")
    func fileSizeNotFoundCaseExistsWithError() {
        // GIVEN
        let underlyingError = NSError(domain: "size", code: 200)

        // WHEN
        let error = FileUploadError.fileSizeNotFound(underlyingError)

        // THEN
        switch error {
        case .fileSizeNotFound(let associatedError):
            #expect(associatedError?.localizedDescription == underlyingError.localizedDescription)
        default:
            Issue.record("Expected fileSizeNotFound case")
        }
    }

    @Test("fileDataConversion case exists with nil error")
    func fileDataConversionCaseExistsWithNilError() {
        // GIVEN / WHEN
        let error = FileUploadError.fileDataConversion(nil)

        // THEN
        switch error {
        case .fileDataConversion(let associatedError):
            #expect(associatedError == nil)
        default:
            Issue.record("Expected fileDataConversion case")
        }
    }

    @Test("fileDataConversion case exists with error")
    func fileDataConversionCaseExistsWithError() {
        // GIVEN
        let underlyingError = NSError(domain: "conversion", code: 300)

        // WHEN
        let error = FileUploadError.fileDataConversion(underlyingError)

        // THEN
        switch error {
        case .fileDataConversion(let associatedError):
            #expect(associatedError?.localizedDescription == underlyingError.localizedDescription)
        default:
            Issue.record("Expected fileDataConversion case")
        }
    }

    @Test("dropConversion case exists with nil error")
    func dropConversionCaseExistsWithNilError() {
        // GIVEN / WHEN
        let error = FileUploadError.dropConversion(nil)

        // THEN
        switch error {
        case .dropConversion(let associatedError):
            #expect(associatedError == nil)
        default:
            Issue.record("Expected dropConversion case")
        }
    }

    @Test("dropConversion case exists with error")
    func dropConversionCaseExistsWithError() {
        // GIVEN
        let underlyingError = NSError(domain: "drop", code: 400)

        // WHEN
        let error = FileUploadError.dropConversion(underlyingError)

        // THEN
        switch error {
        case .dropConversion(let associatedError):
            #expect(associatedError?.localizedDescription == underlyingError.localizedDescription)
        default:
            Issue.record("Expected dropConversion case")
        }
    }

    @Test("other case exists with error")
    func otherCaseExistsWithError() {
        // GIVEN
        let underlyingError = NSError(domain: "other", code: 500)

        // WHEN
        let error = FileUploadError.other(underlyingError)

        // THEN
        switch error {
        case .other(let associatedError):
            #expect(associatedError.localizedDescription == underlyingError.localizedDescription)
        default:
            Issue.record("Expected other case")
        }
    }

    // MARK: - Tests - Localized Description

    @Test("localizedDescription returns localized string for photoResourceNotFound")
    func localizedDescriptionReturnsLocalizedStringForPhotoResourceNotFound() {
        // GIVEN
        let error = FileUploadError.photoResourceNotFound

        // WHEN
        let description = error.localizedDescription

        // THEN
        #expect(!description.isEmpty)
    }

    @Test("localizedDescription returns sub error description for photoTransfer with error")
    func localizedDescriptionReturnsSubErrorDescriptionForPhotoTransferWithError() {
        // GIVEN
        let underlyingError = NSError(domain: "test", code: 100, userInfo: [NSLocalizedDescriptionKey: "Custom photo transfer error"])
        let error = FileUploadError.photoTransfer(underlyingError)

        // WHEN
        let description = error.localizedDescription

        // THEN
        #expect(description == "Custom photo transfer error")
    }

    @Test("localizedDescription returns default string for photoTransfer with nil error")
    func localizedDescriptionReturnsDefaultStringForPhotoTransferWithNilError() {
        // GIVEN
        let error = FileUploadError.photoTransfer(nil)

        // WHEN
        let description = error.localizedDescription

        // THEN
        #expect(!description.isEmpty)
    }

    @Test("localizedDescription returns sub error description for fileSizeNotFound with error")
    func localizedDescriptionReturnsSubErrorDescriptionForFileSizeNotFoundWithError() {
        // GIVEN
        let underlyingError = NSError(domain: "size", code: 200, userInfo: [NSLocalizedDescriptionKey: "Custom size error"])
        let error = FileUploadError.fileSizeNotFound(underlyingError)

        // WHEN
        let description = error.localizedDescription

        // THEN
        #expect(description == "Custom size error")
    }

    @Test("localizedDescription returns default string for fileSizeNotFound with nil error")
    func localizedDescriptionReturnsDefaultStringForFileSizeNotFoundWithNilError() {
        // GIVEN
        let error = FileUploadError.fileSizeNotFound(nil)

        // WHEN
        let description = error.localizedDescription

        // THEN
        #expect(!description.isEmpty)
    }

    @Test("localizedDescription returns sub error description for fileDataConversion with error")
    func localizedDescriptionReturnsSubErrorDescriptionForFileDataConversionWithError() {
        // GIVEN
        let underlyingError = NSError(domain: "conversion", code: 300, userInfo: [NSLocalizedDescriptionKey: "Custom conversion error"])
        let error = FileUploadError.fileDataConversion(underlyingError)

        // WHEN
        let description = error.localizedDescription

        // THEN
        #expect(description == "Custom conversion error")
    }

    @Test("localizedDescription returns default string for fileDataConversion with nil error")
    func localizedDescriptionReturnsDefaultStringForFileDataConversionWithNilError() {
        // GIVEN
        let error = FileUploadError.fileDataConversion(nil)

        // WHEN
        let description = error.localizedDescription

        // THEN
        #expect(!description.isEmpty)
    }

    @Test("localizedDescription returns sub error description for dropConversion with error")
    func localizedDescriptionReturnsSubErrorDescriptionForDropConversionWithError() {
        // GIVEN
        let underlyingError = NSError(domain: "drop", code: 400, userInfo: [NSLocalizedDescriptionKey: "Custom drop error"])
        let error = FileUploadError.dropConversion(underlyingError)

        // WHEN
        let description = error.localizedDescription

        // THEN
        #expect(description == "Custom drop error")
    }

    @Test("localizedDescription returns default string for dropConversion with nil error")
    func localizedDescriptionReturnsDefaultStringForDropConversionWithNilError() {
        // GIVEN
        let error = FileUploadError.dropConversion(nil)

        // WHEN
        let description = error.localizedDescription

        // THEN
        #expect(!description.isEmpty)
    }

    @Test("localizedDescription returns sub error description for other")
    func localizedDescriptionReturnsSubErrorDescriptionForOther() {
        // GIVEN
        let underlyingError = NSError(domain: "other", code: 500, userInfo: [NSLocalizedDescriptionKey: "Custom other error"])
        let error = FileUploadError.other(underlyingError)

        // WHEN
        let description = error.localizedDescription

        // THEN
        #expect(description == "Custom other error")
    }

    // MARK: - Tests - Equatable

    @Test("photoResourceNotFound equals itself")
    func photoResourceNotFoundEqualsItself() {
        // GIVEN
        let error1 = FileUploadError.photoResourceNotFound
        let error2 = FileUploadError.photoResourceNotFound

        // WHEN / THEN
        #expect(error1 == error2)
    }

    @Test("photoResourceNotFound does not equal other cases")
    func photoResourceNotFoundDoesNotEqualOtherCases() {
        // GIVEN
        let error1 = FileUploadError.photoResourceNotFound
        let error2 = FileUploadError.photoTransfer(nil)

        // WHEN / THEN
        #expect(error1 != error2)
    }

    @Test("photoTransfer with same nil error equals")
    func photoTransferWithSameNilErrorEquals() {
        // GIVEN
        let error1 = FileUploadError.photoTransfer(nil)
        let error2 = FileUploadError.photoTransfer(nil)

        // WHEN / THEN
        #expect(error1 == error2)
    }

    @Test("photoTransfer with same underlying error equals")
    func photoTransferWithSameUnderlyingErrorEquals() {
        // GIVEN
        let underlyingError = NSError(domain: "test", code: 100, userInfo: [NSLocalizedDescriptionKey: "Test error"])
        let error1 = FileUploadError.photoTransfer(underlyingError)
        let error2 = FileUploadError.photoTransfer(underlyingError)

        // WHEN / THEN
        #expect(error1 == error2)
    }

    @Test("photoTransfer with different underlying errors does not equal")
    func photoTransferWithDifferentUnderlyingErrorsDoesNotEqual() {
        // GIVEN
        let error1Underlying = NSError(domain: "test1", code: 100, userInfo: [NSLocalizedDescriptionKey: "Error 1"])
        let error2Underlying = NSError(domain: "test2", code: 200, userInfo: [NSLocalizedDescriptionKey: "Error 2"])
        let error1 = FileUploadError.photoTransfer(error1Underlying)
        let error2 = FileUploadError.photoTransfer(error2Underlying)

        // WHEN / THEN
        #expect(error1 != error2)
    }

    @Test("photoTransfer with nil and non-nil errors does not equal")
    func photoTransferWithNilAndNonNilErrorsDoesNotEqual() {
        // GIVEN
        let underlyingError = NSError(domain: "test", code: 100)
        let error1 = FileUploadError.photoTransfer(nil)
        let error2 = FileUploadError.photoTransfer(underlyingError)

        // WHEN / THEN
        #expect(error1 != error2)
    }

    @Test("fileSizeNotFound with same nil error equals")
    func fileSizeNotFoundWithSameNilErrorEquals() {
        // GIVEN
        let error1 = FileUploadError.fileSizeNotFound(nil)
        let error2 = FileUploadError.fileSizeNotFound(nil)

        // WHEN / THEN
        #expect(error1 == error2)
    }

    @Test("fileSizeNotFound with same underlying error equals")
    func fileSizeNotFoundWithSameUnderlyingErrorEquals() {
        // GIVEN
        let underlyingError = NSError(domain: "size", code: 200, userInfo: [NSLocalizedDescriptionKey: "Size error"])
        let error1 = FileUploadError.fileSizeNotFound(underlyingError)
        let error2 = FileUploadError.fileSizeNotFound(underlyingError)

        // WHEN / THEN
        #expect(error1 == error2)
    }

    @Test("fileSizeNotFound with different underlying errors does not equal")
    func fileSizeNotFoundWithDifferentUnderlyingErrorsDoesNotEqual() {
        // GIVEN
        let error1Underlying = NSError(domain: "size1", code: 200, userInfo: [NSLocalizedDescriptionKey: "Size error 1"])
        let error2Underlying = NSError(domain: "size2", code: 201, userInfo: [NSLocalizedDescriptionKey: "Size error 2"])
        let error1 = FileUploadError.fileSizeNotFound(error1Underlying)
        let error2 = FileUploadError.fileSizeNotFound(error2Underlying)

        // WHEN / THEN
        #expect(error1 != error2)
    }

    @Test("fileDataConversion with same nil error equals")
    func fileDataConversionWithSameNilErrorEquals() {
        // GIVEN
        let error1 = FileUploadError.fileDataConversion(nil)
        let error2 = FileUploadError.fileDataConversion(nil)

        // WHEN / THEN
        #expect(error1 == error2)
    }

    @Test("fileDataConversion with same underlying error equals")
    func fileDataConversionWithSameUnderlyingErrorEquals() {
        // GIVEN
        let underlyingError = NSError(domain: "conversion", code: 300, userInfo: [NSLocalizedDescriptionKey: "Conversion error"])
        let error1 = FileUploadError.fileDataConversion(underlyingError)
        let error2 = FileUploadError.fileDataConversion(underlyingError)

        // WHEN / THEN
        #expect(error1 == error2)
    }

    @Test("fileDataConversion with different underlying errors does not equal")
    func fileDataConversionWithDifferentUnderlyingErrorsDoesNotEqual() {
        // GIVEN
        let error1Underlying = NSError(domain: "conversion1", code: 300, userInfo: [NSLocalizedDescriptionKey: "Conversion error 1"])
        let error2Underlying = NSError(domain: "conversion2", code: 301, userInfo: [NSLocalizedDescriptionKey: "Conversion error 2"])
        let error1 = FileUploadError.fileDataConversion(error1Underlying)
        let error2 = FileUploadError.fileDataConversion(error2Underlying)

        // WHEN / THEN
        #expect(error1 != error2)
    }

    @Test("dropConversion with same nil error equals")
    func dropConversionWithSameNilErrorEquals() {
        // GIVEN
        let error1 = FileUploadError.dropConversion(nil)
        let error2 = FileUploadError.dropConversion(nil)

        // WHEN / THEN
        #expect(error1 == error2)
    }

    @Test("dropConversion with same underlying error equals")
    func dropConversionWithSameUnderlyingErrorEquals() {
        // GIVEN
        let underlyingError = NSError(domain: "drop", code: 400, userInfo: [NSLocalizedDescriptionKey: "Drop error"])
        let error1 = FileUploadError.dropConversion(underlyingError)
        let error2 = FileUploadError.dropConversion(underlyingError)

        // WHEN / THEN
        #expect(error1 == error2)
    }

    @Test("dropConversion with different underlying errors does not equal")
    func dropConversionWithDifferentUnderlyingErrorsDoesNotEqual() {
        // GIVEN
        let error1Underlying = NSError(domain: "drop1", code: 400, userInfo: [NSLocalizedDescriptionKey: "Drop error 1"])
        let error2Underlying = NSError(domain: "drop2", code: 401, userInfo: [NSLocalizedDescriptionKey: "Drop error 2"])
        let error1 = FileUploadError.dropConversion(error1Underlying)
        let error2 = FileUploadError.dropConversion(error2Underlying)

        // WHEN / THEN
        #expect(error1 != error2)
    }

    @Test("other with same underlying error equals")
    func otherWithSameUnderlyingErrorEquals() {
        // GIVEN
        let underlyingError = NSError(domain: "other", code: 500, userInfo: [NSLocalizedDescriptionKey: "Other error"])
        let error1 = FileUploadError.other(underlyingError)
        let error2 = FileUploadError.other(underlyingError)

        // WHEN / THEN
        #expect(error1 == error2)
    }

    @Test("other with different underlying errors does not equal")
    func otherWithDifferentUnderlyingErrorsDoesNotEqual() {
        // GIVEN
        let error1Underlying = NSError(domain: "other1", code: 500, userInfo: [NSLocalizedDescriptionKey: "Other error 1"])
        let error2Underlying = NSError(domain: "other2", code: 501, userInfo: [NSLocalizedDescriptionKey: "Other error 2"])
        let error1 = FileUploadError.other(error1Underlying)
        let error2 = FileUploadError.other(error2Underlying)

        // WHEN / THEN
        #expect(error1 != error2)
    }

    @Test("different error cases do not equal")
    func differentErrorCasesDoNotEqual() {
        // GIVEN
        let error1 = FileUploadError.photoResourceNotFound
        let error2 = FileUploadError.fileSizeNotFound(nil)
        let error3 = FileUploadError.fileDataConversion(nil)
        let error4 = FileUploadError.dropConversion(nil)
        let error5 = FileUploadError.other(NSError(domain: "test", code: 1))

        // WHEN / THEN
        #expect(error1 != error2)
        #expect(error1 != error3)
        #expect(error1 != error4)
        #expect(error1 != error5)
        #expect(error2 != error3)
        #expect(error2 != error4)
        #expect(error2 != error5)
        #expect(error3 != error4)
        #expect(error3 != error5)
        #expect(error4 != error5)
    }

    // MARK: - Tests - Error Conformance

    @Test("FileUploadError conforms to Error protocol")
    func fileUploadErrorConformsToErrorProtocol() {
        // GIVEN
        let error: Error = FileUploadError.photoResourceNotFound

        // WHEN / THEN
        #expect(error is FileUploadError)
    }

    @Test("All error cases can be cast to Error")
    func allErrorCasesCanBeCastToError() {
        // GIVEN
        let errors: [Error] = [
            FileUploadError.photoResourceNotFound,
            FileUploadError.photoTransfer(nil),
            FileUploadError.fileSizeNotFound(nil),
            FileUploadError.fileDataConversion(nil),
            FileUploadError.dropConversion(nil),
            FileUploadError.other(NSError(domain: "test", code: 1))
        ]

        // WHEN / THEN
        for error in errors {
            #expect(error is FileUploadError)
        }
    }
}
