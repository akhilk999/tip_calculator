import 'package:flutter/material.dart';

 String region ='';
//var tipAmount3 = tipAmount == 0 ? ((billAmount + (tipAmount/100*billAmount))/tipAmount2);

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

  double billAmount = 0;
  double tipAmount = 0;
  double tipPercent = 10;
  double totalWithTip = 0;
  double amountPeople = 1;
  double totalAmount = 0;

  int charLength = 0;
  TextEditingController textController = new TextEditingController();
  _onChanged(String value) {
    setState(() {
      charLength = value.length;
    });
    billAmount = textController.text.isEmpty ? 0: double.parse(textController.text);
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Center(
          child: Column(
            children: [
              Container(
                width: 250,
                child: Column(
                      children:[
                        Container(height: 50),
                        Container(
                          width: 800,
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
                        Container(height: 75),
                        Text('Tip %',
                          style: new TextStyle(fontSize: 20.0),
                        ),
                        Container(height: 10),
                        Slider(
                          value: tipPercent,
                          max:20,
                          divisions: 20,
                          label: tipPercent.round().toString() + "%",
                          onChanged: (double value){
                            setState(() {
                              tipPercent = value;
                              tipAmount = (tipPercent/100*billAmount);
                              totalWithTip = billAmount + tipAmount;
                            });
                          },
                        ),
                        //Text(billAmount.toString()),
                        //Text((tipAmount.round()/100).toString()),
                        Container(height: 25),
                        Container(
                            width: 800,
                            padding: const EdgeInsets.all(10.0),
                            decoration: myBoxDecoration(),
                            //double.parse((12.3412).toStringAsFixed(2));
                            child: Text("Tip: "+r"$"+tipAmount.toStringAsFixed(2), style: new TextStyle(fontSize: 20.0),)
                        ),
                        Container(height: 10),
                        Container(
                          width: 800,
                          padding: const EdgeInsets.all(10.0),
                          decoration: myBoxDecoration(),
                            //double.parse((12.3412).toStringAsFixed(2));
                          child: Text("Total with Tip: "+r"$"+totalWithTip.toStringAsFixed(2), style: new TextStyle(fontSize: 20.0),)
                        ),
                        Container(height: 50),
                        Text('Amount of Split People',
                          style: new TextStyle(fontSize: 20.0),
                        ),
                        Container(height: 10),
                        Slider(
                          value: amountPeople,
                          min: 1,
                          max:30,
                          divisions: 30,
                          label: amountPeople.round().toString() + " people",
                          onChanged: (double value){
                            setState(() {
                              amountPeople = value;
                              totalAmount = totalWithTip/amountPeople;
                            });
                          },
                        ),
                        Container(height: 10),
                        Container(
                            width: 800,
                            padding: const EdgeInsets.all(10.0),
                            decoration: myBoxDecoration(),
                            child: Text("Total + Tip per person : "+r"$"+totalAmount.toStringAsFixed(2), style: new TextStyle(fontSize: 20.0),)
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
