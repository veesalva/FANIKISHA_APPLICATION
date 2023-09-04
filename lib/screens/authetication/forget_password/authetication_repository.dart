import 'dart:convert';

import 'package:fanikisha_app/custom_exceptions/signup_with_email_and_password_exception.dart';
import 'package:fanikisha_app/screens/authetication/forget_password/otp_screen.dart';
import 'package:fanikisha_app/screens/dashboard.dart';
import 'package:fanikisha_app/screens/home.dart';
import 'package:fanikisha_app/widgets/BottomNavigationBarWidget.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;

import '../../../constant/Constant.dart';
import '../../../models/user_model.dart';

class AutheticationRepository extends GetxController {
  static AutheticationRepository get instance => Get.find();

//   variable
  final _auth = FirebaseAuth.instance;
  late final Rx<User?> firebaseUser;
  var verificationId = ''.obs;

  @override
  void onReady() {
    firebaseUser = Rx<User?>(_auth.currentUser);
    firebaseUser.bindStream(_auth.userChanges());
    // listening to user login and out
    ever(firebaseUser, _setInitialScreen);
  }

  _setInitialScreen(User? user) {
    // perform the redirection to home or dashboard depending on the user sign in or out
    user == null
        ? Get.offAll(() => HomePage())
        : Get.offAll(() =>  BottomNavigationBarWidget());
  }

//   create user

  Future<void> createUserWithEmailAndPassword(
      String email, String password) async {
    try {
      await _auth.createUserWithEmailAndPassword(
          email: email, password: password);
      // todo : look for otp before redirecting to DashBoard Page
      firebaseUser.value == null
          ? Get.offAll(() => HomePage())
          : Get.offAll(() =>  OTPScreen());
    } on FirebaseAuthException catch (e) {
      final ex = SignupWithEmailAndPasswordFailure.code(e.code);
      print("FIREBASE AUTH EXCEPTION ${ex.message}");
      throw ex;
    } catch (_) {
      final ex = const SignupWithEmailAndPasswordFailure();
      print("EXCEPTION $ex");
      throw ex;
    }
  }
  // login with email and password
  Future<void> createUser(UserModel user) async {
    final String apiUrl = 'http://'+Constant.ipAddress+":5000/users";

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

  // logout page
  Future<void> logout() async => await _auth.signOut();
//   phone authentication
  Future<void> phoneAuthetication(String phoneNumber) async {
    await _auth.verifyPhoneNumber(
      phoneNumber: phoneNumber,
      verificationCompleted: (credentials) async {
        await _auth.signInWithCredential(credentials);
      },
      verificationFailed: (error) {
        if (error.code == 'invalid-phone-number') {
          Get.snackbar("error", "The Provided phone number is invalid");
        } else {
          Get.snackbar("error", "Something went wrong");
        }
      },
      codeSent: (verificationId, forceResendingToken) {
        this.verificationId.value = verificationId;
      },
      codeAutoRetrievalTimeout: (verificationId) {
        this.verificationId.value = verificationId;
      },
    );
  }

  Future<bool> verifyOTP(String otp) async {
    var credentials = await _auth.signInWithCredential(
      PhoneAuthProvider.credential(
          verificationId: this.verificationId.value, smsCode: otp),
    );
    return credentials.user != null ? true : false;
  }
}
