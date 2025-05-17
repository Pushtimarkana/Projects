
import 'package:flutter/material.dart';
import 'package:flutter_api/project_1/add_user.dart';
import 'package:flutter_api/project_1/my_Database.dart';
import 'package:flutter_api/project_1/user.dart';


class UserDetail extends StatefulWidget{
  int index=0;
  @override
  State<UserDetail> createState() => _UserDetailState();

  UserDetail({super.key,required index}){
    this.index=index;
  }
}

class _UserDetailState extends State<UserDetail> {
  User user = User();
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.pink[200], // Light Blue
          title: Text('Profile', style: TextStyle(color: Colors.white, fontSize: 22)),
          centerTitle: true,
          leading: Icon(Icons.menu, color: Colors.white),
          actions: [
            Icon(Icons.notifications, color: Colors.white),
            SizedBox(width: 10),
          ],
        ),
        body: SingleChildScrollView(
          padding: EdgeInsets.all(16),
          child: Column(
            children: [
              // Profile Image
              Center(
                child: Column(
                  children: [
                    CircleAvatar(
                      radius: 50,
                      backgroundColor: Colors.grey[300],
                      child: buildLeadingIcon(User.filteredUserList[widget.index])
                    ),
                    SizedBox(height: 8),
                    Text("${User.filteredUserList[widget.index]["NAME"]}", style: TextStyle(color:Colors.pink[300],fontSize: 18, fontWeight: FontWeight.bold)),
                    Text("1P01${widget.index+1}", style: TextStyle(fontSize: 14, color: Colors.grey)),
                  ],
                ),
              ),
              SizedBox(height: 20),
      
              // Profile Details
              buildProfileSection("About", [
                profileRow("Name", "${User.filteredUserList[widget.index]["NAME"]}"),
                profileRow("Gender", "${User.filteredUserList[widget.index]["GENDER"]}"),
                profileRow("Date of Birth", "${User.filteredUserList[widget.index]["DOB"]}"),
                profileRow("Marital Status", "Never Married"),
              ]),
      
              buildProfileSection("Religious Background", [
                profileRow("Country", "India"),
                profileRow("State", "Gujarat"),
                profileRow("Religion", "Hindu"),
                profileRow("Caste", "Caste"),
                profileRow("Sub Caste", "Sub caste"),
              ]),
      
              buildProfileSection("Professional Details", [
                profileRow("Higher Education", "M.Tech"),
                profileRow("Occupation", "Software Engineer"),
              ]),
      
              buildProfileSection("Contact Details", [
                profileRow("Email ID", "${User.filteredUserList[widget.index]["EMAIL"]}"),
                profileRow("Phone", "+91 ${User.filteredUserList[widget.index]["PHONE"]}"),
              ]),
      
              SizedBox(height: 20),
      
              // Edit Button
              // ElevatedButton(
              //   onPressed: () {
              //     Navigator.push(context, MaterialPageRoute(builder: (context){
              //       print(User.filteredUserList[widget.index]);
              //       return AddUser(userDetail: User.filteredUserList[widget.index],);
              //     })).then((value) async {
              //       if (value != null) {
              //         await user.updateUser(User.filteredUserList[widget.index][MatromonialDatabase.USER_ID],value);
              //         print(User.filteredUserList[widget.index][MatromonialDatabase.GENDER]);
              //
              //       }
              //       setState(() {});
              //     });
              //   },
              //   style: ElevatedButton.styleFrom(
              //     backgroundColor: Colors.pink[200], // Light Blue
              //     shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
              //   ),
              //   child: Padding(
              //     padding: EdgeInsets.symmetric(horizontal: 40, vertical: 10),
              //     child: Text("Edit", style: TextStyle(fontSize: 16, color: Colors.white)),
              //   ),
              // ),
            ],
          ),
        ),
      ),
    );
  }

  // Profile Section Widget
  Widget buildProfileSection(String title, List<Widget> children) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SizedBox(height: 15),
        Text(title, style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold, color: Colors.pink[200])),
        Divider(thickness: 1, color: Colors.grey[400]),
        Column(children: children),
        SizedBox(height: 10),
      ],
    );
  }

  // Profile Row Widget
  Widget profileRow(String label, String value) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 5),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(label, style: TextStyle(fontSize: 14, fontWeight: FontWeight.w500)),
          Text(value, style: TextStyle(fontSize: 14, color: Colors.grey[700])),
        ],
      ),
    );
  }

  Widget buildLeadingIcon(Map role) {
    if (role[MatromonialDatabase.GENDER] == 'Female') {
      return ClipOval(
        child: Image.asset(
          'asets/Images/girl_img.jpg', // Replace with real URL
          width: 100,
          height: 100,
          fit: BoxFit.cover,
        ),
      );
    }  else {
      return ClipOval(
        child: Image.asset(
          'asets/Images/boy_img.jpg', // Replace with real URL
          width: 100,
          height: 100,
          fit: BoxFit.cover,
        ),
      );
    }
  }
}
