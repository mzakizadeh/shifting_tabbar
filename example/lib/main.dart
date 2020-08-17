import 'package:flutter/material.dart';
import 'package:shifting_tabbar/shifting_tabbar.dart';

void main() => runApp(MaterialApp(home: MyApp()));

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      // Define a controller for TabBar and TabBarViews
      home: DefaultTabController(
        length: 5,
        child: Scaffold(
          // Use ShiftingTabBar instead of appBar
          appBar: ShiftingTabBar(
            // Specify a color to background or it will pick it from primaryColor of your app ThemeData
            color: Colors.grey,
            // You can change brightness manually to change text color style to dark and light or
            // it will decide based on your background color
            // brightness: Brightness.dark,
            tabs: <ShiftingTab>[
              // Also you should use ShiftingTab widget instead of Tab widget to get shifting animation
              ShiftingTab(
                icon: const Icon(Icons.home),
                text: 'Test 1',
              ),
              ShiftingTab(
                icon: const Icon(Icons.directions_bike),
                text: 'Test 2',
              ),
              ShiftingTab(
                icon: const Icon(Icons.directions_car),
                text: 'Test 3',
              ),
              ShiftingTab(
                icon: const Icon(Icons.directions_transit),
                text: 'Test 4',
              ),
              ShiftingTab(
                icon: const Icon(Icons.directions_boat),
                text: 'Test 5',
              ),
            ],
          ),
          // Other parts of the app are exacly same as default TabBar widget
          body: const TabBarView(
            children: <Widget>[
              Icon(Icons.home),
              Icon(Icons.directions_bike),
              Icon(Icons.directions_car),
              Icon(Icons.directions_transit),
              Icon(Icons.directions_boat),
            ],
          ),
        ),
      ),
    );
  }
}
