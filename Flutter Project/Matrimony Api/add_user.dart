import 'dart:convert';
import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_animated_button/flutter_animated_button.dart';
import 'package:flutter_api/project_1/api.dart';
import 'package:intl/intl.dart';

class AddUser extends StatefulWidget {
 // const AddUser({super.key});

  @override
  State<AddUser> createState() => _AddUserState();
  Map<String, dynamic>? userDetail;

  //constructure
  AddUser({super.key, Map<String,dynamic>? userDetail}){
    this.userDetail=userDetail;
  }
}

class _AddUserState extends State<AddUser> {
  List<String> cities = ['Ahmedabad', 'Surat', 'Rajkot', 'Vadodara'];
  String? selectedCity;
  String? selectedGender='Female';
  bool? isChecked1 = false;
  bool? isChecked2 = false;
  bool isChecked3 = false;
  bool obscure1= true;
  bool obscure2=true;


  TextEditingController namecontroller = TextEditingController();
  TextEditingController addresscontroller = TextEditingController();
  TextEditingController emailcontroller = TextEditingController();
  TextEditingController phonecontroller = TextEditingController();
  TextEditingController dobcontroller= TextEditingController();
  TextEditingController passcontroller= TextEditingController();
  TextEditingController confirmPass= TextEditingController();
  String typeButton='';

  DateTime? date= DateTime.now().subtract(Duration(days: 365 * 21));

  int findIndex(List<String> cities, selectedCity) {
    for (int i = 0; i < cities.length; i++) {
      if (selectedCity.toString().toLowerCase() ==
          cities[i].toString().toLowerCase()) {
        return i;
      }
    }
    return 0;

  }

  void initState() {
    super.initState();
    if (widget.userDetail != null) {

      // List<dynamic> hobbyList = List<dynamic>.from(widget.userDetail!["HOBBY"]);
      // List<bool?> hobbyList = List<bool?>.from(jsonDecode(widget.userDetail!["HOBBY"]));
      namecontroller.text = widget.userDetail!["NAME"].toString();
      addresscontroller.text = widget.userDetail!["ADDRESS"].toString();

      emailcontroller.text = widget.userDetail!["EMAIL"].toString();
      phonecontroller.text = widget.userDetail!["PHONE"].toString();
      dobcontroller.text=widget.userDetail!["DOB"].toString();
      passcontroller.text= widget.userDetail!["PASS"].toString();
      confirmPass.text=widget.userDetail!["CONPASS"].toString();
      selectedGender=widget.userDetail!["GENDER"] ?? 'Female';
      selectedCity=widget.userDetail!["CITY"] ?? cities[0];
      // isChecked1=hobbyList[0]??false;
      // isChecked2=hobbyList[1]??false;
      // isChecked3=hobbyList[2]??false;
      typeButton = 'Edit User';
      // try{
      //   date = DateFormat('dd-MMM-yyyy').parse(dobcontroller.text);
      // }catch(e){
      //   print("::::::::::::::::::::::::::::::::::::erorrrrr$e");
      // }
    }
    else {
      typeButton = 'Add User';
    }
  }


