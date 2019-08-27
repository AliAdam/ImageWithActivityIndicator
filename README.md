# ImageWithActivityIndicator



`ImageWithActivityIndicator` is a SwiftUI view that download and  display image from URL  and displaying Activity Indicator while loading . 

# ScreenShots

![N|Solid](https://github.com/AliAdam/ImageWithActivityIndicatorDemo/blob/master/preview.gif?raw=true)

 Demo app [ImageWithActivityIndicatorDemo](https://github.com/AliAdam/ImageWithActivityIndicatorDemo).

## Installation

`ImageWithActivityIndicator` is a Swift Package and you can install it with Xcode 11:
- Copy SSH `git@github.com:AliAdam/ImageWithActivityIndicator.git` or HTTPS `https://github.com/AliAdam/ImageWithActivityIndicator.git` URL from github;
- Open **File/Swift Packages/Add Package Dependency...** in Xcode 11;
- Paste the URL and follow steps.

## Usage

`ImageWithActivityIndicator` must be initialized with a URL and optional placeholder image.

```swift
let url = ""

 ImageWithActivityIndicator(imageURL: url)

 ImageWithActivityIndicator(imageURL: url,placeHolder: "icon")
``` 

Using in a view:

```swift
import SwiftUI
import ImageWithActivityIndicator

struct ContentView : View {

let url = ""

var body: some View {
ImageWithActivityIndicator(imageURL: url)
}
}
```

Using in a list:

```swift
import SwiftUI
import ImageWithActivityIndicator

struct ContentView : View {

let urls: [String]

var body: some View {
List(urls, id: \.self) { url in
HStack {
ImageWithActivityIndicator(imageURL: url)
.frame(width: 100.0, height: 100.0)
Text("\(url)")
}
}
}
}
```


