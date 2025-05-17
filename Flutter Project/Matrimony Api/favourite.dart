import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_api/project_1/add_user.dart';
import 'package:flutter_api/project_1/api.dart';
import 'package:flutter_api/project_1/my_Database.dart';
import 'package:flutter_api/project_1/user.dart';
import 'package:flutter_api/project_1/user_detail.dart';
import 'package:flutter_api/project_1/user_list.dart';

class Favourite extends StatefulWidget {
  const Favourite({super.key});

  @override
  State<Favourite> createState() => _FavouriteState();
}

class _FavouriteState extends State<Favourite> {
User user= User();
ApiService apidata = ApiService();
  //UserList list=UserList();
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    User.favouriteList.clear();
    for(var element in User.filteredUserList){
      if(element["FAV"]==true){
        User.favouriteList.add(element);
      }
    }
    // User.favouriteList=List.from()
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(child: Scaffold(
      appBar: AppBar(
      backgroundColor: Colors.pink[200],
      title: Text("Favourite",style: TextStyle(color: Colors.white,fontSize: 30,fontWeight: FontWeight.bold),),
      centerTitle: true,
    ),
        body: Container(
            child:Stack(
                alignment: AlignmentDirectional.center,
              fit: StackFit.expand,
              children: [
                getbgColor(context),
                Positioned(
                  top: 30,
                    child: Container(
                      height: 200,
                      padding: EdgeInsets.all(20),
                      width: 270,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(30),
                            color: Colors.pink[50]
                        ),
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(20), // Ensures image respects border
                        child: Image.asset(
                          "asets/Images/flower.jpg", // Fixed the spelling from "asets" to "assets"
                          fit: BoxFit.cover, // Ensures the image fills the container nicely
                        ),
                      ),
                    )),
              // Opacity(opacity: 1.0,
              // child: Image.asset("asets/Images/favourite.jpg",fit: BoxFit.fill,),
              //   ),
              // BackdropFilter(
              //     filter: ImageFilter.blur(sigmaX: 9.0, sigmaY: 9.0), // Adjust blur amount here
              //     child: Container(
              //         color: Colors.black.withOpacity(0), // Transparency effect (optional)
              //     ),
              // ),
                SizedBox(height: 100,),
                Positioned(
                  child: Container(
                    margin: EdgeInsets.only(top: 250.0),
                    child: Column(
                      children: [
                        Container(
                          child: Expanded(
                            child: ListView.builder(
                              itemCount: User.favouriteList.length,
                              itemBuilder: (context,index){
                                return getUserList(index);
                            }),
                          ),
                        )
                      ],
                    ),
                  ),
                )
              ]
            )
        ),
    ));
  }

  Widget buildLeadingIcon(Map role) {
    if (role["GENDER"] == 'Female') {
      return ClipOval(
        child: Image.asset(
          'asets/Images/girl_img.jpg', // Replace with real URL
          width: 50,
          height: 70,
          fit: BoxFit.cover,
        ),
      );
    }  else {
      return ClipOval(
        child: Image.asset(
          'asets/Images/boy_img.jpg', // Replace with real URL
          width: 50,
          height: 70,
          fit: BoxFit.cover,
        ),
      );
    }
  }

  Widget getUserList(i){
    return Card(
      color: Colors.pink[50],
      // color: Color(0xFF87CEEB),
      elevation: 30,
      child: ListTile(
        onTap: (){
          Navigator.push(context, MaterialPageRoute(builder: (context){
            return UserDetail(index: i);
          }));
        },
        shape: RoundedRectangleBorder(
          // side: BorderSide(color: Color(0xFF87CEEB), width: 4), // Blue border with width 2
          borderRadius: BorderRadius.circular(10), // Optional: for rounded corners
        ),
        title: Text(User.favouriteList[i]["NAME"],style: TextStyle(color: Colors.pink.shade300),),
        subtitle: Column(children: [
          Text('${User.favouriteList[i]["EMAIL"]}   -------   ${User.favouriteList[i]["PHONE"]}',style: TextStyle(color: Colors.pink.shade300),),
          Text('${User.favouriteList[i]["ADDRESS"]}',style: TextStyle(color: Colors.pink.shade300),),
        ],),
        leading: buildLeadingIcon(User.favouriteList[i]),
        trailing: IconButton(onPressed: (){
          showDialog(context: context, builder: (context){
            return AlertDialog(
              title: Text("Unfavourite"),
              content: Text("Are you sure to unfavourite"),
              actions: [
                TextButton(onPressed: () async{
                  // await user.toggleFavorite(User.favouriteList[i][MatromonialDatabase.USER_ID], User.favouriteList[i][MatromonialDatabase.FAV]);
                  User.favouriteList[i]["FAV"] = !User.favouriteList[i]["FAV"];
                  await apidata.updateFavorite(User.favouriteList[i]["id"],User.favouriteList[i]["FAV"] );
                  User.favouriteList.removeAt(i);
                  Navigator.pop(context);
                  setState(() {});
                }, child: Text("Yes")),
                TextButton(onPressed: (){
                  Navigator.pop(context);
                  setState(() {});
                }, child: Text("No"))
              ],
            );
          });

        }, icon: User.favouriteList[i]["FAV"]==true ?Icon(Icons.favorite,color: Colors.red,):Icon(Icons.favorite_border_sharp,color: Colors.white,)),
      ),
    );
  }
Column getbgColor(BuildContext context){
  return Column(
    children: [
      Container(
        width: double.infinity,
        height: 120,
        decoration: BoxDecoration(
            color: Colors.pink.shade200,
            borderRadius: BorderRadius.only(
              bottomLeft: Radius.circular(50),
              bottomRight: Radius.circular(50),
            )
        ),
      ),

    ],
  );
}
}
