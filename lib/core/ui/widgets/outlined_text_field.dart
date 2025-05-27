import 'package:flutter/material.dart';

import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../theme/app_colors.dart';

class OutlinedTextField extends StatelessWidget {
  const OutlinedTextField({
    required this.label,
    required this.controller,
    this.keyboardType,
    super.key,
  });

  final String label;
  final TextEditingController controller;
  final TextInputType? keyboardType;

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: controller,
      keyboardType: keyboardType ?? TextInputType.text,
      maxLines: 1,
      style: TextStyle(
        color: AppColors.gray850,
        fontWeight: FontWeight.w500,
        fontSize: 13.sp,
        letterSpacing: 0,
      ),
      decoration: InputDecoration(
        labelText: label,
        labelStyle: const TextStyle(color: AppColors.gray700, letterSpacing: 0),
        focusColor: AppColors.gray400,
        border: OutlineInputBorder(
          borderSide: const BorderSide(color: AppColors.gray400),
          borderRadius: BorderRadius.circular(10.r),
        ),
        focusedBorder: OutlineInputBorder(
          borderSide: const BorderSide(color: AppColors.gray400),
          borderRadius: BorderRadius.circular(10.r),
        ),
        enabledBorder: OutlineInputBorder(
          borderSide: const BorderSide(color: AppColors.gray400),
          borderRadius: BorderRadius.circular(10.r),
        ),
      ),
    );
  }
}
