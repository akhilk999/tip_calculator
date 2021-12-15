import 'package:flutter/material.dart';
import 'package:tip_calculator/main.dart';

 String region ='';
var billAmount = 0;
double tipAmount = 0;
class Calculator extends StatefulWidget {
  const Calculator({Key key}) : super(key: key);
  @override
  _CalculatorState createState() => _CalculatorState();
}

class _CalculatorState extends State<Calculator> {
  BoxDecoration myBoxDecoration() {
    return BoxDecoration(
      border: Border.all(
          width: 2.0
      ),
      borderRadius: BorderRadius.all(
          Radius.circular(15.0) //                 <--- border radius here
      ),
    );
  }
  double _currentSliderValue = 10;
  double _currentSliderValue2 = 15;
  int charLength = 0;
  TextEditingController textController = new TextEditingController();
  _onChanged(String value) {
    setState(() {
      charLength = value.length;
    });
    billAmount = int.parse(textController.text);
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Center(
          child: Column(
            children: [
              Container(
                width: 200,
                child: Column(
                      children:[
                        Container(height: 100),
                        Container(
                          width: 200,
                          child: TextField(
                            controller: textController,
                            textAlign: TextAlign.center,
                            //controller: textController,
                            //autocorrect: true,
                            decoration:
                            InputDecoration(labelText: 'Enter Bill Amount',
                                enabledBorder: OutlineInputBorder(
                                  borderSide: BorderSide(width: 2),
                                  borderRadius: BorderRadius.circular(15),
                            ),
                                focusedBorder: OutlineInputBorder(
                                  borderSide: BorderSide(width: 3, color: Colors.blue),
                                  //borderSide: BorderSide(width: 3, color: Colors.red),
                                  borderRadius: BorderRadius.circular(15),
                                )),
                            keyboardType: TextInputType.number,
                            onChanged: _onChanged,
                          ),
                        ),
                        Container(height: 50),
                        Text('Tip %',
                          style: new TextStyle(fontSize: 20.0),
                        ),
                        Container(height: 10),
                        Slider(
                          value: _currentSliderValue,
                          max:20,
                          divisions: 20,
                          label: _currentSliderValue.round().toString() + "%",
                          onChanged: (double value){
                            setState(() {
                              _currentSliderValue = value;
                              tipAmount = value;
                            });
                          },
                        ),
                        //Text(billAmount.toString()),
                        //Text((tipAmount.round()/100).toString()),
                        Container(height: 50),
                        Container(
                            width: 500,
                            padding: const EdgeInsets.all(10.0),
                            decoration: myBoxDecoration(),
                            //double.parse((12.3412).toStringAsFixed(2));
                            child: Text("Tip: "+r"$"+double.parse((tipAmount/100*billAmount).toStringAsFixed(2)).toString(), style: new TextStyle(fontSize: 20.0),)
                        ),
                        Container(height: 10),
                        Container(
                          width: 500,
                          padding: const EdgeInsets.all(10.0),
                          decoration: myBoxDecoration(),
                            //double.parse((12.3412).toStringAsFixed(2));
                          child: Text("Total with Tip: "+r"$"+double.parse((billAmount + (tipAmount/100*billAmount)).toStringAsFixed(2)).toString(), style: new TextStyle(fontSize: 20.0),)
                        ),
                        Container(height: 50),
                        Text('Amount of Split People',
                          style: new TextStyle(fontSize: 20.0),
                        ),
                        Container(height: 10),
                        Slider(
                          value: _currentSliderValue2,
                          max:30,
                          divisions: 30,
                          label: _currentSliderValue2.round().toString() + " people",
                          onChanged: (double value){
                            setState(() {
                              _currentSliderValue2 = value;
                              tipAmount = value;
                            });
                          },
                        ),
                      ]
                  ),
              ),
            ],

          ),
        ),
      ),
    );
  }
}
