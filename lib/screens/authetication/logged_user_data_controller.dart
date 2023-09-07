import 'package:fanikisha_app/constant/Constant.dart';
import 'package:fanikisha_app/repository/user_repository.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LoggedUserDataController extends GetxController {
  static LoggedUserDataController get instance => Get.find();
  final controller = Get.put(UserRepository());

  Future<Map<String, dynamic>?> getUserData() async {
    SharedPreferences sharedPreferences=await SharedPreferences.getInstance();
    String? userId=sharedPreferences.getString(Constant.authToken);
    final userData = await controller.fetchUserData(userId!);

    if (userData != null && userData['error'] == false) {
      // Successfully fetched user data.
      final user = userData['data'];
      print('User Data: $user');
      return user;
    } else {
      // Handle errors or display a message.
      print('Failed to fetch user data');
      return null;
    }
  }
}
