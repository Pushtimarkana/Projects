import 'package:flutter/material.dart';
import 'package:flutter_demo/project_1/bottomNavigationBar.dart';
import 'package:flutter_demo/project_1/splash_screen.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  var emailController = TextEditingController();
  var passController =TextEditingController();
  var emailValue='No Value Saved';


  SplashScreen spscreen = SplashScreen();
  GlobalKey<FormState> _formkey = GlobalKey();

  // @override
  // void initState() {
  //   // TODO: implement initState
  //   super.initState();
  //   getValue();
  // }
  @override
  Widget build(BuildContext context) {
    return SafeArea(child: Scaffold(
      // appBar: AppBar(
      //   title: Text("Login",style: TextStyle(color: Colors.white),),
      //   backgroundColor: Colors.pink.shade200,
      // ),
      body: Stack(
        alignment: AlignmentDirectional.center,
        children: [
          getbgColor(context),
          Positioned(
              top: 50,
              child: Container(
                height: 100,
                padding: EdgeInsets.all(20),
                width: 270,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(30),
                    color: Colors.pink[50]
                ),
                child: Center(child: Text("Login",style: TextStyle(color: Colors.pink.shade300,fontSize: 40),)),
              )
          ),
          SingleChildScrollView(
            child: Form(
              key: _formkey,
              child: Center(
                child: Padding(
                  padding: const EdgeInsets.only(top: 100.0,left: 40,right: 40),
                  child: Card(
                    elevation: 25,
                    color: Colors.pink[50],
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(30), // Adjust the value for more/less roundness
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(15.0),
                      child: Column(
                        children: [
                          Icon(Icons.person,size: 100,color: Colors.pink.shade200,),
                          // TextFormField(
                          //   controller: emailController,
                          // decoration: InputDecoration(
                          //   hintText: 'Email',
                          //   border: OutlineInputBorder(
                          //     borderRadius: BorderRadius.circular(20)
                          //   )
                          // ),),

                          TextFormField(
                            controller: emailController,
                            keyboardType: TextInputType.emailAddress,
                            decoration: InputDecoration(
                              filled: true,
                              fillColor: Colors.white54,
                              labelText: 'Email',
                              labelStyle: TextStyle(color: Colors.pink),
                              hintText: 'Enter your Email',
                              prefixIcon: Icon(Icons.email, color: Colors.pink.shade200),
                              enabledBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(10),
                                  borderSide: BorderSide(color: Colors.pink)
                              ),
                              focusedBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(10),
                                borderSide: BorderSide(color: Colors.pinkAccent, width: 2.5), // Focused state
                              ),
                            ),
                            validator: (value) {
                              if (value!.isEmpty) {
                                return "Enter your email";
                              }
                              if (!RegExp(
                                  r'^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}$')
                                  .hasMatch(value!)) {
                                return "Enter your email properly";
                              }
                              return null;
                            },
                          ),
                          SizedBox(height: 30,),
                          // TextFormField(
                          //   controller: passController,
                          //   decoration: InputDecoration(
                          //     hintText: 'Password',
                          //       border: OutlineInputBorder(
                          //           borderRadius: BorderRadius.circular(20)
                          //       )
                          //   ),),

                          TextFormField(
                            validator: (value){
                              if(value!.isEmpty){
                                return 'Enter your Password';
                              }
                              // if(!RegExp(r'^[a-zA-Z\s]{3,50}$').hasMatch(value!)){
                              //   return "Enter valid full name ";
                              // }
                              return null;
                            },
                            // obscureText: obscure1,
                            obscureText: true,
                            controller: passController,
                            decoration: InputDecoration(
                              // suffixIcon: IconButton(
                              //     onPressed: (){obscure1=!obscure1;
                              //     setState(() {});
                              //     }, icon: Icon(Icons.remove_red_eye_sharp)),
                              filled: true,
                              fillColor: Colors.white54,
                              labelText: 'Password',
                              hintText: 'Enter your Password',
                              prefixIcon: Icon(Icons.password, color: Colors.pink.shade200),
                              enabledBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(10),
                                  borderSide: BorderSide(color: Colors.pink)
                              ),
                              focusedBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(10),
                                borderSide: BorderSide(color: Colors.pinkAccent, width: 2.5), // Focused state
                              ),
                            ),
                          ),
                          SizedBox(height: 30,),
                          ElevatedButton(
                              onPressed: () async {
                                var email=emailController.text.toString();
                                var pass=passController.text.toString();
                                var shrefPref =  await SharedPreferences.getInstance();

                                if(_formkey.currentState!.validate()){
                                  print("Submit Successfully");

                                  shrefPref.setBool(SplashScreenState.KEYLOGIN, true);
                                  // prefs.setString("email",email);
                                  Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) {
                                    return Bottomnavigationbar();
                                  }));

                                }

                              },
                              child: Text("LOGIN",style: TextStyle(color: Colors.white),),
                              style:ElevatedButton.styleFrom(backgroundColor: Colors.pink.shade200),
                          ),

                          SizedBox(height: 30,),
                          Text(emailValue),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    ));
  }

  // void getValue() async {
  //   var prefs= await SharedPreferences.getInstance();
  //   var getEmail=prefs.getString("email");
  //   emailValue= getEmail ?? 'No value saved';
  //   setState(() {});
  // }

  Column getbgColor(BuildContext context){
    return Column(
      children: [
        Container(
          width: double.infinity,
          height: 100,
          decoration: BoxDecoration(
              color: Colors.pink.shade300,
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
