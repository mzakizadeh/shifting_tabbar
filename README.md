# Shifting TabBar

A custom tab bar widget for Flutter framework. 

The design is inspired from Rally project (one of material design studies).

[![pub package](https://img.shields.io/badge/pub-v0.3.0-orange.svg)](https://pub.dartlang.org/packages/shifting_tabbar)

<img align="right" width="248" height="512" src="https://media.giphy.com/media/35TAoEQmPBLFwEpInv/giphy.gif">

## Getting Started

### Add the package to `pubspec.yaml`

```yaml
dependencies:
    ...
    shifting_tabbar: ^0.3.0
```

### Import the package

```dart
import 'package:shifting_tabbar/shifting_tabbar.dart';
```

### Basic Usage

This widget is programmed to work with `TabController`. 
You just need to install and import it to your code and use it just like `TabBar`.

**Don't forget to use `DefaultTabController` as an ancestor widget if you don't specify controller manually!**

```dart
new ShiftingTabBar(
    tabs: [
        ShiftingTab(
            icon: Icon(Icons.directions_bike),
            text: "Test 1",
        ),
        ShiftingTab(
            icon: Icon(Icons.directions_car),
            text: "Test 2"
        ),
        ShiftingTab(
            icon: Icon(Icons.directions_transit),
            text: "Test 3"
        ),
    ],
)
```

See example folder in git repository for more detailed example.
