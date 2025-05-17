import 'package:flutter/material.dart';
import 'package:flutter_api/project_1/add_user.dart';
import 'package:flutter_api/project_1/api.dart';
import 'package:flutter_api/project_1/my_Database.dart';
import 'package:flutter_api/project_1/user.dart';
import 'package:flutter_api/project_1/user_detail.dart';

class UserList extends StatefulWidget {
  @override
  State<UserList> createState() => _UserListState();
}

class _UserListState extends State<UserList> {
  ApiService apidata= ApiService();
  User user = User();

  TextEditingController searchController = TextEditingController();
  FocusNode searchFocusNode = FocusNode();

  @override
  void initState() {
    super.initState();
    searchController.addListener(() {
      searchUser(searchData: searchController.text);
    });

    if (searchController.text.isEmpty) {
      User.filteredUserList = User.userList;
    }
  }

  void searchUser({required String searchData}) {
    if (searchData.isEmpty) {
      User.filteredUserList = List.from(User.userList);
    } else {
      User.filteredUserList = User.userList.where((element) =>
      element["NAME"]
          .toString()
          .toLowerCase()
          .contains(searchData.toLowerCase()) ||
          element["ADDRESS"]
              .toString()
              .toLowerCase()
              .contains(searchData.toLowerCase()))
          .toList();
    }

    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.pink[200],
          title: Text(
            "User List",
            style: TextStyle(
                color: Colors.white, fontSize: 30, fontWeight: FontWeight.bold),
          ),
          centerTitle: true,
          actions: [
            Icon(Icons.notification_add_sharp, size: 40, color: Colors.white)
          ],
        ),
        body: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: TextFormField(
                controller: searchController,
                focusNode: searchFocusNode,
                onChanged: (value) {
                  searchUser(searchData: value);
                },
                decoration: InputDecoration(
                  filled: true,
                  fillColor: Colors.white,
                  hintText: "Search here.....",
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(30)),
                  suffixIcon: Icon(Icons.search),
                ),
              ),
            ),
            Expanded(
              child: FutureBuilder(
                future: apidata.getUsers(),
                builder: (context, snapshot) {
                  if (snapshot.connectionState == ConnectionState.waiting) {
                    return Center(child: CircularProgressIndicator());
                  } else if (snapshot.hasData) {
                    User.filteredUserList=snapshot.data!;
                    return User.filteredUserList.isEmpty
                        ? Center(child: Text("No Data Found"))
                        : ListView.builder(
                      itemCount: User.filteredUserList.length,
                      itemBuilder: (context, index) {
                        return getUserList(index);
                      },
                    );
                  } else {
                    return Center(child: Text("ERROR..."));
                  }
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
  Widget getUserList(i){
    return Padding(
      padding: const EdgeInsets.all(10.0),
      child: Card(
        color: Colors.pink.shade50,
        elevation: 10,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(20), // Optional: for rounded corners
        ),
        child: Container(
          decoration: BoxDecoration(
            // color: Colors.pink.withAlpha(5),
            borderRadius: BorderRadius.circular(20),
          ),
          child: ListTile(

            title: Row(
              children: [
                Icon(Icons.person ,size: 20,color: Colors.pink.shade300,),
                Text(User.filteredUserList[i]["NAME"],style: TextStyle(color: Colors.pink.shade300),),
              ],
            ),
            subtitle: InkWell(
              onTap: (){
                print("::::::::::::::::::::::::::::::::::::::::::::::::$i ::::::::::::::::::::::::::");
                Navigator.push(context, MaterialPageRoute(builder: (context){
                  return UserDetail(index: i);
                }));
              },

              child: Column(children: [
                Text('${User.filteredUserList[i]["EMAIL"]}',overflow: TextOverflow.ellipsis,style: TextStyle(color: Colors.pink.shade300),),
                SizedBox(height: 5,),
                Row(children: [Icon(Icons.phone,size: 18,color: Colors.pink.shade300,),Text('${User.filteredUserList[i]["PHONE"]}',style: TextStyle(color: Colors.pink.shade300),),],),
                Text('${User.filteredUserList[i]["ADDRESS"]}',overflow: TextOverflow.ellipsis,style: TextStyle(color: Colors.pink.shade300),),

                if (User.filteredUserList[i]["ISVISIBLE"]==true)
                  if (User.filteredUserList[i]["ISVISIBLE"] == true)
                    Row(
                      children: [
                        Expanded(
                          child: IconButton(onPressed: ()  async{
                             User.filteredUserList[i]["FAV"] = !User.filteredUserList[i]["FAV"] ;
                            await apidata.updateFavorite(User.filteredUserList[i]["id"],  User.filteredUserList[i]["FAV"]);
                            setState(() {});
                            print(User.favouriteList);
                          }, icon: User.filteredUserList[i]['FAV']==true ?Icon(Icons.favorite,color: Colors.red,):Icon(Icons.favorite_border_sharp,color: Colors.pink,)),
                        ),
                        Expanded(
                          child: IconButton(
                            onPressed: () {
                              showDialog(
                                context: context,
                                builder: (context) {
                                  return AlertDialog(
                                    title: Text("DELETE"),
                                    content: Text("Are you sure you want to delete?"),
                                    actions: [
                                      TextButton(
                                        onPressed: () {
                                          apidata.deleteUser(User.filteredUserList[i]["id"]);
                                          Navigator.pop(context);
                                          setState(() {
                                            // User.filteredUserList.removeAt(i);
                                          });
                                        },
                                        child: Text("Yes"),
                                      ),
                                      TextButton(
                                        onPressed: () {
                                          Navigator.pop(context);
                                          setState(() {});
                                        },
                                        child: Text("No"),
                                      )
                                    ],
                                  );
                                },
                              );
                            },
                            icon: Icon(Icons.delete, color: Colors.redAccent),
                          ),
                        ),
                        Expanded(
                          child: IconButton(
                            onPressed: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) {
                                    // print('userDetail::::::::::::::::${ User.userList[i]}');
                                    return AddUser(userDetail: User.filteredUserList[i]);
                                  },
                                ),
                              ).then((value) {
                                if (value != null) {
                                  apidata.updateUser(userid: User.filteredUserList[i]["Userid"], name: value["NAME"], address: value["ADDRESS"], email: value["EMAIL"], phone: value["PHONE"], city: value["CITY"], dob: value["DOB"], gender: value["GENDER"], hobby: value["HOBBY"], pass: value["PASS"], conpass: value["CONPASS"],id: User.filteredUserList[i]["id"]);
                                  setState(() {});
                                }
                              });
                            },
                            icon: Icon(Icons.edit, size: 30, color: Colors.pink.shade400),
                          ),
                        ),
                      ],
                    ),
              ],),
            ),
            leading: buildLeadingIcon(User.filteredUserList[i]),
            trailing: IconButton(
              onPressed: () async {
                await apidata.toggleVisibility(User.filteredUserList[i]['id'],User.filteredUserList[i]['ISVISIBLE']);
                setState(() {
                  User.filteredUserList[i]['ISVISIBLE'] = !User.filteredUserList[i]['ISVISIBLE'];
                });

                User.filteredUserList = User.userList.where((element) =>
                element["NAME"]
                    .toString()
                    .toLowerCase()
                    .contains(searchController.text.toLowerCase()) ||
                    element["ADDRESS"]
                        .toString()
                        .toLowerCase()
                        .contains(searchController.text.toLowerCase()))
                    .toList();

                 setState(() {

                 });
                print("Updated ISVISIBLE: ${User.filteredUserList[i]["ISVISIBLE"]}");
              },
              icon: Icon(Icons.more_horiz, color: Colors.pink),
            ),

          ),
        ),
      ),
    );
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
}
