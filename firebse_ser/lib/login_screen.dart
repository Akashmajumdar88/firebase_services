import 'package:firebse_ser/providers_demo/app_theme.dart';
import 'package:firebse_ser/providers_demo/common_field.dart';
import 'package:firebse_ser/providers_demo/login_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'providers_demo/common_button.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final authProvider = Provider.of<LoginProvider>(context);
    var size = MediaQuery.of(context).size;
    return Scaffold(
      body: Column(
        children: [
          Expanded(
            child: Container(
              alignment: Alignment.center,
              width: size.width,
              decoration: const BoxDecoration(
                gradient: LinearGradient(
                  colors: [
                    AppColors.secondary,
                    AppColors.secondary
                  ],
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                ),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text("WELCOME!",
                    style: GoogleFonts.poppins(color: Colors.white,fontWeight: FontWeight.bold,fontSize: 30.sp)),
                  SizedBox(height: size.height * 0.02),
                  const FlutterLogo(
                    size: 150,
                    style: FlutterLogoStyle.markOnly,
                    textColor: Colors.blue,
                    duration: Duration(seconds: 2),
                  ),
                ],
              ),
            ),
          ),
          Container(
            padding: EdgeInsets.symmetric(horizontal: 30.r),
            width: size.width,
            color: Colors.white,
            child: Column(
              children: [
                SizedBox(height: size.height * 0.05),
                Text("Welcome To My App",
                    style: GoogleFonts.poppins(color: Colors.black,fontSize: 14.sp,fontWeight: FontWeight.w400)),
                SizedBox(height: size.height * 0.03),
                Form(
                  key: authProvider.formKey,
                  child: CommonField(
                    controller: authProvider.phoneController,
                    keyboardType: TextInputType.phone,
                    hintText: "Enter Mobile Number",
                    validator: (value) {
                      if(value!.isEmpty){
                        return 'Enter mobile number';
                      }else if(value.length <= 10){
                        return 'Mobile number not correct';
                      }
                      return null;
                    },
                    inputFormatter: [
                      LengthLimitingTextInputFormatter(10),
                      FilteringTextInputFormatter.digitsOnly
                    ],
                  ),
                ),
                SizedBox(height: size.height * 0.02),
                Consumer<LoginProvider>(
                  builder: (context,loginProvider,child){
                    return Row(
                      children: [
                        Theme(
                            data: Theme.of(context).copyWith(
                              checkboxTheme: const CheckboxThemeData(
                                materialTapTargetSize: MaterialTapTargetSize.shrinkWrap
                              ),
                            ),
                            child: Checkbox(
                              activeColor: const Color(0xFF0c316e),
                              value: loginProvider.isChecked,
                              onChanged: loginProvider.toggleCheckBox,
                            )
                        ),
                        Expanded(
                            child: Text("I agree to the term condition",
                              style: GoogleFonts.roboto(fontSize: 14.sp,fontWeight: FontWeight.w400,color: Colors.black),))
                      ],
                    );
                  },
                ),
                SizedBox(height: size.height * 0.02),
                CommonButton(
                  width: size.width,
                  height: 45,
                  title: "Send OTP",
                  onPressed: () {
                    if(authProvider.formKey.currentState!.validate()){
                      authProvider.sendOTP(context);
                    }
                  },
                ),
                SizedBox(height: size.height * 0.02),
                Text("Powered by Accounts",
                    style: GoogleFonts.poppins(color: Colors.grey,fontSize: 12.sp,fontWeight: FontWeight.w500)),
                SizedBox(height: size.height * 0.05),
              ],
            ),
          )
        ],
      ),
    );
  }
}