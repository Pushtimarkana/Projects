import 'dart:convert';

import 'package:http/http.dart' as http;
class ApiService {
  String baseUrl = "https://67c7353bc19eb8753e790eaf.mockapi.io/user";
  int userid = 0;

  Future<List<dynamic>> getUsers() async {
    var res = await http.get(Uri.parse(baseUrl));
    if (res.statusCode == 200) {
      List<dynamic> data = jsonDecode(res.body);
      print('user: $data');
      return data;
    } else {
      throw Exception('Failed to fetch');
    }
  }

  Future<void> addUser(
      {required name, required address, required email, required phone, required city,
        required dob, required gender, required hobby, required pass, required conpass}) async {
    Map<String, dynamic> user = {
      "UserId": userid,
      "NAME": name,
      "ADDRESS": address,
      "EMAIL": email,
      "PHONE": phone,
      "CITY": city,
      "DOB": dob,
      "GENDER": gender,
      "HOBBY": hobby,
      "PASS": pass,
      "CONPASS": conpass,
      "FAV": false,
      "ISVISIBLE": false
    };
    userid = userid + 1;
    var res = await http.post(
      Uri.parse(baseUrl),
      headers: {'Content-Type': 'application/json'},
      body: json.encode(user),
    );
  }

  Future<void> deleteUser(String id) async {
    var res = await http.delete(Uri.parse('${baseUrl}/${id}'));
    print("Delete User:,${res.body}");
    getUsers();
  }

  Future<void> toggleVisibility(String id, bool currentVisibility) async {
    bool newVisibility = !currentVisibility; // Toggle true/false
    await updateVisibility(id, newVisibility);
  }


  Future<void> updateVisibility(String userId, bool newVisibility) async {
    final response = await http.put(
      Uri.parse("$baseUrl/$userId"),
      headers: {
        "Content-Type": "application/json",
      },
      body: json.encode({
        "ISVISIBLE": newVisibility, // Only updating the "name" field
      }),
    );
    getUsers();
  }

  Future<void> updateUser(
      {required userid, required name, required address, required email, required phone, required city,
        required dob, required gender, required hobby, required pass, required conpass, required id}) async {
    Map<String, dynamic> user = {
      "UserId": id,
      "NAME": name,
      "ADDRESS": address,
      "EMAIL": email,
      "PHONE": phone,
      "CITY": city,
      "DOB": dob,
      "GENDER": gender,
      "HOBBY": hobby,
      "PASS": pass,
      "CONPASS": conpass,
      "FAV": false,
      "ISVISIBLE": false
    };
    var res = await http.put(
      Uri.parse("$baseUrl/$id"),
      headers: {'Content-Type': 'application/json'},
      body: json.encode(user),
    );
  }

  Future<void> updateFavorite(String userId, bool newFavourite) async {
    final response = await http.put(
      Uri.parse("$baseUrl/$userId"),
      headers: {
        "Content-Type": "application/json",
      },
      body: json.encode({
        "FAV": newFavourite, // Only updating the "name" field
      }),
    );
    getUsers();
  }
}
