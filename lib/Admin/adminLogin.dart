import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:e_shop/Admin/uploadItems.dart';
import 'package:e_shop/Authentication/authenication.dart';
import 'package:e_shop/Widgets/customTextField.dart';
import 'package:e_shop/DialogBox/errorDialog.dart';
import 'package:flutter/material.dart';




class AdminSignInPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[900],
      appBar: AppBar(
        backgroundColor: Colors.grey[900],
        title: Text(
          "Admin Login ",
              style: TextStyle(
            color: Colors.white,
                fontSize: 27.0,
        ),
        ),
        centerTitle: true,
      ),
    body: AdminSignInScreen(),
    );
  }
}


class AdminSignInScreen extends StatefulWidget {
  @override
  _AdminSignInScreenState createState() => _AdminSignInScreenState();
}

class _AdminSignInScreenState extends State<AdminSignInScreen> {

  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final TextEditingController _adminIDTextEditingController = TextEditingController();
  final TextEditingController _passwordTextEditingController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    double _screenWidth = MediaQuery
        .of(context)
        .size
        .width;
    return Scaffold(
      backgroundColor: Colors.grey[900],
      body: SingleChildScrollView(
        child: Container(
          child: Column(
            mainAxisSize: MainAxisSize.max,
            children: [
              SizedBox(height:30,),
              Container(
                child: Image.asset(
                  "images/admin.png",
                  height: 240.0,
                  width: 240.0,
                ),
              ),
              Padding(
                padding: EdgeInsets.all(8.0),
                child: Text(
                  "Only Admin Login Section",
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 25.0,
                  ),
                ),
              ),
              Form(
                key: _formKey,
                child: Column(
                  children: [

                    SizedBox(height:10,),
                    CustomTextField(
                      controller: _adminIDTextEditingController,
                      data: Icons.person,
                      hintText: "Id",
                      isObsecure: false,
                    ),
                    CustomTextField(
                      controller: _passwordTextEditingController,
                      data: Icons.lock,
                      hintText: "password",
                      isObsecure: true,
                    ),

                  ],
                ),
              ),

              RaisedButton(
                onPressed: () {
                  _adminIDTextEditingController.text.isNotEmpty &&
                      _passwordTextEditingController.text.isNotEmpty
                      ? loginAdmin() : showDialog(
                      context: context,
                      builder: (c) {
                        return ErrorAlertDialog(
                          message: "please write email and password",);
                      }
                  );
                },
                color: Colors.pink,
                child: Text(
                  "Login",
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 24.0,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              SizedBox(height: 50,),
              Container(
                height: 4.0,
                width: _screenWidth * 0.9,
                color: Colors.pink,
              ),
              SizedBox(height: 10.0,),
              FlatButton.icon(
                onPressed: () =>
                    Navigator.push(context, MaterialPageRoute(
                        builder: (context) => AuthenticScreen())),
                icon: (Icon(Icons.nature_people, color: Colors.pink,)),
                label: Text("I'm not Admin", style: TextStyle(
                  color: Colors.pink,
                  fontWeight: FontWeight.bold,
                  fontSize: 25.0,
                ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  loginAdmin() {
    Firestore.instance.collection("admins").getDocuments().then((snapshot) {
      snapshot.documents.forEach((result) {
        if (result.data["id"] != _adminIDTextEditingController.text.trim()) {
          Scaffold.of(context).showSnackBar(
              SnackBar(content: Text("Your id is not correct"),));
        }
        else if (result.data["password"] !=
            _passwordTextEditingController.text.trim()) {
          Scaffold.of(context).showSnackBar(
              SnackBar(content: Text("Your password is not correct"),));
        }
        else {
          Scaffold.of(context).showSnackBar(SnackBar(
            content: Text("Welcome Dear Admin" + result.data["name"]),));

          setState(() {
            _adminIDTextEditingController.text = "";
            _passwordTextEditingController.text = "";
          });
          Route route = MaterialPageRoute(builder: (c) => UploadPage());
          Navigator.pushReplacement(context, route);
        }
      });
    });
  }
}





