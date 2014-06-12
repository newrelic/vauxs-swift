# Vaux's Swift

A simple demonstration of healthy async programming practices using Swift
that shows how to integrate the New Relic SDK for iOS and trace native 
Swift methods.

This code is discussed in detail on the New Relic blog:
    http://blog.newrelic.com/2014/06/12/instrumenting-swift-app/

## Getting started

1. Clone this repo
2. Open `vaux_s_swift.xcodeproj` in XCode 6
3. Open AppDelegate.swift and insert your New Relic App Token
4. Build and run the app in the iOS 8 simulator

## Features of Interest

### Initializing New Relic from Swift code

`AppDelegate.swift` includes an example of calling the New Relic
initialization code from a Swift app delegate.

### ImageFetcher

Vaux's Swift includes an implementation of an asynchronous image downloader
called ImageFetcher. ImageFetcher handles the work of downloading an image
from a URL, creating a UIImage from the downloaded data, and updating the
content of a UIImageView instance. This example uses NSURLConnection's
async API, blocks, and NROperationQueues to load images in parallel without
blocking the application's UI thread.

See `ImageFetcher.swift` for the implementation.

### Simplifying interacting with an Objective-C library

Vaux's Swift includes a `NRMethodTimer` class that makes it easy to 
instrument methods in your Swift code. 

See `NRHelpers.swift` for the implementation. Examples of using 
`NRMethodTimer` are shown in `ViewController.swift` and 
`ImageFetcher.swift`

