#!/usr/bin/env swift

/// Script to move icons from a folder of this repository to the assets
/// Direct execution
/// ```./.script/generate-iconography-assets.swift spark-token/iconography```
/// Or
/// ```swift .script/generate-iconography-assets.swift spark-token/iconography```

import Foundation

// MARK: - Main Script

guard CommandLine.arguments.count >= 2 else {
    print("Usage: generate-iconography-assets.swift <source-icons-path>")
    print("Example: generate-iconography-assets.swift spark-token/iconography")
    exit(1)
}

let sourceIconsPath = CommandLine.arguments[1]
let resourcesPath = "Resources/Sources/Core/Assets/Iconography.xcassets"
let resourcesCriteriaPath = "\(resourcesPath)/Criteria"
let resourcesGlobalPath = "\(resourcesPath)/Global"

// MARK: - Helper Functions

private func removeAssetsDirectoryContents() throws {
    try removeDirectoryContents(of: resourcesCriteriaPath, name: "Criteria")
    try removeDirectoryContents(of: resourcesGlobalPath, name: "Global")
    try removeImagesets(from: resourcesPath)
}

private func removeDirectoryContents(of path: String, name: String) throws {
    let fileManager = FileManager.default

    if fileManager.fileExists(atPath: path) {
        let contents = try fileManager.contentsOfDirectory(atPath: path)
        for item in contents {
            let itemPath = "\(path)/\(item)"
            try fileManager.removeItem(atPath: itemPath)
            print("✓ Removed \(itemPath) from Iconography.xcassets/\(name)")
        }
        print("✓ Cleared contents of \(name) folder\n")
    }
}

private func removeImagesets(from path: String) throws {
    let fileManager = FileManager.default

    guard fileManager.fileExists(atPath: path) else {
        return
    }

    let contents = try fileManager.contentsOfDirectory(atPath: path)
    var hasRemoved = false

    for item in contents where item.hasSuffix(".imageset") {
        let itemPath = "\(path)/\(item)"
        var isDirectory: ObjCBool = false

        if fileManager.fileExists(atPath: itemPath, isDirectory: &isDirectory), isDirectory.boolValue {
            try fileManager.removeItem(atPath: itemPath)
            hasRemoved = true
            print("✓ Removed \(itemPath) from Iconography.xcassets root")
        }
    }

    if hasRemoved {
        print("✓ Cleared contents of root folder\n")
    }
}

private func createDirectoryIfNeeded(at path: String) throws {
    let fileManager = FileManager.default

    if !fileManager.fileExists(atPath: path) {
        try fileManager.createDirectory(atPath: path, withIntermediateDirectories: true, attributes: nil)
        print("✓ Created directory: \(path)")
    }
}

private func getSVGFiles(from path: String) throws -> [String] {
    let fileManager = FileManager.default

    guard fileManager.fileExists(atPath: path) else {
        throw NSError(domain: "IconScript", code: 1, userInfo: [NSLocalizedDescriptionKey: "Source path does not exist: \(path)"])
    }

    let contents = try fileManager.contentsOfDirectory(atPath: path)
    let svgFiles = contents.filter { $0.hasSuffix(".svg") }

    print("✓ Found \(svgFiles.count) SVG files in \(path)")
    return svgFiles
}

private func copyIcon(fileName: String, from sourcePath: String, to destinationPath: String, newName: String? = nil) throws {
    let fileManager = FileManager.default
    let sourceFile = "\(sourcePath)/\(fileName)"
    let finalFileName = newName ?? fileName
    let destinationFile = "\(destinationPath)/\(finalFileName)"

    try fileManager.copyItem(atPath: sourceFile, toPath: destinationFile)
}

private func createImageset(iconName: String, in folderPath: String) throws {
    let fileManager = FileManager.default

    // Remove .svg extension from iconName to get base name
    let baseName = iconName.replacingOccurrences(of: ".svg", with: "")
    let imagesetPath = "\(folderPath)/\(baseName).imageset"

    // Create imageset directory
    try createDirectoryIfNeeded(at: imagesetPath)

    // Move SVG file into imageset
    let oldPath = "\(folderPath)/\(iconName)"
    let newPath = "\(imagesetPath)/\(iconName)"

    if fileManager.fileExists(atPath: oldPath) {
        try fileManager.moveItem(atPath: oldPath, toPath: newPath)
    }

    // Create Contents.json
    let contentsJSON = """
    {
      "images" : [
        {
          "filename" : "\(iconName)",
          "idiom" : "universal"
        }
      ],
      "info" : {
        "author" : "xcode",
        "version" : 1
      },
      "properties" : {
        "preserves-vector-representation" : true,
        "template-rendering-intent" : "template"
      }
    }
    """

    let contentsJSONPath = "\(imagesetPath)/Contents.json"
    try contentsJSON.write(toFile: contentsJSONPath, atomically: true, encoding: .utf8)
}

