[![pub package](https://img.shields.io/badge/pub-v0.1.0-orange.svg)](https://pub.dartlang.org/packages/shifting_tabbar)


# Shifting TabBar

A custom tabbar widget for Flutter framework. 

The design is inspired from Rally app (one of Material design studies).

<img align="right" width="248" height="512" src="https://media.giphy.com/media/35TAoEQmPBLFwEpInv/giphy.gif">

## Usage

This widget is programmed to work with `TabController`. 
You just need to install and import it to your code and use it just like `TabBar`.

Use installing section from top to get help to install the package and import it to your code.

**Don't foget to use `DefaultTabController` as an ancestor widget if you don't specify controller manually!**

```
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

See example section and git repository for more detailed example.
