import 'package:e_shop/Store/cart.dart';
import 'package:e_shop/Counters/cartitemcounter.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';


class MyAppBar extends StatelessWidget with PreferredSizeWidget
{
  final PreferredSizeWidget bottom;
  MyAppBar({this.bottom});


  @override
  Widget build(BuildContext context) {
    return AppBar(
      iconTheme: IconThemeData(
        color: Colors.pink,

      ),
      backgroundColor: Colors.grey[900],
      title: Text("Profit Era",
        style: TextStyle(
          fontSize: 30.0,
          color: Colors.white,
        ),
      ),
      centerTitle: true,
      bottom: bottom,
      actions: [
        Stack(
          children: [
            IconButton(
              icon: Icon(Icons.shopping_cart,color:Colors.pink),
              onPressed: (){
                Route route = MaterialPageRoute(builder: (c)=>CartPage());
                Navigator.pushReplacement(context, route);
              },
            ),
            Positioned(
              child: Stack(
                children: [
                  Icon(
                    Icons.brightness_1,
                    size: 20.0,
                    color: Colors.green,
                  ),
                  Positioned(
                    top: 3.0,
                    bottom: 4.0,
                    left: 5.0,
                    child: Consumer<CartItemCounter>(
                        builder: (context,counter,_)
                        {
                          return Text(
                            counter.count.toString(),
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 12.0,fontWeight: FontWeight.w500,
                            ),
                          );
                        }
                    ),
                  ),
                ],
              ),
            )
          ],
        )
      ],

    );

  }


  Size get preferredSize => bottom==null?Size(56,AppBar().preferredSize.height):Size(56, 80+AppBar().preferredSize.height);
}
