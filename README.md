# Table of Contents

- [AADialogs](#section-id-4)
- [Description](#section-id-10)
- [Demonstration](#section-id-16)
- [Requirements](#section-id-26)
- [Installation](#section-id-32)
- [CocoaPods](#section-id-37)
- [Carthage](#section-id-63)
- [Manual Installation](#section-id-82)
- [Getting Started](#section-id-87)
- [Define your dialog as UIViewController](#section-id-104)
- [Show your dialog](#section-id-112)
- [Hide your dialog in that view controller ](#section-id-132)
- [Method signature with custom configuration](#section-id-150)
- [Contributions & License](#section-id-156)


<div id='section-id-4'/>

#AADialogs

[![Swift 4.0](https://img.shields.io/badge/Swift-4.0-orange.svg?style=flat)](https://developer.apple.com/swift/) [![Carthage compatible](https://img.shields.io/badge/Carthage-compatible-4BC51D.svg?style=flat)](https://github.com/Carthage/Carthage) [![CocoaPods](https://img.shields.io/cocoapods/v/AADialogs.svg)](http://cocoadocs.org/docsets/AADialogs) [![License MIT](https://img.shields.io/badge/License-MIT-blue.svg?style=flat)](https://github.com/Carthage/Carthage) [![Build Status](https://travis-ci.org/EngrAhsanAli/AADialogs.svg?branch=master)](https://travis-ci.org/EngrAhsanAli/AADialogs) 
![License MIT](https://img.shields.io/github/license/mashape/apistatus.svg) [![CocoaPods](https://img.shields.io/cocoapods/p/AADialogs.svg)]()


<div id='section-id-10'/>

##Description

AADialogs - An easy way to handle your custom dialogs using storyboard in iOS.

<div id='section-id-16'/>

##Demonstration

![](https://github.com/EngrAhsanAli/AADialogs/blob/master/Screenshots/AADialogs.png)


To run the example project, clone the repo, and run `pod install` from the Example directory first.


<div id='section-id-26'/>

##Requirements

- iOS 9.0+
- Xcode 8.0+
- Swift 3+

<div id='section-id-32'/>

# Installation

`AADialogs` can be installed using CocoaPods, Carthage, or manually.

<div id='section-id-37'/>

##CocoaPods

`AADialogs` is available through [CocoaPods](http://cocoapods.org). To install CocoaPods, run:

`$ gem install cocoapods`

Then create a Podfile with the following contents:

```
source 'https://github.com/CocoaPods/Specs.git'
platform :ios, '9.0'
use_frameworks!

target '<Your Target Name>' do
pod 'AADialogs' , '1.0'
end

```

Finally, run the following command to install it:
```
$ pod install
```



<div id='section-id-63'/>

##Carthage

To install Carthage, run (using Homebrew):
```
$ brew update
$ brew install carthage
```
Then add the following line to your Cartfile:

```
github "EngrAhsanAli/AADialogs" "master"
```

Then import the library in all files where you use it:
```swift
import AADialogs
```


<div id='section-id-82'/>

##Manual Installation

If you prefer not to use either of the above mentioned dependency managers, you can integrate `AADialogs` into your project manually by adding the files contained in the Classes folder to your project.


<div id='section-id-87'/>

#Getting Started
----------

<div id='section-id-104'/>

##Define your dialog as UIViewController
```swift
let alertVC = UIStoryboard(name: #storyboard#, bundle: nil).instantiateViewController(withIdentifier: #withId#)
```

<div id='section-id-112'/>

##Show your dialog
```swift
alertVC.aa_show_alert()
```
<div id='section-id-132'/>

##Hide your dialog in that view controller 

```swift
aa_hide_alert(animation: .zoomOut)
```

<div id='section-id-150'/>

##Method signature with custom configuration

You can use following properties: 
```swift
aa_show_alert(duration: TimeInterval,
springDamping: AAViewDamping,
animation: AAViewAnimators,
blurEffect: UIBlurEffectStyle?,
viewController: UIViewController?,
completion: ((Bool, UIViewController) -> ())?) 

aa_hide_alert(duration: TimeInterval,
springDamping: AAViewDamping,
animation: AAViewAnimators,
completion: (() -> ())?)

```

<div id='section-id-156'/>

#Contributions & License

`AADialogs` is available under the MIT license. See the [LICENSE](./LICENSE) file for more info.

`AADialogs` uses `AAViewAnimator` for custom view animations.
See `AAViewAnimator` at https://github.com/EngrAhsanAli/AAViewAnimator

Pull requests are welcome! The best contributions will consist of substitutions or configurations for classes/methods known to block the main thread during a typical app lifecycle.

I would love to know if you are using `AADialogs` in your app, send an email to [Engr. Ahsan Ali](mailto:hafiz.m.ahsan.ali@gmail.com)
