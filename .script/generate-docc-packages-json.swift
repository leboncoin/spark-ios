#!/usr/bin/env swift

/// Script to merge every docc output folder's documentation.json (an array of package entries)
/// into a single packages.json for the documentation site.
/// Direct execution
/// ```./.script/generate-docc-packages-json.swift <docsOutputPath>```
/// Or
/// ```swift .script/generate-docc-packages-json.swift <docsOutputPath>```

import Foundation

// MARK: - Models

private struct PackageEntry: Codable {
    let title: String
    let description: String
    let image: String
    var zeroheight: String?
    var figma: String?
    var path: String?
}

// MARK: - Main

func main() {
    let arguments = CommandLine.arguments
    let docsPath = arguments.count > 1 ? arguments[1] : ".docs"

    let fileManager = FileManager.default
    guard let folders = try? fileManager.contentsOfDirectory(atPath: docsPath).sorted() else {
        print("❌ Error: Cannot read directory at \(docsPath)")
        exit(1)
    }

    var packages: [PackageEntry] = []

    for folder in folders {
        let folderPath = "\(docsPath)/\(folder)"
        let docJSONPath = "\(folderPath)/documentation.json"

        var isDirectory: ObjCBool = false
        guard fileManager.fileExists(atPath: folderPath, isDirectory: &isDirectory), isDirectory.boolValue,
              let data = fileManager.contents(atPath: docJSONPath) else {
            continue
        }

        do {
            var items = try JSONDecoder().decode([PackageEntry].self, from: data)
            for index in items.indices {
                items[index].path = "\(folder)/documentation/\(folder)/documentation"
            }
            packages.append(contentsOf: items)
        } catch {
            print("⚠️  Warning: Could not parse \(docJSONPath): \(error)")
        }
    }

    let encoder = JSONEncoder()
    encoder.outputFormatting = [.prettyPrinted]
    do {
        let outputData = try encoder.encode(packages)
        let outputPath = "\(docsPath)/packages.json"
        try outputData.write(to: URL(fileURLWithPath: outputPath))
        print("✅ Generated packages.json with \(packages.count) packages")
    } catch {
        print("❌ Error writing packages.json: \(error)")
        exit(1)
    }
}

main()
