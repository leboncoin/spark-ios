# SparkComponentSelectionControls

The Spark Selection Controls is composed by three components:
- 1. Checkbox/CheckboxGroup
- 2. RadioButton/RadioGroup
- 3. Toggle/Switch

## Checkbox

### Overview

The checkbox/checkboxGroup are available on **UIKit** and **SwiftUI** and requires at least **iOS 16**.

It is a small square used to select or deselect multiple options in a list.

#### Implementation

- On SwiftUI, you need to use :
    - the ``SparkCheckbox`` View for a single checkbox.
    - the ``SparkCheckboxGroup`` View for a list of checkbox.
- On UIKit, you need to use :
    - the ``SparkUICheckbox`` which inherit from an UIControl for a single checkbox.
    - the ``SparkUICheckboxGroup`` which inherit from an UIControl for a list of checkbox.

#### Rendering

- Default :
![Component rendering.](checkbox_unselected.png)

- When the selection state value is .selected :
![Component rendering.](checkbox_selected.png)

- When the selection state value is .indeterminate :
![Component rendering with the indeterminate selection state.](checkbox_indeterminate.png)

- With a short title : 
![Component rendering with a short title.](checkbox_with_title.png)

- With a multiline title : 
![Component rendering with a multiline title.](checkbox_with_mutliline.png)

- When the disabled state is active : 
![Component rendering when isEnabled is false.](checkbox_disabled.png)

- A group : 
![Component rendering.](checkboxGroup.png)

### A11y

- If the *UIAccessibility.isReduceMotionEnabled* is true, no animation will be played when the isSelected value changed.
- If you not provide a text, you must set the **accessibilityLabel**.

### Resources

- Specification on [ZeroHeight](https://zeroheight.com/1186e1705/p/76f5a8-checkbox)
- Design on [Figma](https://www.figma.com/design/0QchRdipAVuvVoDfTjLrgQ/Spark-Component-Specs?node-id=127-1880)








## RadioButton

### Overview

The radioButton/radioGroup are available on **UIKit** and **SwiftUI** and requires at least **iOS 16**.

It is a small circle used to select only one option from a list of choices.

#### Implementation

- On SwiftUI, you need to use :
    - the ``SparkRadioButton`` View for a single radioButton.
    - the ``SparkRadioGroup`` View for a list of radioButton.
- On UIKit, you need to use :
    - the ``SparkUIRadioButton`` which inherit from an UIControl for a single radioButton.
    - the ``SparkUIRadioGroup`` which inherit from an UIControl for a list of radioButton.

#### Rendering

- Default :
![Component rendering.](radioButton_selected.png)

- When the isSelected value is true :
![Component rendering.](radioButton_unselected.png)

- With a short title : 
![Component rendering with a short title.](radioButton_with_title.png)

- With a multiline title : 
![Component rendering with a multiline title.](radioButton_with_mutliline.png)

- When the disabled state is active : 
![Component rendering when isEnabled is false.](radioButton_disabled.png)

- A group : 
![Component rendering.](radioGroup.png)

### A11y

- If the *UIAccessibility.isReduceMotionEnabled* is true, no animation will be played when the selectionState value changed.
- If you not provide a text, you must set the **accessibilityLabel**.

### Resources

- Specification on [ZeroHeight](https://zeroheight.com/1186e1705/p/98058f-radio-button)
- Design on [Figma](https://www.figma.com/design/0QchRdipAVuvVoDfTjLrgQ/Spark-Component-Specs?node-id=127-6137)








## Toggle/Switch

### Overview

The toggle/switch is available on **UIKit** and **SwiftUI** and requires at least **iOS 16**.

It is a control that toggles between on and off states.

#### Implementation

- On SwiftUI, you need to use the ``SparkToggle`` View.
- On UIKit, you need to use the ``SparkUISwitch`` which inherit from an UIControl.

#### Rendering

- Default :
![Component rendering.](toggle_on.png)

- When the isOn value is false :
![Component rendering.](toggle_off.png)

- With a short title : 
![Component rendering with a short title.](toggle_with_title.png)

- With a multiline title : 
![Component rendering with a multiline title.](toggle_with_mutliline.png)

- When the disabled state is active : 
![Component rendering when isEnabled is false.](toggle_disabled.png)

### A11y

- If the *UIAccessibility.isOnOffSwitchLabelsEnabled* is true, the icons will be displayed.
- If the *UIAccessibility.isReduceMotionEnabled* is true, no animation will be played when the isOn value changed.
- If the high contrasts is enabled, , the icons will be displayed.
- If you not provide a text, you must set the **accessibilityLabel**.

### Resources

- Specification on [ZeroHeight](https://zeroheight.com/1186e1705/p/58a2c6-switch)
- Design on [Figma](https://www.figma.com/design/0QchRdipAVuvVoDfTjLrgQ/Spark-Component-Specs?node-id=267-8340)
