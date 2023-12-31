import 'package:shared_preferences/shared_preferences.dart';

class AuthService {
  // check the user if he is logged in
  static Future<bool> isUserLoggenIn() async {
    final prefs = await SharedPreferences.getInstance();
    final token = prefs.getString('authToken');
    return token != null;
  }
}