  GlobalKey<FormState> _formkey = GlobalKey();
  ApiService apidata= ApiService();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child:Scaffold(
          backgroundColor: Colors.pink.shade50,
          appBar: AppBar(
            backgroundColor: Colors.pink[300],
            title: Text('${typeButton}',style: TextStyle(color: Colors.white,fontSize: 30,fontWeight: FontWeight.bold),),
            centerTitle: true,
            automaticallyImplyLeading: false,

          ),

          body: SafeArea(
              child: Stack(
                alignment: AlignmentDirectional.center,
                children: [
                  getbgColor(context),
                  Positioned(
                    // top: 50,
                    child: SingleChildScrollView(
                      child: Container(
                        height: 550,
                        width: 320,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(30),
                          color: Colors.white
                        ),
                        child: Padding(
                          padding: const EdgeInsets.only(top: 8.0,bottom: 18.0),
                          child: SingleChildScrollView(
                            child: Form(
                              key: _formkey,
                              child: Padding(
                                padding: const EdgeInsets.only(top: 30.0,left: 5.0,right: 5.0),
                                child: Container(
                                  //height: 700,
                                  // width: 600,
                                  child: Column(
                                    children: [
                                      Padding(padding: EdgeInsets.only(top: 10.0)),
                                      Row(
                                        children: [
                                          Expanded(
                                            child: TextFormField(
                                              validator: (value){
                                                if(value!.isEmpty){
                                                  return 'Enter your Name';
                                                }
                                                if(!RegExp(r'^[a-zA-Z\s]{3,50}$').hasMatch(value!)){
                                                  return "Enter valid full name ";
                                                }
                                                return null;
                                              },
                                              controller: namecontroller,
                                              decoration: InputDecoration(
                                                  filled: true,
                                                  fillColor: Colors.white54,
                                                  labelText: 'Name',
                                                  labelStyle: TextStyle(color: Colors.pink),
                                                  hintText: 'Enter your Name',
                                                  prefixIcon: Icon(Icons.person, color: Colors.pink.shade200),
                                                  enabledBorder: OutlineInputBorder(
                                                    borderRadius: BorderRadius.circular(10),
                                                    borderSide: BorderSide(color: Colors.pink)
                                                  ),
                                                  focusedBorder: OutlineInputBorder(
                                                  borderRadius: BorderRadius.circular(10),
                                                  borderSide: BorderSide(color: Colors.pinkAccent, width: 2.5), // Focused state
                                                ),
                                              ),
                                            ),flex: 5,
                                          ),
                                        ],
                                      ),
                                      SizedBox(height: 10,),
                                      Row(
                                        children: [
                                          Expanded(
                                            child: TextFormField(
                                              maxLines: 2,
                                              controller: addresscontroller,
                                              decoration: InputDecoration(
                                                  filled: true,
                                                  fillColor: Colors.white54,
                                                  labelText: 'Address',
                                                  labelStyle: TextStyle(color: Colors.pink),
                                                  hintText: 'Enter your Address',
                                                  prefixIcon: Icon(Icons.home, color: Colors.pink.shade200),
                                                  enabledBorder: OutlineInputBorder(
                                                      borderRadius: BorderRadius.circular(10),
                                                      borderSide: BorderSide(color: Colors.pink)
                                                  ),
                                                  focusedBorder: OutlineInputBorder(
                                                    borderRadius: BorderRadius.circular(10),
                                                    borderSide: BorderSide(color: Colors.pinkAccent, width: 2.5), // Focused state
                                                  ),
                                              ),
                                              validator: (value){
                                                if(value!.isEmpty){
                                                  return "Enter your Address";
                                                }
                                                if(!RegExp(r'^[a-zA-Z0-9._%+-\s]{5,}$').hasMatch(value!)){
                                                  return "Enter your Address properly";
                                                }
                                                return null;
                                              },
                                            ),flex: 5,
                                          ),
                                        ],
                                      ),
                                      SizedBox(height: 10,),
                                      Row(
                                        children: [
                                          Expanded(
                                            child: TextFormField(
                                              controller: emailcontroller,
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
                                            ),flex: 5,
                                          ),
                                        ],
                                      ),
                                      SizedBox(height: 10,),
                                      Row(
                                        children: [
                                          Expanded(
                                            child: TextFormField(
                                              maxLength: 10,
                                              controller: phonecontroller,
                                              decoration: InputDecoration(
                                                  filled: true,
                                                  fillColor: Colors.white54,
                                                  labelText: 'Phone',
                                                  labelStyle: TextStyle(color: Colors.pink),
                                                  hintText: 'Enter your Mobile No',
                                                  prefixIcon: Icon(Icons.phone, color: Colors.pink.shade200),
                                                  enabledBorder: OutlineInputBorder(
                                                      borderRadius: BorderRadius.circular(10),
                                                      borderSide: BorderSide(color: Colors.pink)
                                                  ),
                                                  focusedBorder: OutlineInputBorder(
                                                    borderRadius: BorderRadius.circular(10),
                                                    borderSide: BorderSide(color: Colors.pinkAccent, width: 2.5), // Focused state
                                                  ),
                                              ),
                                              validator: (value){
                                                if(value!.isEmpty){
                                                  return "Enter Your Phone No";
                                                }
                                                if(value.length != 10){
                                                  return "Enter valid Phone No.";
                                                }
                                                return null;
                                              },
                                              keyboardType: TextInputType.phone,
                                              inputFormatters: [
                                                FilteringTextInputFormatter.allow(RegExp(r'[0-9]'))
                                              ],
                                            ),flex: 5,
                                          ),
                                        ],
                                      ),
                                      SizedBox(height: 10,),
                                      Row(
                                        children: [
                                          Text("City :   ",style: TextStyle(color: Colors.pink,fontSize: 20),),
                                          DropdownButton(
                                            value: selectedCity,
                                            hint: Text("Select a City"),
                                            dropdownColor: Colors.white,  // Set dropdown menu background color
                                            style: TextStyle(color: Colors.pink),
                                            icon: Icon(
                                              Icons.arrow_drop_down,  // Dropdown arrow icon
                                              color: Colors.pink,       // Set the arrow color
                                            ),
                                            items: cities.map((city) {
                                              return DropdownMenuItem(
                                                value: city,
                                                child: Text(city.toString(),),
                                              );
                                            }).toList(),
                                            onChanged: (value) {
                                              setState(() {
                                                selectedCity = value;
                                              });
                                            },
                                          ),
                                        ],
                                      ),
                                      SizedBox(height: 10,),
                                      Row(
                                        children: [
                                          Expanded(
                                            child: TextFormField(
                                              controller: dobcontroller,
                                              decoration: InputDecoration(
                                                filled: true,
                                                fillColor: Colors.white54,
                                                labelText: 'Date of Birth',
                                                labelStyle: TextStyle(color: Colors.pink),
                                                enabledBorder: OutlineInputBorder(
                                                    borderRadius: BorderRadius.circular(10),
                                                    borderSide: BorderSide(color: Colors.pink)
                                                ),
                                                focusedBorder: OutlineInputBorder(
                                                  borderRadius: BorderRadius.circular(10),
                                                  borderSide: BorderSide(color: Colors.pinkAccent, width: 2.5), // Focused state
                                                ),
                                                suffixIcon: IconButton(
                                                  icon: Icon(Icons.calendar_month),
                                                  onPressed: () async{
                                                    // DateTime defaultDate =  DateTime.now().subtract(Duration(days: 365 * 21));
                                                     date = await showDatePicker(
                                                        context: context,
                                                        initialDate: date,
                                                        firstDate: DateTime(1945),
                                                        lastDate: DateTime(2007));
                                                    if(date != null ){
                                                      setState(() {
                                                        dobcontroller.text=DateFormat('dd-MM-yyyy').format(date!);
                                                      });
                                                    }
                                                  },// Open the date picker
                                                ),
                                                border: OutlineInputBorder(),
                                              ),
                                            ),flex: 5,
                                          ),
                                        ],
                                      ),
                                      SizedBox(height: 10,),
                                      Row(
                                        children: [
                                          Text("Gender : ",style: TextStyle(color:Colors.pink,fontSize: 20),),
                                          Radio(
                                            value: 'Male',
                                            groupValue: selectedGender, // Set this to the default selected value
                                            onChanged: (value) {
                                              setState(() {
                                                selectedGender = value!; // Update the selected value
                                              });
                                            },
                                            activeColor: Colors.pink, // Customize the color for selected radio button
                                          ),
                                          Text('Male',style: TextStyle(color: Colors.pink),),
                                          Radio(
                      
                                            value: 'Female',
                                            groupValue: selectedGender, // Set this to the default selected value
                                            onChanged: (value) {
                                              setState(() {
                                                selectedGender = value!; // Update the selected value
                                              });
                                            },
                                            activeColor: Colors.pink, // Customize the color for selected radio button
                                          ),
                                          Text('Female',style: TextStyle(color: Colors.pink),),
                                        ],
                                      ),
                                      SizedBox(height: 10,),
                                      Row(
                                        children: [
                                          // Text("Hobbies : ",style: TextStyle(color:Colors.white),),
                                          Checkbox(
                                            value: isChecked1,
                                            onChanged: (bool? value) {
                                              setState(() {
                                                isChecked1 = value ?? false;
                                              });
                                            },
                                          ),
                                          Text("Reading",style: TextStyle(color: Colors.pink),),
                                          Checkbox(
                                            value: isChecked2,
                                            onChanged: (bool? value) {
                                              setState(() {
                                                isChecked2 = value ?? false;
                                              });
                                            },
                                          ),
                                          Text("Music",style: TextStyle(color: Colors.pink),),
                                          Checkbox(
                                            value: isChecked3,
                                            onChanged: (bool? value) {
                                              setState(() {
                                                isChecked3 = value ?? false;
                                              });
                                            },
                                          ),
                                          Text("Draw",style: TextStyle(color: Colors.pink),),
                                        ],
                                      ),
                                      SizedBox(height: 10,),
                                      Row(
                                        children: [
                                          Expanded(
                                            child: TextFormField(
                                              validator: (value){
                                                if(value!.isEmpty){
                                                  return 'Enter your Password';
                                                }
                                                // if(!RegExp(r'^[a-zA-Z\s]{3,50}$').hasMatch(value!)){
                                                //   return "Enter valid full name ";
                                                // }
                                                return null;
                                              },
                                              obscureText: obscure1,
                                              controller: passcontroller,
                                              decoration: InputDecoration(
                                                  suffixIcon: IconButton(
                                                      onPressed: (){obscure1=!obscure1;
                                                      setState(() {});
                                                      }, icon: Icon(Icons.remove_red_eye_sharp)),
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
                                            ),flex: 5,
                                          ),
                                        ],
                                      ),
                                      SizedBox(height: 10,),
                                      Row(
                                        children: [
                      
                                          Expanded(
                                            child: TextFormField(
                                              validator: (value){
                                                if(value!.isEmpty){
                                                  return 'Enter Re-Password';
                                                }
                                                if(passcontroller.text != confirmPass.text){
                                                  return "Enter Correct Password";
                                                }
                                                return null;
                                              },
                                              obscureText: obscure2,
                                              controller: confirmPass,
                                              decoration: InputDecoration(
                                                  suffixIcon: IconButton(
                                                      onPressed: (){obscure2=!obscure2;
                                                      setState(() {});
                                                      }, icon: Icon(Icons.remove_red_eye_sharp)),
                                                  filled: true,
                                                  fillColor: Colors.white54,
                                                  labelText: 'Password',
                                                  hintText: 'Enter Re-Password',
                                                  prefixIcon: Icon(Icons.password_outlined, color: Colors.pink.shade200),
                                                  enabledBorder: OutlineInputBorder(
                                                      borderRadius: BorderRadius.circular(10),
                                                      borderSide: BorderSide(color: Colors.pink)
                                                  ),
                                                  focusedBorder: OutlineInputBorder(
                                                    borderRadius: BorderRadius.circular(10),
                                                    borderSide: BorderSide(color: Colors.pinkAccent, width: 2.5), // Focused state
                                                  ),
                                              ),
                                            ),flex: 5,
                                          ),
                                        ],
                                      ),
                                      SizedBox(height: 30,),
                                      Row(
                                        children: [
                                          Padding(padding: const EdgeInsets.only(left: 60.0)),
                                          ElevatedButton(
                                              style: ElevatedButton.styleFrom(backgroundColor: Colors.pink),
                                              onPressed: (){
                                                setState(() {
                                                  namecontroller.clear();
                                                  addresscontroller.clear();
                                                  emailcontroller.clear();
                                                  phonecontroller.clear();
                                                  dobcontroller.clear();
                                                  passcontroller.clear();
                                                  confirmPass.clear();
                                                  isChecked1=false;
                                                  isChecked2=false;
                                                  isChecked3=false;
                                                  selectedGender='Female';
                                                  selectedCity=cities[0];
                      
                                                });
                                              },
                                              child: Text("Reset",style: TextStyle(color: Colors.white),)),
                                          Padding(padding: const EdgeInsets.only(right: 20.0),),
                                          ElevatedButton(
                                            // height: 70,
                                            // width: 100,
                                            // selectedTextColor: Colors.grey,
                                            // transitionType: TransitionType.CENTER_LR_IN,
                                            // backgroundColor: Colors.red,
                                            // borderColor: Colors.white,
                                            // borderRadius: 20,
                                            onPressed: (){
                                              Map<String,dynamic> map ={};
                                              map["NAME"]=namecontroller.text.toString();
                                              map["ADDRESS"]=addresscontroller.text.toString();
                                              map["EMAIL"]=emailcontroller.text.toString();
                                              map["PHONE"]=phonecontroller.text.toString();
                                              map["CITY"]=selectedCity;
                                              map["DOB"]=dobcontroller.text.toString();
                                              map["GENDER"]=selectedGender;
                                              map["HOBBY"]=[isChecked1,isChecked2,isChecked3].toList();
                                              map["PASS"]=passcontroller.text.toString();
                                              map["CONPASS"]=confirmPass.text.toString();

                                              if(_formkey.currentState!.validate()){
                                                print("Submit Successfully");
                                                print(map);
                                                Navigator.pop(context,map);
                                              }
                                          },
                                              style: ElevatedButton.styleFrom(backgroundColor: Colors.pink),
                                              child: Text('${typeButton}',style: TextStyle(color: Colors.white),)),
                                            // text: 'Submit',
                                        ],
                                      )
                                    ],
                                  ),
                      
                                ),
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),

                ],
          )),

        ));

  }

  Column getbgColor(BuildContext context){
    return Column(
      children: [
        Container(
          width: double.infinity,
          height: 200,
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
