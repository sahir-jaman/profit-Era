import 'package:e_shop/Models/item.dart';
import 'package:e_shop/Store/storehome.dart';
import 'package:e_shop/Widgets/customAppBar.dart';
import 'package:e_shop/Widgets/myDrawer.dart';
import 'package:flutter/material.dart';


class ProductPage extends StatefulWidget
{
  final ItemModel itemModel;
  ProductPage({this.itemModel});
  @override
  _ProductPageState createState() => _ProductPageState();
}

class _ProductPageState extends State<ProductPage> {
  int quantityOfItems = 1;

  @override
  Widget build(BuildContext context) {
    Size screenSize = MediaQuery
        .of(context)
        .size;
    return SafeArea(
      child: Scaffold(
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
              color: Colors.white,
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
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Center(
                            child: Image.network(widget.itemModel.thumbnailUrl),
                          ),
                          Text(
                            widget.itemModel.title,
                            style: boldTextStyle,
                          ),
                          SizedBox(height: 10.0,),
                          Text(
                            widget.itemModel.longDescription,
                            style: largeTextStyle,
                          ),
                          SizedBox(height: 10.0,),
                          Text(
                            "৳" + widget.itemModel.price.toString(),
                            style: TextStyle(
                              color: Colors.pink,
                              fontSize: 30.0,
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
                        onTap: ()=> checkItemInCart(widget.itemModel.shortInfo, context),
                        child: Container(
                          color: Colors.grey[900],
                          width: MediaQuery.of(context).size.width - 35.0,
                          height: 50.0,
                          child: Center(
                            child: Text("Add to Cart",style: TextStyle(color: Colors.white),),
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
