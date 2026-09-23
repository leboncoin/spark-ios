//
//  SparkCoreSnapshotTestsUtils.swift
//  SparkCoreTests
//
//  Created by luis.figueiredo-ext on 08/02/2023.
//  Copyright © 2023 Leboncoin. All rights reserved.
//

import XCTest
@_implementationOnly import SnapshotTesting

@_spi(SI_SPI) public func sparkAssertSnapshot<Value, Format>(
    matching value: @autoclosure () throws -> Value,
    as snapshotting: Snapshotting<Value, Format>,
    named name: String? = nil,
    record recording: Bool = false,
    timeout: TimeInterval = 5,
    file: StaticString = #file,
    testName: String = #function,
    line: UInt = #line,
    forDocumentation: Bool = false
) {
    let tracker = SnapshotTestCaseTracker.shared
    let directory = forDocumentation ? tracker.snapshotDocumentationDirectory(for: file) : tracker.snapshotDirectory(for: file)

    let failure = verifySnapshot(
        of: try value(),
        as: snapshotting,
        named: name,
        record: forDocumentation ? true : recording,
        snapshotDirectory: directory,
        timeout: timeout,
        file: file,
        testName: testName
    )

    // No failure if the snapshots is for documentation
    if forDocumentation {
        renameDocumentationSnapshot(
            directoryPath: directory,
            named: name,
            testName: testName
        )
    } else {
        guard let message = failure else { return }
        XCTFail("\(message): \(testName)", file: file, line: line)
    }
}

// swiftlint:disable no_debugging_method
private func renameDocumentationSnapshot(
    directoryPath: String,
    named name: String?,
    testName: String
) {
    let fileManager = FileManager.default

    do {
        let filename = testName + "." + (name ?? "")

        var filePath = directoryPath + filename + ".png"
        filePath.replace(".-", with: ".")

        if fileManager.fileExists(atPath: filePath) {

            // Resyntax the name of the file
            var destination3xFilePath = filePath
            destination3xFilePath.replace(".light", with: "")
            destination3xFilePath.replace(".dark", with: "~dark")
            destination3xFilePath.replace("-retina", with: "@3x")

            var destination2xFilePath = destination3xFilePath
            destination2xFilePath.replace("@3x", with: "@2x")

            var destination1xFilePath = destination3xFilePath
            destination1xFilePath.replace("@3x", with: "")

            let fileURL = URL(fileURLWithPath: filePath)

            let destination3xURL = URL(fileURLWithPath: destination3xFilePath)
            let destination2xURL = URL(fileURLWithPath: destination2xFilePath)
            let destination1xURL = URL(fileURLWithPath: destination1xFilePath)

            // Remove the snapshot if the file exists
            if fileManager.fileExists(atPath: destination3xURL.path) {
                try fileManager.removeItem(at: destination3xURL)
            }

            // Add the new snapshot file
            try fileManager.moveItem(at: fileURL, to: destination3xURL)

            // Resize the image for the @2x
            resizeDocumentationSnapshot(
                url: destination3xURL,
                destinationURL: destination2xURL,
                size: .twoX
            )

            // Resize the image for the @1x
            resizeDocumentationSnapshot(
                url: destination3xURL,
                destinationURL: destination1xURL,
                size: .oneX
            )
        }
    } catch {
        print("[Move Documentation] Error \(error)")
    }
}

// swiftlint:disable no_debugging_method
private func resizeDocumentationSnapshot(
    url: URL,
    destinationURL: URL,
    size scaledSize: ScaledSize
) {
    do {
        guard let data = try? Data(contentsOf: url),
              let img = UIImage(data: data) else {
            print("[Resize Documentation Image] Content is not an image")
            return
        }

        let size = img.size
        let newSize = CGSize(
            width: size.width / scaledSize.ratio,
            height: size.height / scaledSize.ratio
        )

        let format = UIGraphicsImageRendererFormat()
        format.scale = 1

        let renderer = UIGraphicsImageRenderer(size: newSize, format: format)
        let resized = renderer.image { _ in
            img.draw(in: CGRect(origin: .zero, size: newSize))
        }

        // 5. Sauvegarde au format PNG
        guard let pngData = resized.pngData() else {
            throw NSError(domain: "ImageResize", code: 2, userInfo: [NSLocalizedDescriptionKey: "PNG convertion failed"])
        }

        try pngData.write(to: destinationURL, options: .atomic)

    } catch {
        print("[Resize Documentation Image] Error \(error)")
    }
}

private enum ScaledSize {
    case oneX
    case twoX

    var ratio: CGFloat {
        switch self {
        case .oneX: 3
        case .twoX: 3 / 2
        }
    }
}
