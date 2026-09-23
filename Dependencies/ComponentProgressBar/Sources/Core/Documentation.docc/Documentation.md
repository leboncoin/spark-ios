# SparkComponentProgressBar

A progress bar visually represents the completion status of a task or process.

## Overview

The progress bar component is used to display the length and your 
progression inside the process, or to express a waiting time. 
This waiting time can be either determinate or indeterminate.

- Determinate progress bar: We use this variant when the progress of a process is known.
- Indeterminate progress bar: We use this variant when the progress of a process is unknown.

The component is available on **UIKit** and **SwiftUI** and requires at least **iOS 16**.

### Implementation

- ProgressBar :
    - On SwiftUI, you need to use the ``SparkProgressBar`` View.
    - On UIKit, you need to use the ``SparkUIProgressBar`` inherits from UIView.

- ProgressBarIndeterminate :
    - On SwiftUI, you need to use the ``SparkProgressBarIndeterminate`` View.
    - On UIKit, you need to use the ``SparkUIProgressBarIndeterminate`` inherits from UIView.

### Accessibility

- ProgressBar -> By default, the component is accessible. To see more information read the 
documentation in ``SparkProgressBar``or ``SparkUIProgressBar``.

- ProgressBarIndeterminate -> By default, the component is not accessible. To see more information read the 
documentation in ``SparkProgressBarIndeterminate``or ``SparkUIProgressBarIndeterminate``.

### Rendering

![ProgressBar rendering.](progress_bar_default.png)

### Resources

- Specification on [ZeroHeight](https://zeroheight.com/1186e1705/p/89544a-progress-bar)
- Design on [Figma](https://www.figma.com/design/0QchRdipAVuvVoDfTjLrgQ/Spark-Component-Specs?node-id=7229-1207)
