# SparkComponentInputOTP

Allows the user to enter a **one-time security code**.

## Overview

The component is available on **SwiftUI** and requires at least **iOS 16**.

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

### Resources

- Specification on [ZeroHeight](https://zeroheight.com/1186e1705/p/843453-input-otp)
- Design on [Figma](https://www.figma.com/design/0QchRdipAVuvVoDfTjLrgQ/Spark-Component-Specs?node-id=63821-3006)
