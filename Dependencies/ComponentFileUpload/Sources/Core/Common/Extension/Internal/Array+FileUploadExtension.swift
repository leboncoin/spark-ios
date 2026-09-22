//
//  Array+FileUploadExtension.swift
//  SparkComponentFileUpload
//
//  Created by robin.lemaire on 09/04/2026.
//  Copyright © 2026 Leboncoin. All rights reserved.
//

import Foundation

extension Array where Element == FileUpload {

    // MARK: - Methods

    mutating func appendIfUnique(_ item: Element) {
        guard self.notContains(item) else {
            return
        }

        self.append(item)
    }

    mutating func appendIfUnique(_ items: [Element]) {
        let uniqueItems = items.filter {
            self.notContains($0)
        }

        self.append(contentsOf: uniqueItems)
    }

    func notContains(_ id: String) -> Bool {
        !self.contains(where: { $0.id == id })
    }

    // MARK: - Private Methods

    private func notContains(_ item: Element) -> Bool {
        !self.contains(where: { $0.id == item.id })
    }
}
