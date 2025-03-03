import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'auth_provider.dart';
import 'dashboard_screen.dart';
import 'otp_screen.dart';

class LoginProvider with ChangeNotifier{

  bool isChecked = false;
  final formKey = GlobalKey<FormState>();
  final TextEditingController phoneController = TextEditingController();
  final FirebaseAuth auth = FirebaseAuth.instance;
  String get verificationId => _verificationId;
  String _verificationId = '';
  String? getOtp;

  void toggleCheckBox(bool? value){
    isChecked = value ?? false;
    notifyListeners();
  }

  void sendOTP (context) async {
    String phone = "+91${phoneController.text.trim()}";
    await auth.verifyPhoneNumber(
        phoneNumber: phone,
        verificationCompleted: (phoneAuthCredential) async {
          await auth.signInWithCredential(phoneAuthCredential);
          print("Auth-login successful");
        },
        verificationFailed: (error) {
          print('verification  Failed : ${error.message}');
          ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text("Error : ${error.message}")));
        },
        codeSent: (verificationId, forceResendingToken) {
          _verificationId = verificationId;
          Navigator.push(context, MaterialPageRoute(builder: (context) => OtpScreen(verificationId: verificationId)));
          notifyListeners();
        },
        codeAutoRetrievalTimeout: (verificationId) {}
    );
  }

  Future<void> verifyOTP(String otp, BuildContext context) async {
    final loginStatus = Provider.of<Auth_Provider>(context);
    try {
      PhoneAuthCredential credential = PhoneAuthProvider.credential(
        verificationId: _verificationId,
        smsCode: otp,
      );
      await auth.signInWithCredential(credential);
      ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text("Login Successful! 🎉"))
      );
      loginStatus.login();
      Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => const DashboardScreen()));
      Navigator.pushReplacementNamed(context, '/home');
    } catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text("Invalid OTP! ❌"))
      );
    }
  }
}
