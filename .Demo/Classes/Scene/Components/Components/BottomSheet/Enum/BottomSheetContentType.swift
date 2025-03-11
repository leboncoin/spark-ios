//
//  BottomSheetContentType.swift
//  SparkDemo
//
//  Created by robin.lemaire on 29/01/2025.
//  Copyright © 2025 Leboncoin. All rights reserved.
//

import SwiftUI

enum BottomSheetContentType: String, CaseIterable {
    case shortText
    case mediumText
    case longText

    // MARK: - Properties

    var text: String {
        switch self {
        case .shortText: "Quisque viverra tincidunt diam sed eleifend. Phasellus malesuada vitae dui a pharetra."
        case .mediumText: "Mauris justo turpis, iaculis ut nisl non, molestie lobortis libero. Morbi eget congue justo. Curabitur sit amet ultrices erat. In eleifend mauris ut lacus mollis, eu faucibus diam lobortis. Curabitur tincidunt felis magna, in sodales elit egestas ac. Aenean nibh nisi, hendrerit non magna et, egestas sollicitudin risus. Pellentesque dolor felis, vestibulum a tempor in, auctor ut risus. Nulla facilisi. Quisque sit amet neque elit. Aenean bibendum nibh sed dolor elementum, ut aliquet ex congue. Nullam interdum imperdiet justo, quis pretium velit volutpat non. Morbi id metus ut urna commodo ultrices et eget urna. Vestibulum ante ipsum primis in faucibus orci luctus et ultrices posuere cubilia curae; Maecenas rhoncus eros sed imperdiet scelerisque. Quisque velit enim, finibus et nulla at, venenatis euismod augue. Aenean non erat vel nisi faucibus ornare. Maecenas auctor dui mauris, quis bibendum massa lacinia vitae."
        case .longText: "Morbi et sodales ipsum. Curabitur ipsum justo, commodo non neque eu, varius bibendum tellus. Nunc vestibulum turpis metus, nec scelerisque elit dignissim ac. Quisque lacinia et orci vitae varius. Aenean augue tellus, convallis ac ultrices vitae, pulvinar ac lorem. Fusce eu eleifend dui. Maecenas vehicula ultrices mi, at facilisis elit molestie sit amet. Nullam lacus eros, ullamcorper faucibus arcu vel, aliquet ullamcorper tortor. Vivamus fringilla gravida imperdiet. Sed ut odio mauris. Curabitur pulvinar ex eu mauris volutpat auctor. Nullam a consectetur enim. Integer porta nibh a elit convallis, ut commodo turpis ultricies. Sed tristique bibendum libero vitae ornare. Curabitur eleifend tristique lectus nec facilisis. Curabitur facilisis eu est eget auctor. Ut augue lectus, accumsan eu condimentum sit amet, fringilla quis urna. Nunc in laoreet augue, a iaculis magna. Morbi lectus sem, varius mollis imperdiet a, imperdiet non erat. Nullam suscipit elit aliquet leo dapibus consectetur. Etiam finibus diam massa, eu elementum felis finibus nec. Suspendisse eu dictum lectus. Mauris tempus lorem semper diam luctus eleifend. In malesuada purus vitae ex placerat, quis gravida felis interdum. Cras tincidunt diam at urna porta porttitor. Cras eget dolor molestie, viverra neque vel, sagittis diam. Aliquam rutrum nec augue rutrum semper. Nulla elementum dapibus sem, congue congue erat aliquet eget. Aliquam posuere libero condimentum tincidunt iaculis. Nam tempus tellus nec ultrices euismod. Sed sed interdum diam, fringilla tempus purus. Nullam ligula nulla, viverra vel fringilla vitae, vehicula in metus. Aliquam ullamcorper ligula at posuere molestie. Etiam tincidunt leo et est convallis, vel hendrerit purus consequat. Ut tristique nisi in arcu pharetra finibus. Praesent molestie facilisis facilisis. Aenean auctor in libero in fringilla. Nam libero magna, ultrices sit amet nisl sed, fringilla egestas ipsum. In diam turpis, condimentum ut lectus sed, dignissim porta justo. Ut id eros a lacus bibendum bibendum et venenatis turpis. Nulla feugiat odio nulla, sit amet vulputate dolor tempus non. Ut vestibulum aliquet dui, sed sodales neque tempus pulvinar. Sed sagittis hendrerit sapien nec ullamcorper. Vestibulum auctor massa id mauris blandit, at maximus nisl vulputate."
        }
    }

    var description: String {
        self.rawValue.addSpacesBeforeCapitalLetter.capitalized
    }

    var isScrollView: Bool {
        return self == .longText
    }

    var otherDetent: PresentationDetent {
        switch self {
        case .shortText: .medium
        case .mediumText, .longText: .maxHeight
        }
    }

    var minHeight: CGFloat {
        switch self {
        case .shortText: 140
        case .mediumText, .longText: 200
        }
    }
}
