import 'dart:convert';

import 'package:fanikisha_app/models/user_model.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

import '../constant/Constant.dart';

// this is to perform database  operations on the user
class UserRepository extends GetxController {
  static UserRepository get instance => Get.find();
//   database instance
//   final _db = FirebaseFirestore.instance;

//   get users form mysql
  Future<void> fetchData() async {
    final response = await http.get(Uri.parse('http://localhost:5000/users'));

    if (response.statusCode == 200) {
      // The request was successful, and you can parse the response here.
      print('Response data: ${response.body}');
    } else {
      // The request failed or the server returned an error response.
      print('Request failed with status: ${response.statusCode}');
    }
  }

//   create user in a database
  Future<bool> createUser(UserModel user) async {
    final String apiUrl = 'http://' + Constant.ipAddress + ":5000/users";

    final Map<String, dynamic> data = user.toJson();

    final response = await http.post(
      Uri.parse(apiUrl),
      headers: {
        'Content-Type': 'application/json',
      },
      body: jsonEncode(data),
    );

    if (response.statusCode == 201) {
      // Successfully created the record in the database
      print('Data posted successfully');
      // setting the sharedPreferences when the user is logged in
      SharedPreferences sharedPreferences=await SharedPreferences.getInstance();
      String userId='';
      final data = json.decode(response.body);
      userId=data['userId'].toString();
      sharedPreferences.setString(Constant.authToken, userId);
      return true;
    } else {
      // Failed to create the record
      print('Failed to post data. Status code: ${response.statusCode}');
      return false;
    }
  }

  // method to get logged in user details
  Future<Map<String, dynamic>?> fetchUserData(String userId) async {
    final url = Uri.parse(
        'http://${Constant.ipAddress}:5000/user/$userId'); // Api url to get user by id

    try {
      final response = await http.get(url);

      if (response.statusCode == 200) {
        // If the server returns a 200 OK response, parse the JSON data.
        final Map<String, dynamic> data = json.decode(response.body);
        return data;
      } else {
        // If the server returns an error response, throw an exception.
        throw Exception('Failed to load user data');
      }
    } catch (e) {
      // Handle network or other errors here.
      print('Error: $e');
      return null;
    }
  }


  Future<bool> updateUserData(String userId, Map<String, dynamic> updatedUserData) async {
    final url = Uri.parse('http://${Constant.ipAddress}:5000/user/$userId'); // API URL to update user by ID

    try {
      final response = await http.put(
        url,
        headers: {
          'Content-Type': 'application/json', // Set the content type to JSON
        },
        body: json.encode(updatedUserData), // Convert the updatedUserData to JSON
      );

      if (response.statusCode == 200) {
        // If the server returns a 200 OK response, the user data was successfully updated.
        return true;
      } else {
        // If the server returns an error response, throw an exception or handle the error as needed.
        throw Exception('Failed to update user data');
      }
    } catch (e) {
      // Handle network or other errors here.
      print('Error: $e');
      return false;
    }
  }




}
