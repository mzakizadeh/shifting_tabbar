# Shifting Tabbar

A custom tabbar widget for Flutter framework. 

The design is inspired from Rally app (one of Material design studies).

<img style="float: right; margin-left: 40px" src="preview.gif">

## Usage

This widget is programmed to work with `TabController`. 
You just need to install and import it to your code and use it just like `TabBar`.

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

See example section for more detailed example
