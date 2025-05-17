import 'package:flutter/material.dart';
import 'package:flutter_demo/project_1/about_us.dart';
import 'package:flutter_demo/project_1/add_user.dart';
import 'package:flutter_demo/project_1/dashboard_screen.dart';
import 'package:flutter_demo/project_1/favourite.dart';
import 'package:flutter_demo/project_1/user_list.dart';

import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:google_nav_bar/google_nav_bar.dart';
import 'package:line_icons/line_icons.dart';

class Bottomnavigationbar extends StatefulWidget {
  const Bottomnavigationbar({super.key});

  @override
  State<Bottomnavigationbar> createState() => _BottomnavigationbarState();
}

class _BottomnavigationbarState extends State<Bottomnavigationbar> {


  int _selectedIndex = 0;
  static const TextStyle optionStyle =
  TextStyle(fontSize: 30, fontWeight: FontWeight.w600);
  static  List<Widget> widgetOptions = <Widget>[
    DashboardScreen(),AddUser(),UserList(),Favourite(),
  ];
  // var index=0;
  // List<Widget> list=[AddUser(),UserList(),Favourite(),AboutUs()];
  @override
  Widget build(BuildContext context) {
    return SafeArea(child: Scaffold(
      body: Center( child: widgetOptions.elementAt(_selectedIndex),),
      bottomNavigationBar: Container(
        decoration: BoxDecoration(
          color: Colors.grey.shade200,
          boxShadow: [
            BoxShadow(
              blurRadius: 20,
              color: Colors.pink.withOpacity(.5),
            )
          ],
        ),
        child: SafeArea(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 15.0, vertical: 8),
            child: GNav(
              rippleColor: Colors.pink[500]!,
              hoverColor: Colors.grey[100]!,
              gap: 8,
              activeColor: Colors.black,
              iconSize: 24,
              padding: EdgeInsets.symmetric(horizontal: 20, vertical: 12),
              duration: Duration(milliseconds: 400),
              tabBackgroundColor: Colors.pink.withAlpha(100)!,
              color: Colors.black,
              tabs: [
                GButton(
                  icon: LineIcons.home,
                  text: 'Home',
                ),
                GButton(
                  icon: LineIcons.addressCard,
                  text: 'Add',
                ),
                GButton(
                  icon: LineIcons.list,
                  text: 'Users',
                ),
                GButton(
                  icon: LineIcons.heart,
                  text: 'like',
                ),
                // GButton(
                //   icon: LineIcons.user,
                //   text: 'Profile',
                // ),
              ],
              selectedIndex: _selectedIndex,
              onTabChange: (index) {
                setState(() {
                  _selectedIndex = index;
                });
              },
            ),
          ),
        ),
      ),
    ));
  }
}
