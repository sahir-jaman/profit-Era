import 'package:e_shop/Widgets/customAppBar.dart';
import 'package:e_shop/Widgets/myDrawer.dart';
import 'package:flutter/material.dart';
import 'package:math_expressions/math_expressions.dart';

void main() {
  runApp(Calculator());
}

class Calculator extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'My Calculator',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyCalculator(),
    );
  }
}

class MyCalculator extends StatefulWidget {

  @override
  _MyCalculator createState() => _MyCalculator();
}

class _MyCalculator extends State<MyCalculator> {

  String equation ="0";
  String result ="0";
  String expression ="";
  double equationFontSize =42.0;
  double resultFontSize =48.0;

  buttonPressed(String buttonText){
    setState(() {
      if(buttonText == "C"){
        equation = equation.substring(0,equation.length - 1);
        if(equation==""){
          equation="0";
        }

      }
      else if(buttonText == "clr"){
        equation="0";
        result="0";

      }
      else if (buttonText== "="){
        expression = equation;
        expression = equation.replaceAll('×', '*');
        expression = equation.replaceAll('÷', '/');
        try{
          Parser p =  Parser();
          Expression exp = p.parse(expression);

          ContextModel cm =ContextModel();
          result='${exp.evaluate(EvaluationType.REAL, cm)}';
        }catch(e){
          result = "Error";
        }
      }
      else{
        if(equation=="0"){
          equation=buttonText;
        }
        else
        {
          equation = equation + buttonText;
        }
      }

    });
  }

  Widget buildButton(String buttonText, double buttonHeight,Color buttonColor){
    return Container(
      width: MediaQuery.of(context).size.width * buttonHeight,
      color: buttonColor,
      child: FlatButton(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(0.0),
          side: BorderSide(
              color: Colors.white,
              width: 1.0,style: BorderStyle.solid),
        ),
        padding: EdgeInsets.all(16.0),
        onPressed: ()=>buttonPressed(buttonText),
        child: Text(buttonText,
          style: TextStyle(
            fontSize: 30.0,
            color: Colors.white,
          ),
        ),
      ),
    );
  }
  @override
  Widget build(BuildContext context) {

    return Scaffold(
      backgroundColor: Colors.grey[900],

      appBar: MyAppBar(),
      drawer: MyDrawer(),
      body:  Column(
        children: [
          Container(
            padding: EdgeInsets.fromLTRB(10, 10, 10, 10),
            margin: EdgeInsets.all(0),
            color: Colors.grey[900],
            child: Text("Calculate your total cost money",
              style: TextStyle(
                fontSize: 25,
                color: Colors.pink,
              ),),
          ),
          SizedBox(height: 1,),
          Container(
            alignment: Alignment.centerRight,
            padding: EdgeInsets.fromLTRB(10, 50, 10, 0),
            margin: EdgeInsets.all(0),
            color: Colors.grey[350],
            child: Text(equation,
              style: TextStyle(
                fontSize: equationFontSize,
              ),),
          ),
          SizedBox(height: 1,),
          Container(
            alignment: Alignment.centerRight,
            padding: EdgeInsets.fromLTRB(10, 50, 10, 0),
            margin: EdgeInsets.all(0),
            color: Colors.grey[350],
            child: Text(result,
              style: TextStyle(
                fontSize: resultFontSize,
              ),),
          ),
          Expanded(
            child: Container(),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            //crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Expanded(
                flex: 3,
                child: Container(
                  child: Table(children: [
                    TableRow(
                        children: [
                          buildButton("clr",1,Colors.redAccent),
                          buildButton("C",1,Colors.black87),
                          buildButton("%",1,Colors.black87),
                        ]
                    ),
                    TableRow(
                        children: [
                          buildButton("7",1,Colors.blue),
                          buildButton("8",0.6,Colors.blue),
                          buildButton("9",1,Colors.blue),
                        ]
                    ),
                    TableRow(
                        children: [
                          buildButton("4",1,Colors.blue),
                          buildButton("5",0.6,Colors.blue),
                          buildButton("6",1,Colors.blue),
                        ]
                    ),
                    TableRow(
                        children: [
                          buildButton("1",1,Colors.blue),
                          buildButton("2",0.6,Colors.blue),
                          buildButton("3",1,Colors.blue),
                        ]
                    ),
                    TableRow(
                        children: [
                          buildButton(".",1,Colors.blue),
                          buildButton("0",1,Colors.blue),
                          buildButton("00",1,Colors.blue),
                        ]
                    ),

                  ],),
                ),
              ),
              Expanded(
                flex: 1,
                child: Container(
                  child: Table(children: [

                    TableRow(
                        children: [
                          buildButton("×",1,Colors.black87),
                        ]
                    ),
                    TableRow(
                        children: [
                          buildButton("÷",2.0,Colors.black87),
                        ]
                    ),
                    TableRow(
                        children: [
                          buildButton("-",1,Colors.black87),
                        ]
                    ),
                    TableRow(
                        children: [
                          buildButton("+",1,Colors.black87),
                        ]
                    ),
                    TableRow(
                        children: [
                          buildButton("=",2.0,Colors.redAccent),
                        ]
                    ),
                  ],),
                ),
              ),

            ],
          ),
        ],
      ),
    );
  }
}



