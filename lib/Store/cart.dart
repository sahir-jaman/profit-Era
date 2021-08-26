
import 'package:flutter/material.dart';

import '../Widgets/myDrawer.dart';
class CartPage extends StatefulWidget {
  @override
  _CartPageState createState() => _CartPageState();
}

class _CartPageState extends State<CartPage>
    with SingleTickerProviderStateMixin{
  AnimationController animationController;
  Animation<int>welcomeStringCount;
  static const String welcomeString = "Sorry this page is under construction.We are doing some work on this page.";
  @override
  void initState() {
    super.initState();
    animationController=new AnimationController(
      duration: Duration(seconds: 5),
      vsync: this,
    );
    welcomeStringCount = StepTween(begin: 0,end:
    welcomeString.length).animate(CurvedAnimation(
      parent: animationController,
      curve:Curves.easeIn,
    ))
      ..addListener((){
        setState(() {});
      });
    animationController.forward();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Construction Page"),
        centerTitle: true,
        flexibleSpace: Container(
          decoration: BoxDecoration(
              gradient: LinearGradient(
                  begin: Alignment.topRight,
                  end: Alignment.bottomLeft,
                  colors: [
                    Color.fromRGBO(85, 98, 112, 1),
                    Color.fromRGBO(78, 206, 196, 1),
                  ]
              ),
          ),
        ),
      ),
      drawer: MyDrawer(),
      body: Container(
        decoration: BoxDecoration(
            gradient: LinearGradient(
                begin: Alignment.topRight,
                end: Alignment.bottomLeft,
                colors: [
                  Color.fromRGBO(85, 98, 112, 1),
                  Color.fromRGBO(78, 206, 196, 1),
                ]
            ),
        ),
        child:welcomeStringCount==null?null:Align(
          alignment: Alignment.center,
          child: Container(
            width: 350,
            margin: EdgeInsets.all(28),
            padding: EdgeInsets.only(left: 35),
            child: Column(
              children: [
                SizedBox(height: 70.0,),
                Image.asset(
                  "images/boy.png",
                  height: 300.0,
                  width: 300.0,
                ),
                AnimatedBuilder(
                  animation: welcomeStringCount,
                  builder:(BuildContext context, Widget
                  child){
                    String text = welcomeString.substring(0,welcomeStringCount.value);
                    return Text(text,style: TextStyle(fontSize: 24.0,color: Colors.white),);

                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
