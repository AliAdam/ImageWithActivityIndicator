# ViewWithActivityIndicator



`ViewWithActivityIndicator` is a SwiftUI view that download and  display image from URL  and displaying Activity Indicator while loading . 

# ScreenShots

![N|Solid](https://github.com/AliAdam/ViewWithActivityIndicatorDemo/blob/master/preview.gif?raw=true)

 Demo app [ViewWithActivityIndicatorDemo](https://github.com/blackwiz4rd/ViewWithActivityIndicatorDemo).

## Installation

`ViewWithActivityIndicator` is a Swift Package and you can install it with Xcode 11:
- Copy SSH `git@github.com:blackwiz4rd/ViewWithActivityIndicator.git` or HTTPS `https://github.com/blackwiz4rd/ViewWithActivityIndicator.git` URL from github;
- Open **File/Swift Packages/Add Package Dependency...** in Xcode 11;
- Paste the URL and follow steps.

## Usage

`ViewWithActivityIndicator` must be initialized with a URL and optional placeholder image.

```swift
let url = ""

 ViewWithActivityIndicator(imageURL: url)

 ViewWithActivityIndicator(imageURL: url,placeHolder: "icon")
``` 

Using in a view:

```swift
import SwiftUI
import ViewWithActivityIndicator

struct ContentView : View {


    let loader: ViewLoader = ViewLoader(url: "https://picsum.photos/300")

    var body: some View {
        ViewWithActivityIndicator(placeHolder: "", showActivityIndicator: true, viewLoader: loader) {
            Image(uiImage: UIImage(data:self.loader.getData()) ?? UIImage())
        }
    } 
}
```

Using in a list:

```swift
import SwiftUI
import ViewWithActivityIndicator

struct ContentView : View {
let urls: [String]
let loader: ViewLoader = ViewLoader(url: "https://picsum.photos/300")

var body: some View {
List(urls, id: \.self) { url in
HStack {
ViewWithActivityIndicator(imageURL: url)
.frame(width: 100.0, height: 100.0)
Text("\(url)")
}
}
}
}
```

ViewLoaders allows to create multiple loaders given a String array:
```swift
@available(iOS 13.0, *)
public struct ViewLoaders {
    var loaders: [ViewLoader] = []
    init(urls: [String]) {
        for url in urls {
            loaders.append(ViewLoader(url: url))
        }
    }
}
```