private func addContentsJSONToAssetsSubfolders(in assetsPath: String) throws {
    let fileManager = FileManager.default

    guard fileManager.fileExists(atPath: assetsPath) else {
        print("⚠ Assets path does not exist: \(assetsPath)")
        return
    }

    let contents = try fileManager.contentsOfDirectory(atPath: assetsPath)

    for item in contents {
        let itemPath = "\(assetsPath)/\(item)"
        var isDirectory: ObjCBool = false

        if fileManager.fileExists(atPath: itemPath, isDirectory: &isDirectory), isDirectory.boolValue {
            // Skip .imageset folders
            if item.hasSuffix(".imageset") {
                continue
            }

            let contentsJSONPath = "\(itemPath)/Contents.json"

            // Only create if it doesn't exist or overwrite it
            let contentsJSON = """
            {
              "properties" : {
                "provides-namespace" : true
              }
            }
            """

            try contentsJSON.write(toFile: contentsJSONPath, atomically: true, encoding: .utf8)
            print("✓ Added Contents.json to \(item) folder")
        }
    }
}

// MARK: - Main Logic

do {
    print("\n🚀 Starting icon management script...\n")

    // Step 1: Clear existing Global and Criteria folders
    print("Step 1: Clearing existing Global and Criteria folders...")
    try removeAssetsDirectoryContents()

    // Step 2: Get SVG files from source
    print("\nStep 2: Reading SVG files from source...")
    let svgFiles = try getSVGFiles(from: sourceIconsPath)

    if svgFiles.isEmpty {
        print("⚠ No SVG files found in \(sourceIconsPath)")
        exit(0)
    }

    // Step 3 & 4: Separate Criteria and Global icons
    print("\nStep 3 & 4: Separating Criteria and Global icons...")

    try createDirectoryIfNeeded(at: resourcesCriteriaPath)
    try createDirectoryIfNeeded(at: resourcesGlobalPath)

    var criteriaCount = 0
    var globalCount = 0

    for svgFile in svgFiles {
        if svgFile.contains("Criteria") {
            // Remove "Criteria" from the name
            let newName = svgFile.replacingOccurrences(of: "Criteria", with: "")
            try copyIcon(fileName: svgFile, from: sourceIconsPath, to: resourcesCriteriaPath, newName: newName)
            criteriaCount += 1
        } else {
            try copyIcon(fileName: svgFile, from: sourceIconsPath, to: resourcesGlobalPath)
            globalCount += 1
        }
    }

    print("✓ Copied \(criteriaCount) icons to Criteria folder")
    print("✓ Copied \(globalCount) icons to Global folder")

    // Step 6: Format as imagesets
    print("\nStep 5: Formatting icons as imagesets...")

    // Process Criteria icons
    let criteriaIcons = try FileManager.default.contentsOfDirectory(atPath: resourcesCriteriaPath).filter { $0.hasSuffix(".svg") }
    for icon in criteriaIcons {
        try createImageset(iconName: icon, in: resourcesCriteriaPath)
    }
    print("✓ Created \(criteriaIcons.count) imagesets in Criteria folder")

    // Process Global icons
    let globalIcons = try FileManager.default.contentsOfDirectory(atPath: resourcesGlobalPath).filter { $0.hasSuffix(".svg") }
    for icon in globalIcons {
        try createImageset(iconName: icon, in: resourcesGlobalPath)
    }
    print("✓ Created \(globalIcons.count) imagesets in Global folder")

    // Step 6: Add Contents.json to all folders in Iconography.xcassets
    print("\nStep 6: Adding Contents.json to folders in XCAssets...")
    try addContentsJSONToAssetsSubfolders(in: resourcesPath)

    // Step 7: Remove source directory
    print("\nStep 7: Cleaning up source directory...")
    let pathComponents = sourceIconsPath.split(separator: "/").map(String.init)
    let pathToRemove = pathComponents.count >= 2 ? pathComponents[0] : sourceIconsPath
    try FileManager.default.removeItem(atPath: pathToRemove)
    print("✓ Removed source directory: \(pathToRemove)")

    print("\n✅ Icon management completed successfully!")
    print("📁 Icons organized in:")
    print("   - \(resourcesCriteriaPath)")
    print("   - \(resourcesGlobalPath)")

} catch {
    print("\n❌ Error: \(error.localizedDescription)")
    exit(1)
}
