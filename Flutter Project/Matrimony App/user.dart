//user.dart Have User class

import 'dart:convert';

import 'package:flutter_demo/project_1/my_Database.dart';
import 'package:sqflite/sqflite.dart';

class User{

  static List<Map<String,dynamic>> userList=[
    // {
    //"UserId:1"
    // "NAME":"Pushti",
    // "ADDRESS":"abcdefg nbnghjg",
    // "EMAIL":"pushti@gmail.com",
    // "PHONE":'1234567890',
    // "CITY":'Rajkot',
    // "DOB":'19-05-2005',
    // "GENDER":"Female",
    // "HOBBY":[true,false,true],
    // "PASS":1234,
    // "CONPASS":1234,
    // "FAV":0,
    // "ISVISIBLE":0}
  ];

  static List<Map<String,dynamic>> favouriteList=[];
  static List<Map<String, dynamic>> filteredUserList = [];
  //Insert User in list
  Future<void> addUser({required name, required address, required email,required phone,required city,
    required dob,required gender,required List<bool?> hobby,required pass,required conpass
  })async {

    Database db =await MatromonialDatabase().initDatabase();
    Map<String,dynamic> map = {};

    map[MatromonialDatabase.NAME]=name;
    map[MatromonialDatabase.ADDRESS]=address;
    map[MatromonialDatabase.EMAIL]=email;
    map[MatromonialDatabase.PHONE]=phone;
    map[MatromonialDatabase.CITY]=city;
    map[MatromonialDatabase.DOB]=dob;
    map[MatromonialDatabase.GENDER]=gender;
    map[MatromonialDatabase.HOBBY]=jsonEncode(hobby);
    map[MatromonialDatabase.PASS]=pass;
    map[MatromonialDatabase.CONPASS]=conpass;
    map[MatromonialDatabase.FAV]=0;
    map[MatromonialDatabase.ISVISIBLE]=0;
    int num=await db.insert(MatromonialDatabase.TBL_NAME, map);
    if (num == -1) {
      print("Insertion failed!");
    } else {
      print("Data inserted successfully with ID: $num");
      userList.add(map);
    }

  }

  // get print details of all User
  Future<List<Map<String,dynamic>>> getUserList() async{
    Database db = await MatromonialDatabase().initDatabase();
    userList.clear();
    userList.addAll(
        await db.rawQuery('SELECT * FROM ${MatromonialDatabase.TBL_NAME} ORDER BY UserId DESC')
    )
    ;
    return userList;
  }


  Future<void> toggleVisibility(int id, int currentVisibility) async {
    int newVisibility = currentVisibility == 1 ? 0 : 1;
    await updateVisibility(id, newVisibility);

    userList = await getUserList();
  }

  Future<void> toggleFavorite(int id, int currentFavorite) async {
    int newFavorite = currentFavorite == 1 ? 0 : 1;
    await updateFavorite(id, newFavorite);
  }

  Future<void> updateVisibility(int userId, int newVisibility) async {
    final db = await MatromonialDatabase().initDatabase();
    await db.update(
        '${MatromonialDatabase.TBL_NAME}',
        {'${MatromonialDatabase.ISVISIBLE}': newVisibility}, // Update ISVISIBLE
        where: '${MatromonialDatabase.USER_ID} = ?',
        whereArgs: [userId]
    );
  }

  Future<void> updateFavorite(int userId, int newFavourite) async {
    final db = await MatromonialDatabase().initDatabase();
    await db.update(
        '${MatromonialDatabase.TBL_NAME}',
        {'${MatromonialDatabase.FAV}': newFavourite}, // Update ISVISIBLE
        where: '${MatromonialDatabase.USER_ID} = ?',
        whereArgs: [userId]
    );
    userList=await getUserList();
  }

  Future<void> updateUser(int userId, Map<String, dynamic> map) async {
    Database db = await MatromonialDatabase().initDatabase();

    // Ensure HOBBY is stored as a JSON-encoded string
    if (map.containsKey('HOBBY')) {
      map['HOBBY'] = jsonEncode(map['HOBBY']); // Convert list to JSON
    }

    await db.update(
      '${MatromonialDatabase.TBL_NAME}',
      map,
      where: "${MatromonialDatabase.USER_ID} = ?",
      whereArgs: [userId],
    );
  }


  //delete User
  Future<void> deleteUser(int id) async{
    Database db= await MatromonialDatabase().initDatabase();
    int UserId = await db.delete(
        MatromonialDatabase.TBL_NAME,
        where: '${MatromonialDatabase.USER_ID} = ?',
        whereArgs: [id]);
    if (UserId > 0) userList.removeAt(id);

  }


  //search By Name
  // void searchUser({required searchData}){
  //   filteredUserList.clear();
  //   for (var element in userList) {
  //     if (element[MatromonialDatabase.NAME]
  //         .toString()
  //         .toLowerCase()
  //         .contains(searchData.toString().toLowerCase()) ||
  //         element[MatromonialDatabase.DOB]
  //             .toString()
  //             .toLowerCase()
  //             .contains(searchData.toString().toLowerCase())) {
  //       filteredUserList.add(element);
  //     }
  //   }
  //   if (searchData.toString().isEmpty) {
  //     filteredUserList.clear();
  //     // filteredUserList.addAll(userList);
  //   }
  //
  // }
}
