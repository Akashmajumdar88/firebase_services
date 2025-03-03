import 'package:firebse_ser/providers_demo/app_theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:pin_code_fields/pin_code_fields.dart';
import 'login_provider.dart';


class OtpScreen extends StatelessWidget {
  String verificationId;
  OtpScreen({super.key,required this.verificationId});

  @override
  Widget build(BuildContext context) {
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
                    AppColors.primary,
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
                  const FlutterLogo(
                    size: 150,
                    style: FlutterLogoStyle.markOnly,
                    textColor: Colors.blue,
                    duration: Duration(seconds: 2),
                  ),
                  SizedBox(height: size.height * 0.02),
                  Text("OTP Send Successful",
                      style: GoogleFonts.poppins(color: Colors.white,fontWeight: FontWeight.w500,fontSize: 24.sp)),
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
                Text("OTP Send Your Number 9876543210",
                    style: GoogleFonts.poppins(color: Colors.black,fontSize: 14.sp,fontWeight: FontWeight.w400)),
                SizedBox(height: size.height * 0.03),
                PinCodeTextField(
                  appContext: context,
                  length: 4,
                  obscureText: false,
                  animationType: AnimationType.fade,
                  keyboardType: TextInputType.number,
                  inputFormatters: [
                    LengthLimitingTextInputFormatter(6),
                    FilteringTextInputFormatter.digitsOnly
                  ],
                  pinTheme: PinTheme(
                    activeColor: Colors.black,
                    disabledColor: Colors.black,
                    shape: PinCodeFieldShape.box,
                    activeBorderWidth: 0.5,
                    borderWidth: 0.5,
                    disabledBorderWidth: 0.5,
                    errorBorderWidth: 0.5,
                    inactiveBorderWidth: 0.5,
                    borderRadius: BorderRadius.circular(5.r),
                    fieldHeight: 50,
                    fieldWidth: 50,
                    activeFillColor: Colors.black,
                    errorBorderColor: Colors.red,
                    inactiveColor: Colors.black
                  ),
                  onChanged: (value) {
                    LoginProvider().getOtp = value;
                    // print(value);
                  },
                ),
                SizedBox(height: size.height * 0.03),
                Container(
                  decoration: BoxDecoration(
                      gradient: const LinearGradient(
                        begin: Alignment.topCenter,
                        end: Alignment.bottomCenter,
                        colors: [
                          AppColors.primary,
                          AppColors.secondary
                        ],
                      ),
                      borderRadius: BorderRadius.circular(5.r)
                  ),
                  width: size.width,
                  child: ElevatedButton(
                    onPressed: () {
                      LoginProvider().verifyOTP("${LoginProvider().getOtp}", context);
                    },
                    style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.transparent,
                        shadowColor: Colors.transparent,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(5.r), // Rounded corners
                        )
                    ),
                    child: Text("Verify",
                        style: GoogleFonts.roboto(fontWeight: FontWeight.w500,color: Colors.white,fontSize: 20.sp)),
                  ),
                ),
                SizedBox(height: size.height * 0.03),
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