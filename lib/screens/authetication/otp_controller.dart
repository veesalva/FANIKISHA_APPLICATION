import 'package:fanikisha_app/screens/authetication/forget_password/authetication_repository.dart';
import 'package:fanikisha_app/screens/dashboard.dart';
import 'package:fanikisha_app/widgets/BottomNavigationBarWidget.dart';
import 'package:fanikisha_app/colors/colors.dart'; // custom added colors
import 'package:get/get.dart';

class OTPController extends GetxController {
  static OTPController get instance => Get.find();

  Future<void> verifyOTP(String otp) async {
    var isVerified=await AutheticationRepository.instance.verifyOTP(otp);
      isVerified?Get.offAll( BottomNavigationBarWidget()):Get.back();
  }
}
