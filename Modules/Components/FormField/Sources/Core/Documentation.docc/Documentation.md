# SparkComponentFormField

The Spark FormField provide context to your form elements easily, unifying an a proper way to show a label, required marker, help & status messages or counter in any input/field components. 

## Overview

The component is available on **UIKit** and **SwiftUI** and requires at least **iOS 16**.

### Implementation

- On SwiftUI, you need to use the ``FormFieldView`` View.
- On UIKit, you need to use the ``FormFieldUIView`` UIView.

### Rendering

With a title and helper
![Component rendering.](component.png)

With a counter (only for TextField & TextEditor/TextView) 
![Component rendering.](component_counter.png)

With a clear button 
![Component rendering.](component_clear_button.png)

## A11y

### Order

The reading order is as follows:
- Title
- Clear Button
- Content
- Helper
- Secondary Helper

### Label

#### Default Value

The **require** value (*) and the **clear button** buttons *accessibility labels* using **localization** (english and french only).

The default values are:

- Require: 
    - English: **Mandatory**
    - French: **Obligatoire**

- Clear Button: 
    - English: **Clear**
    - French: **Effacer**

#### Override Value

You can update accessibility Label and Value:
- UIKit: ``FormFieldUIView`` then override the **.accessibilityLabel** and **.accessibilityValue** on subviews:
    - ``FormFieldUIView/titleLabel``
    - ``FormFieldUIView/clearButton``
    - ``FormFieldUIView/helperLabel``
    - ``FormFieldUIView/secondaryHelperLabel``

- SwiftUI: 
    - Title: ``FormFieldView/titleAccessibilityLabel(_:)``
    - Clear Button: ``FormFieldView/clearButtonAccessibilityLabel(_:)``
    - Helper: ``FormFieldView/helperAccessibilityLabel(_:)``
    - Secondary Helper: ``FormFieldView/secondaryHelperAccessibilityLabel(_:)``
    - Secondary Helper (Value):``FormFieldView/secondaryHelperAccessibilityValue(_:)``

## Resources

- Specification on [ZeroHeight](https://zeroheight.com/1186e1705/p/423a01-form-field)
- Design on [Figma](https://www.figma.com/design/0QchRdipAVuvVoDfTjLrgQ/Spark-Component-Specs?node-id=44899-1278)
- Discussion on [Slack](https://adevinta.slack.com/archives/C071PA3MWAK)


