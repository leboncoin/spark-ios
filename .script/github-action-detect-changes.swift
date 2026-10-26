#!/usr/bin/env swift
// Detects which CI jobs must run from the files changed since a base ref.
// Usage: .script/github-action-detect-changes.swift <base-ref>   (e.g. origin/main)
// Outputs (stdout and $GITHUB_OUTPUT when set):
//   run_build=true|false       Build the Spark package
//   run_tests=true|false       Run the tests
//   run_demo=true|false        Build the demo app
//   test_targets=<list>        Space separated test targets ("" means all)

import Foundation

// MARK: - Manifest

struct Manifest: Decodable {
    let targets: [Target]

    struct Target: Decodable {
        let name: String
        let type: String
        let path: String?
        let dependencies: [Dependency]
    }

    struct Dependency: Decodable {
        let name: String?

        private enum CodingKeys: String, CodingKey {
            case byName, target, product
        }

        init(from decoder: Decoder) throws {
            let container = try decoder.container(keyedBy: CodingKeys.self)
            let key = [CodingKeys.byName, .target, .product].first { container.contains($0) }
            guard let key else {
                self.name = nil
                return
            }
            var values = try container.nestedUnkeyedContainer(forKey: key)
            self.name = try? values.decode(String.self)
        }
    }
}

// MARK: - Helpers

func shell(_ arguments: [String]) throws -> Data {
    let process = Process()
    let pipe = Pipe()
    process.executableURL = URL(fileURLWithPath: "/usr/bin/env")
    process.arguments = arguments
    process.standardOutput = pipe
    try process.run()
    let data = pipe.fileHandleForReading.readDataToEndOfFile()
    process.waitUntilExit()
    guard process.terminationStatus == 0 else {
        throw NSError(domain: "shell", code: Int(process.terminationStatus), userInfo: [
            NSLocalizedDescriptionKey: "Command failed: \(arguments.joined(separator: " "))"
        ])
    }
    return data
}

func log(_ message: String) {
    FileHandle.standardError.write(Data((message + "\n").utf8))
}

func folder(of path: String) -> String {
    path.split(separator: "/", omittingEmptySubsequences: false).prefix(3).joined(separator: "/")
}

// MARK: - Changed Files

let baseRef = CommandLine.arguments.dropFirst().first ?? "origin/main"

let changedFilesOutput: String
if let env = ProcessInfo.processInfo.environment["CHANGED_FILES"] {
    changedFilesOutput = env
} else {
    changedFilesOutput = String(decoding: try shell(["git", "diff", "--name-only", "\(baseRef)...HEAD"]), as: UTF8.self)
}
let changedFiles = changedFilesOutput.split(separator: "\n").map(String.init).filter { !$0.isEmpty }

log("Changed files:")
changedFiles.forEach { log("  \($0)") }

// MARK: - Classification

let runAllFiles: Set<String> = [
    "Package.swift",
    "Makefile"
]

var runAll = false
var runBuild = false
var runDemo = false
var components = Set<String>()

for file in changedFiles {
    if file.hasSuffix(".md") {
        continue
    } else if ["Modules/Theming/", "Modules/Common/", ".tools/"].contains(where: file.hasPrefix) || runAllFiles.contains(file) {
        runAll = true
    } else if file.hasPrefix("Demo/") || file.hasPrefix(".demo/") || file == "project.yml" {
        runDemo = true
    } else if file.hasPrefix("Spark/") || file.hasPrefix("Resources/") {
        runBuild = true
        runDemo = true
    } else if file.hasPrefix("Modules/Components/") {
        let parts = file.split(separator: "/")
        if parts.count > 2 {
            components.insert(String(parts[2]))
        }
        runBuild = true
        runDemo = true
    }
}

// MARK: - Test Targets

var runTests = false
var testTargets = ""

if runAll {
    runBuild = true
    runTests = true
    runDemo = true
} else if !components.isEmpty {
    runTests = true
    let manifest = try JSONDecoder().decode(Manifest.self, from: shell(["swift", "package", "dump-package"]))

    // Core targets of every component (e.g. Badge -> SparkComponentBadge)
    let componentTargets = manifest.targets.filter {
        $0.type == "regular"
            && ($0.path?.hasPrefix("Modules/Components/") ?? false)
            && ($0.path?.hasSuffix("/Sources/Core") ?? false)
    }

    var impacted = Set(componentTargets
        .filter { target in components.contains { target.path == "Modules/Components/\($0)/Sources/Core" } }
        .map(\.name))

    // Add, transitively, every component target which depends on a modified component
    while true {
        let next = impacted.union(componentTargets
            .filter { $0.dependencies.contains { $0.name.map(impacted.contains) ?? false } }
            .map(\.name))
        if next.count == impacted.count { break }
        impacted = next
    }

    let impactedFolders = Set(manifest.targets
        .filter { impacted.contains($0.name) }
        .compactMap { $0.path.map(folder(of:)) })

    testTargets = Set(manifest.targets
        .filter { $0.type == "test" && $0.path.map { impactedFolders.contains(folder(of: $0)) } ?? false }
        .map(\.name))
        .sorted()
        .joined(separator: " ")

    log("Impacted components: \(impacted.sorted().joined(separator: " "))")
}

// MARK: - Output

let output = """
run_build=\(runBuild)
run_tests=\(runTests)
run_demo=\(runDemo)
test_targets=\(testTargets)

"""

print(output, terminator: "")

if let githubOutput = ProcessInfo.processInfo.environment["GITHUB_OUTPUT"],
   let handle = FileHandle(forWritingAtPath: githubOutput) {
    handle.seekToEndOfFile()
    handle.write(Data(output.utf8))
    try handle.close()
}
