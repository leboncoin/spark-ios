//
//  SnapshotDirectoryResolver.swift
//  SparkSnapshotTesting
//
//  Created by janniklas.freundt.ext on 13.04.23.
//  Copyright © 2023 Leboncoin. All rights reserved.
//

import Foundation

/// `SnapshotDirectoryResolver` resolves the snapshot-images directories of a suite.
enum SnapshotDirectoryResolver {

    // MARK: - Constants

    private enum Constants {
        static let snapshotFolder = ".__snapshots__"
        static let separator = "/"
    }

    // MARK: - Methods

    /// Create the snapshot directory for a file and a suite name.
    /// The final link should be like: *"your-module-name/Tests/SnapshotTests/.__snapshots__/"*
    static func snapshotDirectory(for file: StaticString, suiteName: String) -> String {
        var filePaths = "\(file)".components(separatedBy: Constants.separator)

        guard let bundlePathIndex = filePaths.firstIndex(of: "SnapshotTests") else {
            fatalError("No bundle identifier found on the file path")
        }

        // Remove all folder under the SnapshotTests folder.
        filePaths.removeLast(filePaths.count - bundlePathIndex - 1)
        // Add the snapshot folder
        filePaths.append(Constants.snapshotFolder)
        // Add the test class name
        filePaths.append(suiteName)

        return filePaths.joined(separator: Constants.separator)
    }

    /// Create the documentation snapshot directory for a file and a suite name.
    /// The final link should be like: *"your-module-name/Sources/Core/Documentation.docc/Resources/"*
    static func snapshotDocumentationDirectory(for file: StaticString, suiteName: String) -> String {
        self.snapshotDirectory(for: file, suiteName: suiteName) + String(repeating: "/..", count: 4) + "/Sources/Core/Documentation.docc/Resources/"
    }
}
