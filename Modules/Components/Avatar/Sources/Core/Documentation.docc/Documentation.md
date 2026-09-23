# SparkComponentAvatar

The Spark Avatars are visual representations of private and professional users. They help humanize and personalize the platform experience.

## Overview

Avatars are visual representations of private and professional users. They help humanize and personalize the platform experience.

The component is available on **SwiftUI** (only) and requires at least **iOS 16**.

There are two public avatar components:
- ``SparkUserAvatar``: For displaying user avatars with initials extracted from placeholder text
- ``SparkCompanyAvatar``: For displaying company avatars with a building icon placeholder

### Features

Both avatar components support:
- **Images**: From `Image` or `URL` sources
- **Placeholders**: Automatically displayed when image is loading or unavailable
  - User avatars: First letter of placeholder text (e.g., "Bob Doe" → "B")
  - Company avatars: Building icon
- **Sizes**: Some sizes from xs to xxxl
- **Corner Views**: Badges or custom views can be attached to the bottom-trailing corner
- **Actions**: Optional tap actions
- **Border**: Optional border display

### Rendering

#### With Placeholder

| User | Company |
|:---:|:---:|
| ![User avatar with placeholder.](avatar_user_placeholder.png) | ![Company avatar with placeholder.](avatar_company_placeholder.png) |

#### With Image

| User | Company |
|:---:|:---:|
| ![User avatar with image.](avatar_user_image.png) | ![Company avatar with image.](avatar_company_image.png) |

#### With Corner Badge

| User | Company |
|:---:|:---:|
| ![User avatar with corner badge.](avatar_user_image_corner_badge.png) | ![Company avatar with corner badge.](avatar_company_image_corner_badge.png) |

#### With Corner Button

| User | Company |
|:---:|:---:|
| ![User avatar with corner button.](avatar_user_placeholder_corner_button.png) | ![Company avatar with corner button.](avatar_company_placeholder_corner_button.png) |


## Sizes

Both avatar types support seven different sizes:

| XS | SM | MD | LG | XL | XXL | XXXL |
|:---:|:---:|:---:|:---:|:---:|:---:|:---:|
| ![Size XS.](avatar_size_xs.png) | ![Size SM.](avatar_size_sm.png) | ![Size MD.](avatar_size_md.png) | ![Size LG.](avatar_size_lg.png) | ![Size XL.](avatar_size_xl.png) | ![Size XXL.](avatar_size_xxl.png) | ![Size XXXL.](avatar_size_xxxl.png) |

### Accessibility

The avatar view is accessible via ``AvatarAccessibilityIdentifier/view``.

### Resources

- Specification on [ZeroHeight](https://zeroheight.com/1186e1705/p/8342f3-avatar)
- Design on [Figma](https://www.figma.com/design/0QchRdipAVuvVoDfTjLrgQ/Spark-Component-Specs?node-id=57191-9907)
