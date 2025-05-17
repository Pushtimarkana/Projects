import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_demo/project_1/about_us.dart';
import 'package:flutter_demo/project_1/add_user.dart';
import 'package:flutter_demo/project_1/favourite.dart';
import 'package:flutter_demo/project_1/login_screen.dart';
import 'package:flutter_demo/project_1/user.dart';
import 'package:flutter_demo/project_1/user_list.dart';
import 'package:shared_preferences/shared_preferences.dart';


class DashboardScreen extends StatefulWidget {
  const DashboardScreen({super.key});

  @override
  State<DashboardScreen> createState() => _DashboardScreenState();

}


class _DashboardScreenState extends State<DashboardScreen> {
  @override
  User user = User();

  Widget build(BuildContext context) {
    return SafeArea(child: Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        actions: [
          IconButton(
            icon: Icon(Icons.logout, color: Colors.white),
            onPressed: logout, // Call logout function on tap
          ),
        ],
        title: Text("Matrimonial",style: TextStyle(color: Colors.white,fontSize: 30,fontWeight: FontWeight.bold),),
        centerTitle: true,
        leading: Icon(Icons.people_alt_rounded,size: 50,color: Colors.white,),
        flexibleSpace: Container(
          decoration: BoxDecoration(
            gradient: LinearGradient(
              colors: [Colors.pink, Colors.pink.shade50],
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
            ),
            borderRadius: BorderRadius.horizontal(
              right: Radius.circular(100), // Same radius as the shape property to keep consistency
            ),
          ),
        ),
      ),



      body: Container(
        child: Stack(
          // alignment: Alignment.topCenter,
          fit: StackFit.expand,
          children: [
            // Opacity(
            //   opacity:1.0,
            //   child: Image.asset("asets/Images/wall.jpeg",fit: BoxFit.fill),
            // ),

            BackdropFilter(
              filter: ImageFilter.blur(sigmaX: 0.0, sigmaY: 0.0), // Adjust blur amount here
              child: Container(
                color: Colors.white.withOpacity(0), // Transparency effect (optional)
              ),
            ),

            Positioned(
                top: -30,
                left: 0,
                right: 0,
                child: Container(
                        height: 270,
                        decoration: BoxDecoration(
                              color: Colors.pink.shade100, // Light blue
                              borderRadius: BorderRadius.only(
                                bottomLeft: Radius.circular(200),
                                  bottomRight: Radius.circular(200),
                              ),
                        ),
                        child: CircleAvatar(
                          radius: 60,
                          backgroundColor: Colors.white,
                          child: ClipOval(
                            child: Image.asset(
                              'asets/Images/Couple6.jpg',  // Replace with your image path
                              width: 230,
                              height: 230,
                              fit: BoxFit.cover, // Ensures the image fills the circular shape
                            ),
                          ),
                        ),
                        ),
                ),
            Positioned(
                child: Padding(
                  padding: const EdgeInsets.only(top: 280.0,left: 35.0),
                  child: Column(
                    children: [
                      Row(
                        children: [
                          Card(
                            elevation:25,
                            child: GestureDetector(
                                onTap: (){
                                    print("Box 1 tapped!");
                                    Navigator.push(context, MaterialPageRoute(builder: (context){
                                      return AddUser(userDetail: null,);
                                    })).then((value){
                            
                                      // user.userList.add(value);
                                      setState(() {
                                        user.addUser(
                                        name: value["NAME"],
                                        address: value["ADDRESS"],
                                        email: value["EMAIL"],
                                        phone: value["PHONE"],
                                        city: value["CITY"],
                                        dob: value["DOB"],
                                        gender: value["GENDER"],
                                        hobby: value["HOBBY"],
                                        pass: value["PASS"],
                                        conpass: value["CONPASS"]
                                      );});
                                    });
                                },
                              child: Container(
                                width: 120,
                                height: 120,
                                alignment: Alignment.center,
                                child: Padding(
                                  padding: const EdgeInsets.only(top: 15.0),
                                  child: Column(
                                    children: [
                                      Icon(Icons.person_add,size: 60,color: Colors.pink.shade400,),
                                      Text('Add User', style: TextStyle(color: Colors.pink.shade400, fontSize: 20,),),
                                    ],
                                  ),
                                ),
                                decoration: BoxDecoration(
                                  color: Colors.pink.withAlpha(50),
                                  borderRadius: BorderRadius.circular(10),
                                  // border: Border.all(
                                  //   color: Colors.pink.shade500, // Border color
                                  //   width: 2, // Border width
                                  // ),
                                ),
                              ),
                            ),
                          ),
                          Padding(padding: const EdgeInsets.all(20.0)),
                          Card(
                            elevation: 25,
                            child: GestureDetector(
                              onTap: (){
                                print("Box 2 tapped!");
                                Navigator.push(context, MaterialPageRoute(builder: (context) {
                                  return UserList();
                                }));
                              },
                              child: Container(
                                width: 120,
                                height: 120,
                                //color: Colors.white,
                                alignment: Alignment.center,
                                child: Padding(
                                  padding: const EdgeInsets.only(top: 15.0),
                                  child: Column(
                                    children: [
                                      Icon(Icons.list_alt_rounded,size: 60,color: Colors.pink.shade400
                                        ,),
                                      Text('User List', style: TextStyle(color: Colors.pink.shade400, fontSize: 20,),),
                                    ],
                                  ),
                                ),
                                decoration: BoxDecoration(
                                  color: Colors.pink.withAlpha(50),
                                  borderRadius: BorderRadius.circular(10),
                                  //color: Colors.red,
                                  // border: Border.all(
                                  //   color: Colors.pink.shade500, // Border color
                                  //   width: 2, // Border width
                                  // ),
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                      SizedBox(height: 30,),
                      Row(
                        children: [
                          Card(
                            elevation: 25,
                            child: GestureDetector(
                              onTap: (){
                                print("Box 3 tapped!");
                                Navigator.of(context).push(MaterialPageRoute(builder: (context){
                                  return Favourite();
                                }));
                              },
                              child: Container(
                                width: 120,
                                height: 120,
                                alignment: Alignment.center,
                                child: Padding(
                                  padding: const EdgeInsets.only(top: 15.0),
                                  child: Column(
                                    children: [
                                      Icon(Icons.favorite,size: 60,color: Colors.pink.shade400,),
                                      Text('Favourite', style: TextStyle(color: Colors.pink.shade400, fontSize: 20,),),
                                    ],
                                  ),
                                ),
                                decoration: BoxDecoration(
                                  color: Colors.pink.withAlpha(50),
                                  borderRadius: BorderRadius.circular(10),
                                  //color: Colors.red,
                                  // border: Border.all(
                                  //   color: Colors.pink.shade500, // Border color
                                  //   width: 2, // Border width
                                  // ),
                                ),
                              ),
                            ),
                          ),
                          Padding(padding: const EdgeInsets.all(20.0)),
                          Card(
                            elevation: 25,
                            child: GestureDetector(
                              onTap: (){
                                print("Box 4 tapped!");
                                Navigator.push(context, MaterialPageRoute(builder: (context){
                                  return AboutUs();
                                }));
                              },
                              child: Container(
                                width: 120,
                                height: 120,
                                //color: Colors.white,
                                alignment: Alignment.center,
                                child: Padding(
                                  padding: const EdgeInsets.only(top: 15.0),
                                  child: Column(
                                    children: [
                                      Icon(Icons.person_pin,size: 60,color: Colors.pink.shade400,),
                                      Text('About Us', style: TextStyle(color: Colors.pink.shade400, fontSize: 20,),),
                                    ],
                                  ),
                                ),
                                decoration: BoxDecoration(
                                  color: Colors.pink.withAlpha(50),
                                  borderRadius: BorderRadius.circular(10),
                                  //color: Colors.red,
                                  // border: Border.all(
                                  //   color: Colors.pink.shade500, // Border color
                                  //   width: 2, // Border width
                                  // ),
                                ),
                              ),
                            ),
                          ),
                        ],
                      )

                    ],
                  ),
                )
            ),
          ],

        ),
      ),
    ));
  }

  Widget getGesture(){
    return GestureDetector(
      onTap: (){
        print("Box 1 tapped!");
        },
      child: Container(
        width: 150,
        height: 150,
        //color: Colors.white,
        alignment: Alignment.center,
        child: Column(
          children: [
            Icon(Icons.library_books_rounded,size: 80,color: Colors.blue.shade900,),
            Text('ADD User', style: TextStyle(color: Colors.blue.shade900, fontSize: 25,),),
          ],
        ),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(30),
          //color: Colors.red,
          border: Border.all(
            color: Colors.blue.shade900, // Border color
            width: 5, // Border width
          ),
        ),
      ),
    );
  }

  //logout
  void logout() async {
    var prefs = await SharedPreferences.getInstance();
    await prefs.setBool("login", false); // Set login status to false

    // Navigate to LoginScreen and remove all previous routes
    Navigator.pushAndRemoveUntil(
      context,
      MaterialPageRoute(builder: (context) => LoginScreen()),
          (route) => false,
    );
  }
}
