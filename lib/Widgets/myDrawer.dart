import 'package:e_shop/Authentication/authenication.dart';
import 'package:e_shop/Config/config.dart';
import 'package:e_shop/Address/Myaccount.dart';
import 'package:e_shop/Store/cart.dart';
import 'package:e_shop/Store/giftpage.dart';
import 'package:e_shop/Store/storehome.dart';
import 'package:flutter/material.dart';

import 'money.dart';

class MyDrawer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Container(
        color: Colors.grey[900],
        child: ListView(
 children: [
        Container(
          padding: EdgeInsets.only(top:25,bottom: 10),
          color: Colors.grey[900],
          child: Column(
            children: [
              Material(
                borderRadius: BorderRadius.all(Radius.circular(80.0)),
                elevation: 9.0,
                child: Container(
                  height: 160.0,
                  width: 160.0,
                  child: CircleAvatar(
                    backgroundImage: NetworkImage(
                      EcommerceApp.sharedPreferences.getString(EcommerceApp.userAvatarUrl),
                    ),
                  ),
                ),
              ),
              SizedBox(height: 10.0,),
              Text(
                EcommerceApp.sharedPreferences.getString(EcommerceApp.userName),
                style: TextStyle(
                    color: Colors.white,
                    fontSize: 30.0,

                ),
              ),
            ],
          ),
        ),
         SizedBox(height: 12.0,),
        Container(
         padding: EdgeInsets.only(top: 1.0),
         color: Colors.grey[900],
          child: Column(
            children: [

              ListTile(
                leading: Icon(Icons.home,color: Colors.white,),
                title: Text("Home",style: TextStyle(color: Colors.white),),
                onTap: (){
                  Route route = MaterialPageRoute(builder: (c)=>StoreHome());
                  Navigator.pushReplacement(context, route);
                },
              ),

              Divider(height: 10.0, color: Colors.white, thickness: 5.0,
              ),

              ListTile(
                leading: Icon(Icons.person,color: Colors.white,),
                title: Text("My profile",style: TextStyle(color: Colors.white),),
                onTap: (){
                  Route route = MaterialPageRoute(builder: (c)=>MyAddress());
                  Navigator.pushReplacement(context, route);
                },
              ),

              Divider(height: 10.0, color: Colors.white, thickness: 5.0,
              ),

              ListTile(
                leading: Icon(Icons.shopping_cart,color: Colors.white,),
                title: Text("My Cart",style: TextStyle(color: Colors.white),),
                onTap: (){
                  Route route = MaterialPageRoute(builder: (c)=>CartPage());
                  Navigator.pushReplacement(context, route);
                },
              ),

              Divider(height: 10.0, color: Colors.white, thickness: 5.0,
              ),

              ListTile(
                leading: Icon(Icons.search,color: Colors.white,),
                title: Text("Searched",style: TextStyle(color: Colors.white),),
                onTap: (){
                  Route route = MaterialPageRoute(builder: (c)=>CartPage());
                  Navigator.pushReplacement(context, route);
                },
              ),

              Divider(height: 10.0, color: Colors.white, thickness: 5.0,
              ),

              ListTile(
                leading: Icon(Icons.money_off,color: Colors.white,),
                title: Text("Total money",style: TextStyle(color: Colors.white),),
                onTap: (){
                  Route route = MaterialPageRoute(builder: (c)=>MyCalculator());
                  Navigator.pushReplacement(context, route);
                },
              ),

              Divider(height: 10.0, color: Colors.white, thickness: 5.0,
              ),

              ListTile(
                leading: Icon(Icons.card_giftcard,color: Colors.white,),
                title: Text("Gift",style: TextStyle(color: Colors.white),),
                onTap: (){
                  Route route = MaterialPageRoute(builder: (c)=>giftpage());
                  Navigator.pushReplacement(context, route);
                },
              ),

              Divider(height: 10.0, color: Colors.white, thickness: 5.0,
              ),

              ListTile(
                leading: Icon(Icons.assignment_late_outlined,color: Colors.white,),
                title: Text("Sign out",style: TextStyle(color: Colors.white),),
                onTap: (){
                  Route route = MaterialPageRoute(builder: (c)=>AuthenticScreen());
                  Navigator.pushReplacement(context, route);
                },
              ),

              Divider(height: 10.0, color: Colors.white, thickness: 5.0,
              ),
            ],
          ),
          ),


 ],
        ),
      ),
    );
  }
}
