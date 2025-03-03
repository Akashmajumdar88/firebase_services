import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

import 'app_styles.dart';
import 'app_theme.dart';

class CommonField extends StatelessWidget {
  String hintText;
  final TextEditingController controller;
  final TextInputType keyboardType;
  final List<TextInputFormatter>? inputFormatter;
  final String? Function(String?)? validator;
  CommonField({super.key,
    required this.controller,
    required this.keyboardType,
    required this.hintText,
    this.inputFormatter,
    this.validator
  });

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      style: GoogleFonts.roboto(fontSize: 14,fontWeight: FontWeight.w400,color: Colors.black),
      keyboardType: keyboardType,
      inputFormatters: inputFormatter,
      validator: validator,
      decoration: InputDecoration(
        hintText: hintText,
        hintStyle: AppStyles().hintStyle,
        isDense: true,
        counterStyle: const TextStyle(color: Colors.white),
        errorStyle: const TextStyle(color: Colors.red),
        contentPadding: const EdgeInsets.all(14),
        fillColor: Colors.white,
        filled: true,
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(5.r),
          borderSide: BorderSide(
            color: AppColors.enableBorder,
            width: 0.5,
          ),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(5.r),
          borderSide: BorderSide(
            color: AppColors.focusBorder,
            width: 0.5,
          ),
        ),
        errorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(5.r),
          borderSide: BorderSide(
            color: AppColors.errorBorder,
            width: 0.5,
          ),
        ),
      ),
    );
  }
}
