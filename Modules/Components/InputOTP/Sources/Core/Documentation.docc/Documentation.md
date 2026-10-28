# SparkComponentInputOTP

Allows the user to enter a **one-time security code**.

## Overview

The component is available on **SwiftUI** and requires at least **iOS 17**.

### Introduction

The Input OTP component allows users to enter a **one-time security code**, typically numeric, used to validate **an authentification or security step**.

### Implementation

- On SwiftUI, you need to use the ``SparkInputOTP`` View.

### Rendering

#### Digits

| Default (6 digits) | 4 digits | 8 digits |
|:---:|:---:|:---:|
| ![InputOTP rendering with 6 digits.](inputOTP_digits_six.png) | ![InputOTP rendering with 4 digits.](inputOTP_digits_four.png) | ![InputOTP rendering with 8 digits.](inputOTP_digits_eight.png) |

#### Code Types

| Default (number) | Letter | Alphanumeric |
|:---:|:---:|:---:|
| ![InputOTP rendering with number code types](inputOTP_codetypes_number.png) | ![InputOTP rendering with letter code types](inputOTP_codetypes_letter.png) | ![InputOTP rendering with alphanumeric code types](inputOTP_codetypes_alphanumeric.png) |

#### States

| Default | On error | Disabled |
|:---:|:---:|:---:|
| ![InputOTP rendering with 6 digits.](inputOTP_digits_six.png) | ![InputOTP rendering with error state.](inputOTP_onError.png) | ![InputOTP rendering with disabled state.](inputOTP_isDisabled.png) | 

## Custom InputOTP

If you need to create a custom input OTP component, you can use the ``InputOTPToken`` struct, available from the theme with `theme.component.inputOTP`, to access theme-based style values.

The ``InputOTPToken`` provides:
- **Border properties** (``InputOTPToken/Border``): slot width and radius
- **Colors** (``InputOTPToken/Colors``): separator and slot (content, border, background) color tokens
- **Layout properties** (``InputOTPToken/Layout``): spacing and padding
- **Opacity** (``InputOTPToken/Opacity``): opacity for enabled and disabled states
- **Typography** (``InputOTPToken/Typography``): font token for the slot content
- **Size constants** (``InputOTPToken/Size``): slot and separator sizes

> Tip: If you only need specific tokens, you can use the individual categories directly. For example, use `theme.component.inputOTP.size` if you only need size constants, or `theme.component.inputOTP.colors` for color tokens.

### Resources

- Specification on [ZeroHeight](https://zeroheight.com/1186e1705/p/843453-input-otp)
- Design on [Figma](https://www.figma.com/design/0QchRdipAVuvVoDfTjLrgQ/Spark-Component-Specs?node-id=63821-3006)
