import 'package:flutter/material.dart';

import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../theme/extensions/theme_config.dart';

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
        color: context.colorScheme.catalogSecondaryBackground,
        fontWeight: FontWeight.w500,
        fontSize: 13.sp,
        letterSpacing: 0,
      ),
      decoration: InputDecoration(
        labelText: label,
        labelStyle: TextStyle(color: context.colorScheme.catalogSecondaryText, letterSpacing: 0),
        focusColor: context.colorScheme.catalogDivider,
        border: OutlineInputBorder(
          borderSide: BorderSide(color: context.colorScheme.catalogDivider!),
          borderRadius: BorderRadius.circular(10.r),
        ),
        focusedBorder: OutlineInputBorder(
          borderSide: BorderSide(color: context.colorScheme.catalogDivider!),
          borderRadius: BorderRadius.circular(10.r),
        ),
        enabledBorder: OutlineInputBorder(
          borderSide: BorderSide(color: context.colorScheme.catalogDivider!),
          borderRadius: BorderRadius.circular(10.r),
        ),
      ),
    );
  }
}
