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


/*class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
       backgroundColor: Colors.green[600],
        body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Container(
              child: Text(
                  'Tip Calculator',
                   style: TextStyle(fontSize: 40, color: Colors.grey[200]),),
            ),
            Flexible(
              child: FractionallySizedBox(
                heightFactor: 0.4,
              ),
            ),
            Flexible(
              child: FractionallySizedBox(
                heightFactor: 0.17,
                widthFactor: 0.4,
                child: RaisedButton(
                  color: Colors.grey[200],
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(5)
                  ),
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => bottomBar())
                    );
                  },
                  child: Text(
                    "Next",
                    style: TextStyle(fontSize: 20, color: Colors.green[800],)
                  ),
                ),
              )
            )
          ],
        ),
      )
    );
  }
}*/

class BottomBar extends StatefulWidget {
  @override
  _BottomBarState createState() => _BottomBarState();
}

class _BottomBarState extends State<BottomBar> {
  int _currentIndex = 0;
  final List<Widget> children = [
    Home(),
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
  }
}
