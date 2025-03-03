import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

import 'app_theme.dart';

class CommonButton extends StatelessWidget {
  final double width;
  final double height;
  final VoidCallback onPressed;
  String title;
  CommonButton({super.key,
    required this.width,
    required this.height,
    required this.onPressed,
    required this.title
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: height,
      width: width,
      decoration: BoxDecoration(
        gradient: const LinearGradient(
          colors: [
            AppColors.primary,
            AppColors.secondary,
          ],
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
        ),
          borderRadius: BorderRadius.circular(5.r)
      ),
       child: ElevatedButton(
         onPressed: onPressed,
         style: ElevatedButton.styleFrom(
             backgroundColor: Colors.transparent,
             shadowColor: Colors.transparent,
             shape: RoundedRectangleBorder(
               borderRadius: BorderRadius.circular(5.r), // Rounded corners
             )
         ),
         child: Text(title,
             style: GoogleFonts.roboto(fontWeight: FontWeight.w500,color: Colors.white,fontSize: 20.sp)),
       ),
    );
  }
}


