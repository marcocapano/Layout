# Layout 
📏📐 A lightweight wrapper around AutoLayout.

## Installation
Clone the repository and drop the Sources folder into your project.
Hopefully the project will soon be available via Cocoapods.

## Discussion
A lot of different layout extensions exist out there, proposing different solutions to the problem of NSLayoutAnchor’s APIs.
Some use functions to compose layouts, some use a more functional approach,
some use a proxy approach, some simply add syntactic sugar to the existing API’s.

Sometimes though you might want to use **different approaches** to layout within the **same app**. 

Layout doesn’t want to pick one solution and make you choose. Instead, it gives you the choice and flexibility to use whatever approach you want without adding layers of abstractions, allowing you to even pick and mix the **standard APIs** for some cases.

## Usage
Using Layout, you can

### Use common layouts:
```swift
//This will wrap view inside container, with margins.
view.box(in: container, edges: UIEdgeInsets(top: 8, left: 8, bottom: -8, right: -8))

//This will set the button's center.
button.center(in: view)
```

### Set a single constraint:
```swift
//Say we want the button's width to be half that of the view
button.layoutProxy.width.equal(to: view.widthAnchor, multiplier: 0.5) 

//You can even store it to activate/deactivate later
let heightConstraint = button.layoutProxy.height.equal(to: 100)
heightConstraint.isActive = false
```

### Set them all:
```swift
label.layout {
    $0.height.equal(to: view.heightAnchor, multiplier: 0.33)
    $0.width.equal(to: view.widthAnchor, multiplier: 0.5)
    $0.centerX.equal(to: view.centerXAnchor, offsetBy: 16)
    $0.centerY.equal(to: view.centerYAnchor)
}
```

### Or even go *fully functional*:
```swift
label.layout {
     $0.height == view.heightAnchor/3
     $0.width == view.widthAnchor*0.5
     $0.centerX == view.centerXAnchor + 16
     $0.centerY == view.centerYAnchor
}
```

## Plans

The project is pretty usable but lacks some things:
1. Tests for functional operators and UIView convenience functions
2. Cocoapods support
3. Travis configuration



## Acknowledgment

The idea came from John Sundell’s article [”Building DSLs in Swift” ][1]. I found it really interesting and thought  that we see to many good ideas and starting points inside blog posts, tutorials and books and most of the times it ends there.
Instead, they could act as fuel for many many open source projects, so I decided to continue the project and adding operators, some functions and a test suite.


[1]:	https://www.swiftbysundell.com/posts/building-dsls-in-swift
