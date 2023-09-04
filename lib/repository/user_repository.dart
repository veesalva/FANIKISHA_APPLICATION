import 'dart:convert';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:fanikisha_app/models/user_model.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;

// this is to perform database  operations on the user
class UserRepository extends GetxController {
  static UserRepository get instance => Get.find();

//   database instance
  final _db = FirebaseFirestore.instance;





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
  Future<void> createUser(UserModel user) async {
    // todo replace the ip address
    final String apiUrl = '192.168.137.1:5000/users'; // Replace with your API endpoint

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
    } else {
      // Failed to create the record
      print('Failed to post data. Status code: ${response.statusCode}');
    }
  }

}
