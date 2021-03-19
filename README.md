# Shifting TabBar

A custom tab bar widget for Flutter framework. 

The design is inspired from Rally project (one of material design studies).

[![pub package](https://img.shields.io/badge/pub-v1.0.0-blue.svg)](https://pub.dartlang.org/packages/shifting_tabbar)

<img align="right" width="248" height="512" src="https://drive.google.com/uc?export=view&id=1a4UkBFG7M9ZES9J4tai1zdFeAIkLPD2O">

## Getting Started

### Add the package to `pubspec.yaml`

```yaml
dependencies:
    ...
    shifting_tabbar: ^1.0.0
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
