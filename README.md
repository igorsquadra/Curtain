<p align="center">
   <img width="650" src="https://raw.githubusercontent.com/igorsquadra/Curtain/develop/Curtain/Assets/Curtain.png" alt="Curtain Logo">
</p>

<p align="center">
    <a href="https://developer.apple.com/swift/">
        <img src="https://img.shields.io/badge/Swift-5.0-orange.svg?style=flat" alt="Swift 5.0">
    </a>
    <a href="http://cocoapods.org/pods/Curtain">
        <img src="https://img.shields.io/cocoapods/v/Curtain.svg?style=flat" alt="Version">
    </a>
    <a href="https://github.com/Carthage/Carthage">
        <img src="https://img.shields.io/badge/Carthage-compatible-4BC51D.svg?style=flat" alt="Carthage Compatible">
    </a>
    <a href="http://cocoapods.org/pods/Curtain">
        <img src="https://img.shields.io/cocoapods/p/Curtain.svg?style=flat" alt="Platform">
    </a>
    <a href="https://igorsquadra.github.io/Curtain">
        <img src="https://github.com/igorsquadra/Curtain" alt="Documentation">
    </a>
</p>

<br/>

`Curtain` is a swift pod that helps you implementing a nice background animation for your timer.
Really easy to implement, use the available options to customize the background color, the background filling direction, and the exit animation.

## Example

<img src="https://raw.githubusercontent.com/igorsquadra/Curtain/develop/Curtain/Assets/Vertical.gif" alt="Example Application Screenshot">

<img src="https://raw.githubusercontent.com/igorsquadra/Curtain/develop/Curtain/Assets/Horizontal.gif" alt="Example Application Screenshot" align="right">

Use `Curtain` to animate your timer. Customize your exit animation and background color to make the user experience way better. Use it in two different direction: vertical or horizontal.

## Installation

### CocoaPods

`Curtain` is available through [CocoaPods](http://cocoapods.org). To install
it, simply add the following line to your Podfile:

```bash
pod 'Curtain'
```

### Carthage

[Carthage](https://github.com/Carthage/Carthage) is a decentralized dependency manager that builds your dependencies and provides you with binary frameworks.

To integrate Curtain into your Xcode project using Carthage, specify it in your `Cartfile`:

```ogdl
github "igorsquadra/Curtain"
```

Run `carthage update --platform iOS` to build the framework and drag the built `Curtain.framework` into your Xcode project. 

On your application targets’ “Build Phases” settings tab, click the “+” icon and choose “New Run Script Phase” and add the Framework path as mentioned in [Carthage Getting started Step 4, 5 and 6](https://github.com/Carthage/Carthage/blob/master/README.md)


## Usage
To implement  `Curtain` create a `BackgroundProgressView` and add it as subview.

```swift
import Curtain

// Initialize the progress view.
var backgroundProgressView: BackgroundProgressView!
backgroundProgressView = BackgroundProgressView.init(frame:
    CGRect.init(
        x: 0,
        y: 0,
        width: 0,
        height: 0
))

// Add it as subview.
view.addSubview(backgroundProgressView)
```

Use `setup` method to customize following parameters:

```swift
// Setup your progress view.
backgroundProgressView.setup(
    withDirection: .vertical, // Direction type should be .horizontal or .vertical.
    withTime: 15.0,
    view: view.frame,
    color: UIColor.init(red: 109/255, green: 212/255, blue: 0/255, alpha: 1.0),
    initialSize: 0, // Set initial size, default is 0.
    autoreset: true, // If false the progress view remains full at the end of timer.
    resetType: .linear // The reset animation should be .linear or .fade
)
```

Call `start` method to start the animation. Use `time` parameters to start the animation with a new time (if `nil` the used time is the one passed in the `setup` method).

```swift
// Start progress animation
backgroundProgressView.start(withTime: 35.0)
```

With `reset` method the progress view will be resetted animated.

```swift
// Reset progress animation
backgroundProgressView.reset()
```

## Contributing
Contributions are welcome 🚀

## License

```
Curtain
Copyright (c) 2020 igorsquadra <me@igorsquadra.com>

Permission is hereby granted, free of charge, to any person obtaining a copy
of this software and associated documentation files (the "Software"), to deal
in the Software without restriction, including without limitation the rights
to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
copies of the Software, and to permit persons to whom the Software is
furnished to do so, subject to the following conditions:

The above copyright notice and this permission notice shall be included in
all copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN
THE SOFTWARE.
```
