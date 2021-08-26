import 'package:e_shop/Config/config.dart';
import 'package:e_shop/Models/item.dart';
import 'package:e_shop/Store/storehome.dart';
import 'package:e_shop/Widgets/customAppBar.dart';
import 'package:e_shop/Widgets/myDrawer.dart';
import 'package:flutter/material.dart';


class giftpage extends StatefulWidget
{
  @override
  _giftpageState createState() => _giftpageState();
}

class _giftpageState extends State<giftpage> {

  @override
  Widget build(BuildContext context) {
    Size screenSize = MediaQuery
        .of(context)
        .size;
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.grey[900],
        appBar: MyAppBar(),
        drawer: MyDrawer(),
        body: ListView(
          children: [
            Container(
              padding: EdgeInsets.all(8.0),
              width: MediaQuery
                  .of(context)
                  .size
                  .width,
              color: Colors.grey[900],
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Stack(
                    children: [

                      Container(
                        color: Colors.grey[900],
                        child: SizedBox(
                          height: 1.0,
                          width: double.infinity,
                        ),
                      ),
                    ],
                  ),
                  Container(
                    padding: EdgeInsets.all(20.0),
                    child: Center(
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "Dear ",
                            style: TextStyle(
                              color: Colors.amber,
                              fontSize: 21.0,
                            ),
                          ),
                          Text(
                            EcommerceApp.sharedPreferences.getString(EcommerceApp.userName),
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 21.0,
                            ),
                          ),
                          Text(
                            ", your gift is :",
                            style: TextStyle(
                              color: Colors.amber,
                              fontSize: 21.0,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  Container(
                    padding: EdgeInsets.fromLTRB(20, 0, 0,10),
                    child: Center(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Image.asset(
                              "images/realme.jpg",
                              height: 240.0,
                              width: 340.0,
                            ),
                          SizedBox(height: 10.0,),
                          Text(
                            "Title:",
                            style: TextStyle(
                              color: Colors.amber,
                              fontSize: 25.0,
                            ),
                          ),
                          SizedBox(height: 10.0,),
                          Text(
                            "Realme Air Buds 2020",
                            style: TextStyle(
                              color: Colors.pink,
                              fontSize: 20.0,
                            ),
                          ),
                          SizedBox(height: 5.0,),
                          Text(
                            "Description",
                            style: TextStyle(
                              color: Colors.amber,
                              fontSize: 25.0,
                            ),
                          ),
                          SizedBox(height: 5.0,),
                          Text(
                            "The Realme Buds Air Pro come in a simple circular case with a LED indicator for connection and battery life. Inside the earbuds can be wirelessly charged, while the case itself charges through USB-C port. Inside the Buds Air Pro's box there's a USB cable and three spare rubber ear tips",
                            style: TextStyle(
                              color: Colors.blueGrey,
                              fontSize: 21.0,
                            ),
                          ),
                          SizedBox(height: 10.0,),
                        ],
                      ),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.only(top: 8.0),
                    child: Center(
                      child: InkWell(
                        onTap:null,
                        child: Container(
                          color: Colors.pink,
                          width: MediaQuery.of(context).size.width - 58.0,
                          height: 50.0,
                          child: Center(
                            child: Text("Add to Cart",style: TextStyle(color: Colors.white,fontSize: 26),),
                          ),
                        ),
                      ),
                    ),
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}

const boldTextStyle = TextStyle(fontWeight: FontWeight.bold,fontSize: 40,color: Colors.black);
const largeTextStyle = TextStyle(fontWeight: FontWeight.normal,fontSize: 20);
