// import 'dart:ui';
//
// import 'package:flutter/material.dart';
// import 'package:flutter_demo/lab15/to_do_list.dart';
// import 'package:flutter_demo/project_1/add_user.dart';
// import 'package:flutter_demo/project_1/my_Database.dart';
// import 'package:flutter_demo/project_1/user.dart';
// import 'package:flutter_demo/project_1/user_detail.dart';
//
// class UserList extends StatefulWidget {
//   //final List<Map<String, dynamic>> userList;
//
//   // Constructor to accept userList from DashboardScreen
//   //UserList({super.key, required this.userList});
//
//   @override
//   State<UserList> createState() => _UserListState();
//
// }
//
// class _UserListState extends State<UserList> {
//   MatromonialDatabase database= MatromonialDatabase();
//   User user = User();
//   // List<Map<String,dynamic>> filterList =[];
//
//   TextEditingController searchController= TextEditingController();
//   FocusNode searchFocusNode = FocusNode();
//
//   bool isSearch=false;
//   bool isFavourite = false;
//   bool isIconVisible=false;
//
//   void initState() {
//     // TODO: implement initState
//     super.initState();
//     // filterList=User.userList;
//     // // filterUser();
//     // searchController.addListener(filterUser);
//     if(searchController.text.isEmpty){
//       user.filteredUserList=User.userList;
//     }
//
//     // fetchUsers();
//     // searchController.addListener(() {
//     //   searchUser(searchData: searchController.text);
//     // });
//
//   }
//
//   void searchUser({required String searchData}) {
//     // setState(() {
//     if (searchData.isEmpty) {
//       user.filteredUserList = List.from(User.userList);
//     } else {
//       user.filteredUserList = User.userList.where((element) =>
//       element[MatromonialDatabase.NAME]
//           .toString()
//           .toLowerCase()
//           .contains(searchData.toLowerCase()) ||
//           element[MatromonialDatabase.ADDRESS]
//               .toString()
//               .toLowerCase()
//               .contains(searchData.toLowerCase())).toList();
//     }
//
//     // if (mounted) {
//     // setState(() {
//     WidgetsBinding.instance.addPostFrameCallback((_) {
//       searchFocusNode.requestFocus();
//     });
//     // });
//     // }
//     // });
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return SafeArea(child: Scaffold(
//         appBar: AppBar(
//           backgroundColor: Colors.pink[200],
//           // backgroundColor: Colors.blue,
//           title: Text("UserList",style: TextStyle(color: Colors.white,fontSize: 30,fontWeight: FontWeight.bold),),
//           centerTitle: true,
//           actions: [
//             Icon(Icons.notification_add_sharp,size: 40,color: Colors.white,)
//           ],
//         ),
//         body:FutureBuilder(future: user.getUserList(),
//             builder: (context,snapshot){
//               if(snapshot.connectionState==ConnectionState.waiting){
//                 return Center(child: CircularProgressIndicator(),);
//               }
//               else if(snapshot.hasData){
//                 return  Container(
//                   decoration: BoxDecoration(
//
//                   ),
//                   child: Stack(
//                     fit: StackFit.expand,
//                     children: [
//
//                       Column(
//                         children: [
//                           Padding(
//                             padding: const EdgeInsets.all(8.0),
//                             child: TextFormField(
//                               controller: searchController,
//                               // autofocus: searchController.text.isEmpty ?false : true,
//                               focusNode: searchFocusNode,
//                               onChanged: (value) {
//                                 searchUser(searchData: value);
//                               },
//                               decoration: InputDecoration(
//                                   filled: true,
//                                   fillColor: Colors.white,
//                                   hintText: "Search here.....",
//                                   border: OutlineInputBorder(borderRadius: BorderRadius.circular(30)),
//                                   suffixIcon: Icon(Icons.search)
//                               ),
//                               // onChanged: (value) {
//                               //   searchUser(searchData: value.toString());
//                               // },
//
//                             ),
//                           ),
//                           Container(
//                             child: Expanded(
//                                 child: user.filteredUserList.isEmpty
//                                 // && searchController.text.isNotEmpty
//                                     ? Center(child: Text("No Data Found"))
//                                     : ListView.builder(
//                                     itemCount: user.filteredUserList.length,
//                                     itemBuilder:(context,index){
//                                       return getUserList(index);
//                                     })
//                               // ListView.builder(
//                               //     itemCount:
//                               //         user.filteredUserList.isEmpty
//                               //         && searchController.text.isEmpty
//                               //         ? User.userList.length : user.filteredUserList.length,
//                               //     itemBuilder: (context,index){
//                               //       return searchController.text.isEmpty?getUserList(index):getFilterList(index);
//                               //       // Card(
//                               //       //   color: Colors.pink.shade50,
//                               //       //   elevation: 20,
//                               //       //   child: ListTile(
//                               //       //     onTap: (){
//                               //       //       Navigator.push(context, MaterialPageRoute(builder: (context){
//                               //       //         return UserDetail(index: int.tryParse(user.filteredUserList[index]["USER_ID"].toString()) ?? 0 );
//                               //       //       }));
//                               //       //     },
//                               //       //     title: Text(user.filteredUserList[index]["NAME"],style: TextStyle(color: Colors.pink),),
//                               //       //     subtitle: Text('${user.filteredUserList[index]["EMAIL"]}   -------   ${user.filteredUserList[index]["PHONE"]}'),
//                               //       //   ),
//                               //       // ) ;
//                               //     }),
//                             ),
//                           ),
//                         ],
//                       )
//                     ],
//                   ),
//                 );
//               }
//               else{
//                 return Text("ERRORRR............");
//               }
//             })
//     ),
//     );
//   }
//
//   Widget buildLeadingIcon(Map role) {
//     if (role["GENDER"] == 'Female') {
//       return ClipOval(
//         child: Image.asset(
//           'asets/Images/girl_img.jpg', // Replace with real URL
//           width: 50,
//           height: 70,
//           fit: BoxFit.cover,
//         ),
//       );
//     }  else {
//       return ClipOval(
//         child: Image.asset(
//           'asets/Images/boy_img.jpg', // Replace with real URL
//           width: 50,
//           height: 70,
//           fit: BoxFit.cover,
//         ),
//       );
//     }
//   }
//   Widget getUserList(i){
//     return Padding(
//       padding: const EdgeInsets.all(10.0),
//       child: Card(
//         color: Colors.pink.shade50,
//         elevation: 10,
//         shape: RoundedRectangleBorder(
//           borderRadius: BorderRadius.circular(20), // Optional: for rounded corners
//         ),
//         child: Container(
//           decoration: BoxDecoration(
//             // color: Colors.pink.withAlpha(5),
//             borderRadius: BorderRadius.circular(20),
//           ),
//           child: ListTile(
//             onTap: (){
//               Navigator.push(context, MaterialPageRoute(builder: (context){
//                 return UserDetail(index: i);
//               }));
//             },
//
//             title: Row(
//               children: [
//                 Icon(Icons.person ,size: 20,color: Colors.pink.shade300,),
//                 Text(user.filteredUserList[i]["NAME"],style: TextStyle(color: Colors.pink.shade300),),
//               ],
//             ),
//             subtitle: Column(children: [
//               Text('${user.filteredUserList[i]["EMAIL"]}',overflow: TextOverflow.ellipsis,style: TextStyle(color: Colors.pink.shade300),),
//               SizedBox(height: 5,),
//               Row(children: [Icon(Icons.phone,size: 18,color: Colors.pink.shade300,),Text('${user.filteredUserList[i]["PHONE"]}',style: TextStyle(color: Colors.pink.shade300),),],),
//               Text('${user.filteredUserList[i]["ADDRESS"]}',overflow: TextOverflow.ellipsis,style: TextStyle(color: Colors.pink.shade300),),
//
//               if (user.filteredUserList[i]["ISVISIBLE"]==1)
//                 if (user.filteredUserList[i]["ISVISIBLE"] == 1)
//                   Row(
//                     children: [
//                       Expanded(
//                         child: IconButton(onPressed: ()  async{
//                           int newFavorite = user.filteredUserList[i][MatromonialDatabase.FAV] == 1 ? 0 : 1;
//                           await user.updateFavorite(user.filteredUserList[i][MatromonialDatabase.USER_ID], newFavorite);
//                           setState(() {});
//                           print(User.favouriteList);
//                         }, icon: user.filteredUserList[i]['${MatromonialDatabase.FAV}']==1 ?Icon(Icons.favorite,color: Colors.red,):Icon(Icons.favorite_border_sharp,color: Colors.pink,)),
//                       ),
//                       Expanded(
//                         child: IconButton(
//                           onPressed: () {
//                             showDialog(
//                               context: context,
//                               builder: (context) {
//                                 return AlertDialog(
//                                   title: Text("DELETE"),
//                                   content: Text("Are you sure you want to delete?"),
//                                   actions: [
//                                     TextButton(
//                                       onPressed: () {
//                                         user.deleteUser(user.filteredUserList[i][MatromonialDatabase.USER_ID]);
//                                         Navigator.pop(context);
//                                         setState(() {});
//                                       },
//                                       child: Text("Yes"),
//                                     ),
//                                     TextButton(
//                                       onPressed: () {
//                                         Navigator.pop(context);
//                                         setState(() {});
//                                       },
//                                       child: Text("No"),
//                                     )
//                                   ],
//                                 );
//                               },
//                             );
//                           },
//                           icon: Icon(Icons.delete, color: Colors.redAccent),
//                         ),
//                       ),
//                       Expanded(
//                         child: IconButton(
//                           onPressed: () {
//                             Navigator.push(
//                               context,
//                               MaterialPageRoute(
//                                 builder: (context) {
//                                   // print('userDetail::::::::::::::::${ User.userList[i]}');
//                                   return AddUser(userDetail: user.filteredUserList[i]);
//                                 },
//                               ),
//                             ).then((value) {
//                               if (value != null) {
//                                 user.updateUser(user.filteredUserList[i][MatromonialDatabase.USER_ID],value);
//                                 setState(() {});
//                               }
//                             });
//                           },
//                           icon: Icon(Icons.edit, size: 30, color: Colors.pink.shade400),
//                         ),
//                       ),
//                     ],
//                   ),
//             ],),
//             leading: buildLeadingIcon(user.filteredUserList[i]),
//             trailing: IconButton(
//               onPressed: () async {
//                 await user.toggleVisibility(user.filteredUserList[i]['${MatromonialDatabase.USER_ID}'],user.filteredUserList[i]['${MatromonialDatabase.ISVISIBLE}']);
//                 setState(() {
//                 });
//
//                 print("Updated ISVISIBLE: ${user.filteredUserList[i]["ISVISIBLE"]}");
//               },
//               icon: Icon(Icons.more_horiz, color: Colors.pink),
//             ),
//
//           ),
//         ),
//       ),
//     );
//   }
//   Column getbgColor(BuildContext context){
//     return Column(
//       children: [
//         Container(
//           width: double.infinity,
//           height: 200,
//           decoration: BoxDecoration(
//               color: Colors.pink.shade300,
//               borderRadius: BorderRadius.only(
//                 bottomLeft: Radius.circular(50),
//                 bottomRight: Radius.circular(50),
//               )
//           ),
//         ),
//
//       ],
//     );
//   }
// }
