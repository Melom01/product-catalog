import 'package:flutter/material.dart';

import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';

import '../../theme/extensions/theme_config.dart';

class CatalogFilterChip extends StatelessWidget {
  const CatalogFilterChip({
    required this.iconPath,
    required this.label,
    required this.onPressed,
    super.key,
  });

  final String iconPath;
  final String label;
  final VoidCallback onPressed;

  @override
  Widget build(BuildContext context) {
    return Material(
      color: context.colorScheme.catalogFilterBackground,
      borderRadius: BorderRadius.circular(100.r),
      child: InkWell(
        borderRadius: BorderRadius.circular(100.r),
        onTap: onPressed,
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 8.w, vertical: 6.h),
          child: Row(
            children: [
              SvgPicture.asset(
                iconPath,
                width: 14.w,
                height: 14.h,
                colorFilter: ColorFilter.mode(context.colorScheme.catalogIcon!, BlendMode.srcIn),
              ),
              SizedBox(width: 6.w),
              Text(
                label,
                style: TextStyle(
                  color: context.colorScheme.catalogPrimaryText,
                  fontWeight: FontWeight.w600,
                  fontSize: 11.sp,
                  letterSpacing: 0,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
