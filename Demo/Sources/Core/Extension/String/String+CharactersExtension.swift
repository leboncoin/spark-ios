//
//  String+String+CharactersExtension.swift
//  SparkDemo
//
//  Created by robin.lemaire on 09/10/2025.
//  Copyright © 2025 Leboncoin. All rights reserved.
//

import SwiftUI

extension String {

    var acronym: String {
        return self.components(separatedBy: .whitespaces)
            .reduce("") { $0 + ($1.first.map(String.init) ?? "") }
            .uppercased()
    }
}
