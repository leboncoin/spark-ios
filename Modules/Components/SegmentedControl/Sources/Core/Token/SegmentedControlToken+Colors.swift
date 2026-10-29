//
//  SegmentedControlToken+Colors.swift
//  SparkComponentSegmentedControl
//
//  Created by robin.lemaire on 27/10/2026.
//  Copyright © 2026 Leboncoin. All rights reserved.
//

@_spi(SI_SPI) import SparkTheming

// MARK: - Colors

public extension SegmentedControlToken {

    /// Contains the color token values of the SegmentedControl.
    struct Colors: Equatable {

        // MARK: - Properties

        let theme: any Theme

        /// The background color of the selected item in the accessibility list.
        public var accessibilitySelectedBackground: any ColorToken {
            return self.theme.colors.support.support
        }

        /// The tint color of the selected item in the accessibility list.
        public var accessibilitySelectedTint: any ColorToken {
            return self.theme.colors.support.onSupport
        }

        /// The background color of the segmented control.
        public var background: any ColorToken {
            return self.theme.colors.base.surface
        }

        /// The border color of the segmented control.
        public var border: any ColorToken {
            return self.theme.colors.base.outline
        }

        /// The content (text and icon) color of an item.
        public var itemContent: any ColorToken {
            return self.theme.colors.support.onSupportContainer
        }

        /// The color of the separators between the items.
        public var separator: any ColorToken {
            return self.theme.colors.base.outline.opacity(self.theme.dims.dim3)
        }

        /// The background color of the selected item.
        public var selectedItemBackground: any ColorToken {
            return self.theme.colors.support.supportContainer
        }

        /// The border color of the selected item.
        public var selectedItemBorder: any ColorToken {
            return self.theme.colors.support.support
        }

        // MARK: - Methods

        /// The background color of an item. Only an unselected pressed item has a background.
        public func itemBackground(isSelected: Bool, isPressed: Bool) -> any ColorToken {
            return switch (isSelected, isPressed) {
            case (false, true): self.theme.colors.states.supportContainerPressed
            default: ColorTokenClear()
            }
        }

        // MARK: - Equatable

        public static func == (lhs: Colors, rhs: Colors) -> Bool {
            return lhs.theme.equals(rhs.theme)
        }
    }
}
