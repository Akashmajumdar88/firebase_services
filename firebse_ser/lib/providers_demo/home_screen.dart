import 'package:firebse_ser/login_screen.dart';
import 'package:firebse_ser/providers_demo/auth_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final authProvider = Provider.of<Auth_Provider>(context);
    return Scaffold(
      appBar: AppBar(
        leading: const Icon(Icons.menu,color: Colors.black,size: 30),
        backgroundColor: Colors.white,
        centerTitle: true,
        title: Text("Home",style: GoogleFonts.poppins(fontWeight: FontWeight.w500,fontSize: 18.sp,color: Colors.black)),
      ),
      body: Center(
        child: ElevatedButton(
          onPressed: () {
            authProvider.logout();
            Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => const LoginScreen(),));
          },
          child: const Text("Logout"),
        ),
      ),
    );
  }
}
