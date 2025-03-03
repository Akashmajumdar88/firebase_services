import 'package:firebse_ser/login_screen.dart';
import 'package:firebse_ser/providers_demo/app_theme.dart';
import 'package:firebse_ser/providers_demo/auth_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'providers_demo/dashboard_screen.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Scaffold(
      body: Container(
        alignment: Alignment.center,
        height: size.height,
        width: size.width,
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            colors: [
              AppColors.primary,
              AppColors.secondary
            ],
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
          ),
        ),
        child: const FlutterLogo(
          size: 200,
          style: FlutterLogoStyle.markOnly,
          textColor: Colors.blue,
          duration: Duration(seconds: 2),
        ),
      ),
    );
  }

  @override
  void didChangeDependencies(){
    super.didChangeDependencies();
    Future.delayed(const Duration(seconds: 2),(){
      final authProvider = Provider.of<Auth_Provider>(context, listen : false);
      Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) =>
      authProvider.isLogged ? const DashboardScreen() : const LoginScreen()));
    });
  }
}
