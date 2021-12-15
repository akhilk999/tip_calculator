import 'package:flutter/material.dart';
import 'package:tip_calculator/main.dart';

 String region ='';
class Calculator extends StatefulWidget {
  const Calculator({Key key}) : super(key: key);
  @override
  _CalculatorState createState() => _CalculatorState();
}

class _CalculatorState extends State<Calculator> {
  int charLength = 0;

  final _formKey = GlobalKey<FormState>();
  _onChanged(String value) {
    region = value;
    setState(() {
      charLength = value.length;
    });
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          children: [
            Container(
              width: 200,
              child: Form(
                key: _formKey,
                child: Column(
                    children:[
                      Container(
                    height: 200,
                  ),
                      Container(
                        width: 200,
                        child: TextFormField(
                          textAlign: TextAlign.center,
                          //controller: textController,
                          //autocorrect: true,
                          decoration:
                          InputDecoration(labelText: 'Enter State here',
                              enabledBorder: OutlineInputBorder(
                                borderSide: BorderSide(width: 3, color: Colors.blue),
                                borderRadius: BorderRadius.circular(15),
                          ),
                              focusedBorder: OutlineInputBorder(
                                borderSide: BorderSide(width: 3, color: Colors.red),
                                borderRadius: BorderRadius.circular(15),
                              )),
                          onChanged: _onChanged,
                          validator: (value) {
                            if (value == null) {
                              return 'Please enter your state';
                            }
                            return null;
                          },
                        ),
                      ),
                      Container(
                        height: 75.0,
                        width: 200.0,
                        padding: EdgeInsets.fromLTRB(50, 20, 50, 20),
                        child: RaisedButton(
                          color: Colors.green[700],
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(5.0)),
                          child: Text("Submit",
                              style: TextStyle(
                                color: Colors.grey[200],
                              )),
                          onPressed: () {
                            //Navigator.push(context, MaterialPageRoute(settings: RouteSettings(name: "/southernRegion"),builder: (context) => pacificCoastalRegion()));
                          },
                        ),
                      ),
                    ]
                ),
              ),
            ),
          ],

        ),
      ),
    );
  }
}
