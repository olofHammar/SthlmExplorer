# SthlmExplorer
Welcome to SthlmExplorer, the ultimate app for tourists exploring Stockholm! This app is designed to provide an interactive and informative experience for visitors to Stockholm, including an interactive map and suggestions for great places to visit while here.

But SthlmExplorer is more than just a useful tool for travelers - it's also a showcase of my coding abilities. As the developer of this app, I've used SwiftUI to create a user-friendly and visually stunning app that is both functional and aesthetically pleasing.

Whether you're a traveler looking to explore Stockholm or a potential employer looking for a talented developer, SthlmExplorer is the perfect app for you. Enjoy your trip to Stockholm, and happy exploring!

## Available Content

- [Installation](#installation) 
- [Project Setup](#projectsetup)
- [Demo](#demo)

## Installation <a name="installation"></a>

Before you clone this project make sure you have the following software installed

- SwiftGen
- SwiftLint

> SwiftGen is a tool to automatically generate Swift code for resources of your projects (like images, localized strings, etc), to make them type-safe to use. [https://github.com/SwiftGen/SwiftGen](url)

SwiftGen is installed in your local computer and will be executed via a script under project Build Phases everytime you build the project. It will search for the configuration file `/swiftgen.yml` and auto-generate assets for you based on that configuration.

### SwiftGen Installation (Standard)
```
$ brew update
$ brew install swiftgen
```

### SwiftGen Installation (M1 Macs)

As of writing this, SwiftGen currently not supported by default on M1 Macs. However, it can be installed by running the Terminal with Rosetta, or by using Mint.

#### Installation with Rosetta
1. If Homebrew is already installed, and it was not installed by running terminal with Rosetta, uninstall it:
```
$ /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/uninstall.sh)"
```
2. Create a duplicate of the Terminal app and rename it to e.g. 'Terminal (Rosetta)'.
3. Right click the copied terminal app, get info and check 'Run with Rosetta'.
4. Install Homebrew as usual, using the Rosetta Terminal
```
$ /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
```
5. Install SwiftGen as usual
```
$ brew update
$ brew install swiftgen
```

### SwiftLint

> A tool to enforce Swift style and conventions, loosely based on the now archived [GitHub Swift Style Guide](https://github.com/github/swift-style-guide). SwiftLint enforces the style guide rules that are generally accepted by the Swift community. [https://github.com/realm/SwiftLint](url)

SwiftLint is installed in your local computer and will be executed via a script under project Build Phases everytime you build the project. It will search for the configuration file `/.swiftlint.yml` and apply the rules to your source code.


To install SwiftLint:
```
$ brew update
$ brew install swiftlint
```

#### Installation with Mint
To install Mint:
```
$ brew install mint
```
To Install SwiftGen:
```
$ sudo mint install SwiftGen/SwiftGen
```
To manually run SwiftGen (in project folder) :
```
$ swiftgen config run
```

## Project Setup <a name="projectsetup"></a>

### Libraries
This is a list of the libraries (Swift Package Manager) used in this Project:
- Firebase
- ShortcutFoundation
- ShortcutSwiftUI
- OrderedCollections

Local Packages
- Data
- Domain
- Location
- Model
- Navigation

### Common Grounds
- Deployment target: `iOS 16.0`
- It relies on [Swift Combine](https://developer.apple.com/documentation/combine) framework for the native `MVVM pattern`.

No authentication needed.

## Demo <a name="demo"></a>
Header: 
https://user-images.githubusercontent.com/70969820/219689822-3d0ab467-fa9c-45f4-9641-a238d522ca14.mp4


