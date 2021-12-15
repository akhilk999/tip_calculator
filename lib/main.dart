import 'package:flutter/material.dart';
import 'package:tip_calculator/calculator.dart';
import 'package:tip_calculator/home.dart';
import 'package:tip_calculator/settings.dart';

void main() {
  runApp(MyApp(
  ));
}
class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return ThemeBuilder(
      defaultBrightness: Brightness.light,
      builder: (context, _brightness){
        return MaterialApp(
            theme: ThemeData(
                primarySwatch: Colors.blue, brightness: _brightness
            ),
            home: BottomBar()
        );
      },
    );
  }
}

class BottomBar extends StatefulWidget {
  @override
  _BottomBarState createState() => _BottomBarState();
}

class _BottomBarState extends State<BottomBar> {
  int _currentIndex = 0;
  String _title = 'GardenGuide';
  final List<Widget> children = [
    Calculator(),
    Settings(),
  ];

  void onTappedBar(int index){
    setState(() {
      _currentIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[200],
      body: children[_currentIndex],
      bottomNavigationBar: BottomNavigationBar(
        iconSize: 25,
        selectedFontSize: 15,
        //selectedItemColor: Colors.grey[200],
        //unselectedItemColor: Colors.grey[400],
        currentIndex: _currentIndex,
        type: BottomNavigationBarType.fixed,
        items: [
          BottomNavigationBarItem(icon: Icon(Icons.search), label: 'Calculator'),
          BottomNavigationBarItem(icon: Icon(Icons.help), label: 'Settings'),
        ],
        onTap: (index) {
          setState(() {
            _currentIndex = index;
            switch (index) {
              case 0:
                {
                  _title = 'Calculator';
                }
                break;
              case 1:
                {
                  _title = 'Settings';
                }
                break;
            }
          });
        },
      ),
    );
  }
/*
  @override
  Widget build(BuildContext context){
    return Scaffold(
      body: Row(
        children: <Widget>[
          NavigationRail(
            onDestinationSelected: (int index) {
              setState(() {
                _currentIndex = index;
              });
            },
              selectedIndex: _currentIndex,
              labelType: NavigationRailLabelType.selected,
              destinations: const <NavigationRailDestination>[
                NavigationRailDestination(
                  icon: Icon(Icons.favorite_border),
                  selectedIcon: Icon(Icons.favorite),
                  label: Text('First'),
                ),
                NavigationRailDestination(
                  icon: Icon(Icons.bookmark_border),
                  selectedIcon: Icon(Icons.book),
                  label: Text('Second'),
                ),
                NavigationRailDestination(
                  icon: Icon(Icons.star_border),
                  selectedIcon: Icon(Icons.star),
                  label: Text('Third'),
                ),
              ],
              ),
          VerticalDivider(thickness: 1, width: 1),
          Expanded(child: children[_currentIndex]),
        ],
      ),
    );
  }*/


/*
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return new Scaffold(
      body: children[_currentIndex],
      bottomNavigationBar: BottomNavigationBar(
        onTap: onTappedBar,
        currentIndex: _currentIndex,
        items: [
          BottomNavigationBarItem(
              icon: Icon(Icons.home),
              title: Text('Home'),
              backgroundColor: Colors.blue
          ),
          BottomNavigationBarItem(
              icon: Icon(Icons.dns),
              title: Text('Calculator'),
              backgroundColor: Colors.blue

          ),
          BottomNavigationBarItem(
              icon: Icon(Icons.settings),
              title: Text('Settings'),
              backgroundColor: Colors.blue
          ),
        ],
      ),
    );
  }*/
}
