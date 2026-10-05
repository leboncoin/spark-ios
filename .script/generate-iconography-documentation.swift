#!/usr/bin/env swift

/// Script to generate the Iconography DocC page listing every icon
/// Direct execution
/// ```./.script/generate-iconography-documentation.swift```
/// Or
/// ```swift .script/generate-iconography-documentation.swift```

import Foundation

// MARK: - Models

fileprivate struct Icon {
    let name: String
    let svgURL: URL
}

fileprivate struct IconCategory {
    let name: String
    let icons: [Icon]
}

// MARK: - Constants

private let gridColumnCount = 4

// MARK: - Helpers

private func toCamelCase(_ string: String) -> String {
    guard !string.isEmpty else { return string }

    let specialCases = ["3D": "threeD", "360": "threeSixty"]
    if let specialCase = specialCases[string] {
        return specialCase
    }

    return string.prefix(1).lowercased() + string.dropFirst()
}

private func getCategoryEnumName(category: String) -> String {
    return switch category {
    case "Global": "Spark"
    case "Criteria": "SparkCriteria"
    default: "Spark\(category)"
    }
}

private func getInitializerLabel(category: String) -> String {
    return switch category {
    case "Global": "spark"
    case "Criteria": "sparkCriteria"
    default: "spark\(category)"
    }
}

private func getDocumentationImageName(category: String, icon: String) -> String {
    return "iconography-\(category.lowercased())-\(icon)"
}

// MARK: - File System Operations

private func findIconCategories(at path: String) -> [IconCategory] {
    let fileManager = FileManager.default

    guard let enumerator = fileManager.enumerator(
        at: URL(fileURLWithPath: path),
        includingPropertiesForKeys: [.isDirectoryKey],
        options: [.skipsHiddenFiles]
    ) else {
        print("❌ Error: Cannot enumerate directory at \(path)")
        exit(1)
    }

    var categoryDict: [String: [Icon]] = [:]

    for case let fileURL as URL in enumerator {
        guard fileURL.lastPathComponent.hasSuffix(".imageset") else {
            continue
        }

        let categoryName = fileURL.deletingLastPathComponent().lastPathComponent
        guard categoryName != "Iconography.xcassets" else {
            continue
        }

        let iconName = fileURL.lastPathComponent.replacingOccurrences(of: ".imageset", with: "")
        let files = (try? fileManager.contentsOfDirectory(atPath: fileURL.path)) ?? []
        guard let svgFile = files.first(where: { $0.hasSuffix(".svg") }) else {
            print("⚠️  Warning: No SVG found for \(categoryName)/\(iconName)")
            continue
        }

        categoryDict[categoryName, default: []].append(
            Icon(name: iconName, svgURL: fileURL.appendingPathComponent(svgFile))
        )
    }

    return categoryDict
        .map { IconCategory(name: $0.key, icons: $0.value.sorted { $0.name < $1.name }) }
        .sorted { $0.name < $1.name }
}

private func copyImages(categories: [IconCategory], to imagesPath: String) {
    let fileManager = FileManager.default

    do {
        if fileManager.fileExists(atPath: imagesPath) {
            try fileManager.removeItem(atPath: imagesPath)
        }
        try fileManager.createDirectory(atPath: imagesPath, withIntermediateDirectories: true)

        for category in categories {
            for icon in category.icons {
                let imageName = getDocumentationImageName(category: category.name, icon: icon.name)
                let destination = URL(fileURLWithPath: imagesPath).appendingPathComponent("\(imageName).svg")
                try fileManager.copyItem(at: icon.svgURL, to: destination)
            }
        }
    } catch {
        print("❌ Error copying images: \(error)")
        exit(1)
    }
}

// MARK: - Documentation Generation

private func generateCategorySection(category: IconCategory) -> String {
    let enumName = getCategoryEnumName(category: category.name)
    let label = getInitializerLabel(category: category.name)

    var output = "### \(category.name)\n\n"
    output += "\(category.icons.count) icons available on **ImageResource/\(enumName)**, "
    output += "usable with `Image(\(label):)` and `UIImage(\(label):)`.\n\n"

    let cells = category.icons.map { icon in
        let imageName = getDocumentationImageName(category: category.name, icon: icon.name)
        return "![\(icon.name)](\(imageName)) `\\.\(toCamelCase(icon.name))`"
    }

    // The first row is used as the table header to avoid an empty header row.
    for (rowIndex, index) in stride(from: 0, to: cells.count, by: gridColumnCount).enumerated() {
        let rowCells = cells[index..<min(index + gridColumnCount, cells.count)]
        let emptyCells = String(repeating: " |", count: gridColumnCount - rowCells.count)

        output += "| " + rowCells.joined(separator: " | ") + " |" + emptyCells + "\n"
        if rowIndex == 0 {
            output += "|" + String(repeating: " :---: |", count: gridColumnCount) + "\n"
        }
    }

    return output
}

private func generateDocumentation(categories: [IconCategory]) -> String {
    var output = "# Iconography\n\n"
    output += "<!-- Generated using generate-iconography-documentation.swift -->\n"
    output += "<!-- DO NOT EDIT - This file is automatically generated -->\n\n"
    output += "The Spark iconography available in the **Iconography** asset catalog.\n\n"
    output += "## Overview\n\n"
    output += "The icons are split in \(categories.count) sets:\n"

    for category in categories {
        let enumName = getCategoryEnumName(category: category.name)
        let label = getInitializerLabel(category: category.name)
        output += "- **\(category.name)**: exposed on ``ImageResource/\(enumName)`` "
        output += "and usable with `Image(\(label):)` and `UIImage(\(label):)`.\n"
    }

    output += "\n## Icons\n"

    for category in categories {
        output += "\n" + generateCategorySection(category: category)
    }

    return output
}

// MARK: - Main

func main() {
    print("🚀 Starting Iconography documentation generation...")

    let currentDirectory = FileManager.default.currentDirectoryPath
    let iconographyPath = "\(currentDirectory)/Resources/Sources/Core/Assets/Iconography.xcassets"
    let doccPath = "\(currentDirectory)/Resources/Sources/Core/Documentation.docc"
    let imagesPath = "\(doccPath)/Resources/Iconography"
    let outputFile = "\(doccPath)/Iconography.md"

    guard FileManager.default.fileExists(atPath: iconographyPath) else {
        print("❌ Error: Iconography.xcassets not found at \(iconographyPath)")
        exit(1)
    }

    print("📂 Scanning for icon categories...")
    let categories = findIconCategories(at: iconographyPath)

    guard !categories.isEmpty else {
        print("❌ Error: No icon categories found")
        exit(1)
    }

    for category in categories {
        print("  - \(category.name): \(category.icons.count) icons")
    }

    print("\n🖼️  Copying images...")
    copyImages(categories: categories, to: imagesPath)
    print("✅ Images copied to: \(imagesPath)")

    print("\n📝 Generating documentation...")
    do {
        try generateDocumentation(categories: categories).write(toFile: outputFile, atomically: true, encoding: .utf8)
        print("✅ Successfully generated: \(outputFile)")
    } catch {
        print("❌ Error writing file: \(error)")
        exit(1)
    }

    print("\n🎉 Done!")
}

main()
