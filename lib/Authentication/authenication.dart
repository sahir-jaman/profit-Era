import 'package:flutter/material.dart';
import 'login.dart';
import 'register.dart';
import 'package:e_shop/Config/config.dart';


class AuthenticScreen extends StatefulWidget {
  @override
  _AuthenticScreenState createState() => _AuthenticScreenState();
}

class _AuthenticScreenState extends State<AuthenticScreen> {

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
     length: 2,
      child: Scaffold(
        appBar: AppBar(
          flexibleSpace: Container(
              color: Colors.grey[900],
          ),
          title: Text(
              "Profit Era",
                  style: TextStyle(
              fontSize: 27,
            color: Colors.white,
          ),
          ),
          centerTitle: true,
          bottom: TabBar(
            tabs: [
              Tab(
                icon: Icon(Icons.lock,color: Colors.white,),
                text: "Login",
              ),
              Tab(
                icon: Icon(Icons.person,color: Colors.white,),
                text: "Register",
              ),
            ],
            indicatorColor: Colors.white38,
            indicatorWeight: 5.0,
          ),
        ),
        body: Container(
          color: Colors.grey[900],
          child: TabBarView(
            children: [
              Login(),
              Register(),
            ],
          ),
        ),

      ),
    );
  }
}
