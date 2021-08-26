import 'dart:io';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:e_shop/Admin/adminShiftOrders.dart';
import 'package:e_shop/Widgets/loadingWidget.dart';
import 'package:e_shop/main.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';


class UploadPage extends StatefulWidget
{
  @override
  _UploadPageState createState() => _UploadPageState();
}

class _UploadPageState extends State<UploadPage> with AutomaticKeepAliveClientMixin<UploadPage>
{
  bool get wantKeepAlive => true;
  File file;
  TextEditingController _descriptionTextEditingControler = TextEditingController();
  TextEditingController _priceTextEditingControler = TextEditingController();
  TextEditingController _titleTextEditingControler = TextEditingController();
  TextEditingController _shortInfoTextEditingControler = TextEditingController();
  String productId = DateTime.now().millisecondsSinceEpoch.toString();
  bool uploading = false;

  @override
  Widget build(BuildContext context) {
    return file == null ? displayAdminHomeScreen(): displayAdminUploadFormScreen();
  }
  displayAdminHomeScreen(){
    return Scaffold(
      backgroundColor: Colors.grey[900],
      appBar: AppBar(
        backgroundColor: Colors.grey[850],
        title: Text("Profit Era",
          style: TextStyle(
            fontSize: 30.0,
            color: Colors.white,
          ),
        ),
        centerTitle: true,
        leading:IconButton(
          icon: Icon(Icons.border_color,color: Colors.pink,),
          onPressed: (){
            Route route = MaterialPageRoute(builder: (c) =>AdminShiftOrders());
            Navigator.pushReplacement(context, route);
          },
        ),
        actions: [
          FlatButton(
            child: Text(
              "Logout",
              style: TextStyle(
                color: Colors.pink,
                fontSize: 26.0,
                fontWeight: FontWeight.bold,
              ),
            ),
            onPressed: (){
              Route route = MaterialPageRoute(builder: (c) => SplashScreen());
              Navigator.pushReplacement(context, route);
            },
          ),
        ],
      ),
      body: getAdminHomeScreenBody(),
    );
  }

