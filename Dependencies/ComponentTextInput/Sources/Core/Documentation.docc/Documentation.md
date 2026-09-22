# SparkComponentTextInput

The Spark Text Input is composed by two components:
- 1. TextField
- 2. TextEditor

## TextEditor

### Overview

The text editor is available on **UIKit** and **SwiftUI** and requires at least **iOS 16**.

It can display and edit long-form text.

#### Implementation

- On SwiftUI, you need to use the ``SparkTextEditor`` View.
- On UIKit, you need to use the ``TextEditorUIView`` which inherit from an UITextView.

#### Rendering

With a multiline text
![Component rendering.](texteditor.png)

### A11y

- The accessibility label is equals to the placeholder value. 
- The accessibility value is equals to the text.

### Resources

- Specification on [ZeroHeight](https://zeroheight.com/1186e1705/p/365c2e-text-area--text-view)
- Design on [Figma](https://www.figma.com/design/0QchRdipAVuvVoDfTjLrgQ/Spark-Component-Specs?node-id=3661-22748)

## TextField

### Overview

The textfield is available on **UIKit** and **SwiftUI** and requires at least **iOS 16**.

It displays an editable text interface.

#### Implementation

- On SwiftUI, you need to use the ``SparkTextField`` View.
- On UIKit, you need to use the ``TextFieldUIView`` which inherit from an UITextField or ``TextFieldAddonsUIView`` which inherit from an UIControl.

#### Rendering

With side views and addons
![Component rendering.](textfield.png)

With without side view or addons
![Component rendering.](textfield-without-addons.png)

### A11y

- The accessibility label is equals to the placeholder value. 
- The accessibility value is equals to the text.

#### Side Views & Addons

- The accessibility label & value for side view and addons are managed by the consumer.

### Resources

- Specification on [ZeroHeight](https://zeroheight.com/1186e1705/p/773c60-input--text-field)
- Design on [Figma](https://www.figma.com/design/0QchRdipAVuvVoDfTjLrgQ/Spark-Component-Specs?node-id=267-8336)
