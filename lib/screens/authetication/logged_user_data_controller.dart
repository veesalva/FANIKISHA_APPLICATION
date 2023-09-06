
import 'package:fanikisha_app/repository/user_repository.dart';
import 'package:get/get.dart';

class LoggedUserDataController extends GetxController {
  static LoggedUserDataController get instance => Get.find();

  Future<Map<String, dynamic>?> getUserData(String userId) async {
    final userData = await UserRepository.instance.fetchUserData(userId);

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