  getAdminHomeScreenBody(){
    return Container(
      color: Colors.grey[900],
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(Icons.shop_two,color: Colors.white,size: 230,),
            Padding(
              padding: EdgeInsets.only(top: 20.0),
              child: RaisedButton(
                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
                child: Text("Add New Items",
                style: TextStyle(
                  fontSize: 20,
                  color: Colors.white,
                ),
                ),
                color: Colors.pink,
                onPressed:()=>takeImage(context),
              ),
            ),
          ],
        ),
      ),
    );
  }
  takeImage(mContext){
    return showDialog(
      context: mContext,
      builder: (c){
        return SimpleDialog(
          title: Text("Select an option", style: TextStyle(color: Colors.pink,fontSize: 20.0,fontWeight: FontWeight.bold,),),
          children: [
            SimpleDialogOption(
              child: Text("Capture with Camera",style: TextStyle(color: Colors.green,fontSize:15.0,fontWeight: FontWeight.bold,),),
              onPressed: capturePhotoWithCamera,
            ),
            SimpleDialogOption(
              child: Text("Select from Gallery",style: TextStyle(color: Colors.green,fontSize:15.0,fontWeight: FontWeight.bold,),),
              onPressed: pickPhotoFromGallery,
            ),
            SimpleDialogOption(
              child: Text("Cancel",style: TextStyle(color: Colors.green,fontSize:15.0,fontWeight: FontWeight.bold,),),
              onPressed: (){
                Navigator.pop(context);
              },
            ),
          ],
        );
      }
    );
  }
  Future capturePhotoWithCamera()async
  {
    Navigator.pop(context);
    File imageFile= await ImagePicker.pickImage(source: ImageSource.camera,maxHeight: 680.0,maxWidth: 970.0);

    setState(() {
      file= imageFile;
    });
  }
 Future pickPhotoFromGallery()async
  {
    Navigator.pop(context);
    File imageFile = await ImagePicker.pickImage(source: ImageSource.gallery);

    setState(() {
      file= imageFile;
    });
  }
  displayAdminUploadFormScreen()
  {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue,
        leading: IconButton(icon: Icon(Icons.arrow_back,color: Colors.white,),onPressed: clearFormInfo),
        title: Text("New Product",style: TextStyle(color: Colors.white,fontSize: 24.0,fontWeight: FontWeight.bold,),),
        actions: [
          FlatButton(
            onPressed: uploading ? null : ()=> uploadImageAndSaveItemInfo(),
            child: Text("Add",style: TextStyle(color: Colors.white,fontSize: 23.0,fontWeight: FontWeight.bold),),
          ),
        ],
      ),
      body: ListView(
       children: [
         uploading ? circularProgress() : Text(""),
         Container(
           height: 230.0,
           width: MediaQuery.of(context).size.width*0.8,
           child: Center(
             child: AspectRatio(
               aspectRatio: 16/9,
               child: Container(
                 decoration: BoxDecoration(image: DecorationImage(image: FileImage(file),fit:BoxFit.cover)),
               ),
             ),
           ),
         ),
         Padding(padding: EdgeInsets.only(top: 12.0)),
         ListTile(
           leading: Icon(Icons.perm_device_information,color: Colors.pink,),
           title: Container(
             width: 250.0,
             child: TextField(style: TextStyle(color: Colors.deepPurpleAccent),
             controller: _shortInfoTextEditingControler,
               decoration: InputDecoration(
                 hintText: "Short Info",
                 hintStyle: TextStyle(color: Colors.blue),
                 border: InputBorder.none,
               ),
             ),
           ),
         ),
         Divider(color: Colors.pink,height: 5.0,),

         ListTile(
           leading: Icon(Icons.title_outlined,color: Colors.pink,),
           title: Container(
             width: 250.0,
             child: TextField(style: TextStyle(color: Colors.deepPurpleAccent),
               controller: _titleTextEditingControler,
               decoration: InputDecoration(
                 hintText: "Title",
                 hintStyle: TextStyle(color: Colors.blue),
                 border: InputBorder.none,
               ),
             ),
           ),
         ),
         Divider(color: Colors.pink,height: 5.0,),


         ListTile(
           leading: Icon(Icons.description,color: Colors.pink,),
           title: Container(
             width: 250.0,
             child: TextField(style: TextStyle(color: Colors.deepPurpleAccent),
               controller: _descriptionTextEditingControler,
               decoration: InputDecoration(
                 hintText: "Description",
                 hintStyle: TextStyle(color: Colors.blue),
                 border: InputBorder.none,
               ),
             ),
           ),
         ),
         Divider(color: Colors.pink,height: 5.0,),


         ListTile(
           leading: Icon(Icons.price_change,color: Colors.pink,),
           title: Container(
             width: 250.0,
             child: TextField(
               keyboardType: TextInputType.number,
               style: TextStyle(color: Colors.deepPurpleAccent),
               controller: _priceTextEditingControler,
               decoration: InputDecoration(
                 hintText: "price",
                 hintStyle: TextStyle(color: Colors.blue),
                 border: InputBorder.none,
               ),
             ),
           ),
         ),
         Divider(color: Colors.pink,height: 5.0,),
       ],
      ),
    );
  }
  clearFormInfo()
  {
     setState(() {
       file = null;
       _descriptionTextEditingControler.clear();
       _priceTextEditingControler.clear();
       _shortInfoTextEditingControler.clear();
       _titleTextEditingControler.clear();
     });
  }
  uploadImageAndSaveItemInfo()async
  {
    setState(() {
      uploading = true;
    });
    String imageDownloadUrl = await uploadItemImage(file);
    saveItemInfo(imageDownloadUrl);
  }
  Future <String> uploadItemImage(mFileImage)async
  {
    final StorageReference storageReference = FirebaseStorage.instance.ref().child("Items");
    StorageUploadTask uploadTask = storageReference.child("product_$productId.jpg").putFile(mFileImage);
    StorageTaskSnapshot taskSnapshot = await uploadTask.onComplete;
    String downloadUrl = await taskSnapshot.ref.getDownloadURL();
    return downloadUrl;
  }
  saveItemInfo(String downloadUrl)
  {
    final itemsRef= Firestore.instance.collection("Items");
    itemsRef.document(productId).setData(
      {
        "shortInfo": _shortInfoTextEditingControler.text.trim(),
        "longDescription": _descriptionTextEditingControler.text.trim(),
        "price": int.parse(_priceTextEditingControler.text),
        "publishedDate": DateTime.now(),
        "status": "available",
        "thumbnailUrl": downloadUrl,
        "title": _titleTextEditingControler.text.trim(),
      });
    setState(() {
      file = null;
      uploading = false;
      productId = DateTime.now().millisecondsSinceEpoch.toString();
      _descriptionTextEditingControler.clear();
      _titleTextEditingControler.clear();
      _shortInfoTextEditingControler.clear();
      _priceTextEditingControler.clear();
    });
  }
}
