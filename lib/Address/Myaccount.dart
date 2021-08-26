import 'package:e_shop/Config/config.dart';
import 'package:e_shop/Widgets/myDrawer.dart';
import 'package:flutter/material.dart';

class MyAddress extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[900],
      appBar: AppBar(
        backgroundColor: Colors.blueGrey[800],
        title: Text("Profit Era Account",
          style: TextStyle(
            fontSize: 28.0,
            color: Colors.white,
            fontFamily: 'SourceSansPro2',
            letterSpacing: 1.0,
            fontWeight: FontWeight.bold,
          ),
        ),
        centerTitle: true,
      ),
      drawer: MyDrawer(),
      body:
      SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.fromLTRB(30, 40, 0, 0),
          child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  child: CircleAvatar(
                    backgroundImage: NetworkImage(
                      EcommerceApp.sharedPreferences.getString(EcommerceApp.userAvatarUrl),
                    ),
                    radius: 60.0,
                  ),
                ),
                SizedBox(height: 20,),
                Text(
                  "Name",
                  style: TextStyle(
                    color: Colors.amber,
                    fontSize: 28,
                    //fontWeight: FontWeight.bold,
                    letterSpacing: 2.0,
                  ),
                ),
                Text(
                  EcommerceApp.sharedPreferences.getString(EcommerceApp.userName),
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 26.0,
                  ),
                ),
                SizedBox(height: 10,),
                Text(
                  "User",
                  style: TextStyle(
                    color: Colors.amber,
                    fontSize: 29,
                    //fontWeight: FontWeight.bold,
                    letterSpacing: 2.0,
                  ),
                ),
                Text(
                  "Level 1 user",
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 25,
                  ),
                ),
                SizedBox(height: 10,),
                Row(
                  children: [
                    Icon(
                      Icons.email,
                      color: Colors.blue,
                      size: 32,
                    ),
                    Text(
                      EcommerceApp.sharedPreferences.getString(EcommerceApp.userEmail),
                      style: TextStyle(
                        color: Colors.blue,
                        fontSize: 24.0,
                      ),
                    ),

                  ],
                ),
                SizedBox(
                  height: 10,
                ),
                Text(
                  "Description",
                  style: TextStyle(
                    color: Colors.amber,
                    fontSize: 25,
                  ),
                ),
                SizedBox(height: 10,),
                Text(
                 "My name is ${EcommerceApp.sharedPreferences.getString(EcommerceApp.userName)} and I am a 21 years old, studying at European University. I am also currently studying at cam-asean institute where I got a 100% scholarship to study Business English program. I have a family of five; my dad, mum, older brother, younger sister and I. My personality is cheerful and very easygoing. I love to cook and bake whenever I have free time. I enjoy playing with kid,I do not mind the company of elderly people and I get along very well with people my age because I am a people person. I like puppies but I feel different when it comes to cat, I find them rather scary in some ways. My favorite food is Pasta but I am definitely not a picky eater, I eat about anything except pineapple, which I am allergic too. I enjoy experiencing new things, visiting new places,eating new food and I am willing to share what I know and earn to others"

                 " I am interested in the program because I want to learn about Japanese culture and the education there. I want to widen my horizons and witness the way of living in Japan and therefore, compare it to my own country; share it with my friends, family, and even my community so that they too, can see things from different perspectives. Additionally, I find this program very important for me as I can improve my language skill, communication skill as well as other skills I would need in the near future in order to do well in the developing society.badka dsbad dkss.adasdf dfadf ",

                  style: TextStyle(
                    color: Colors.blueGrey,
                    fontSize: 20,
                  ),
                ),
                Text(
                  "a;lfakja sroiotrgqoitaeoin rygoisgsrug  sigisd siugisjg dig gifdfjf  ijifjjfdgusi sdifdsksfksadfjgkfdj sr gfgjf g gijgsfdjj fdigijldfkjg  gdsfigjfkd f gf gj kdfs "
                      ";lfakja sroiotrgqoitaeoin rygoisgsrug  sigisd siugisjg dig gifdfjf  ijifjjfdgusi sdifdsksfksadfjgkfdj sr gfgjf g gijgsfdjj fdigijldfkjg  gdsfigjfkd f gf gj kdfs " ";lfakja sroiotrgqoitaeoin rygoisgsrug  sigisd siugisjg dig gifdfjf  ijifjjfdgusi sdifdsksfksadfjgkfdj sr gfgjf g gijgsfdjj fdigijldfkjg  gdsfigjfkd f gf gj kdfs ",

                  style: TextStyle(
                    color: Colors.blueGrey,
                    fontSize: 20,
                  ),
                ),
              ]
          ),

        ),
      ),
    );
  }
}

class MyTextField extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(10),

    );
  }
}
