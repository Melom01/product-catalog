import 'package:flutter/material.dart';

import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';

import '../../utils/icon_constants.dart';
import '../theme/extensions/theme_config.dart';

class CatalogSearchBar extends StatelessWidget {
  const CatalogSearchBar({required this.controller, required this.onSearch, super.key});

  final TextEditingController controller;
  final VoidCallback onSearch;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 55.h,
      padding: EdgeInsets.symmetric(horizontal: 5.w, vertical: 4.h),
      decoration: BoxDecoration(
        color: context.colorScheme.catalogPrimaryBackground,
        borderRadius: BorderRadius.circular(100.r),
        border: Border.all(color: context.colorScheme.catalogBorder!),
      ),
      child: Row(
        children: [
          Expanded(
            child: TextField(
              controller: controller,
              keyboardType: TextInputType.text,
              maxLines: 1,
              style: TextStyle(
                color: context.colorScheme.catalogPrimaryText,
                fontWeight: FontWeight.w500,
                fontSize: 13.sp,
                letterSpacing: 0,
              ),
              decoration: InputDecoration(
                border: InputBorder.none,
                contentPadding: EdgeInsets.symmetric(vertical: 12.h, horizontal: 11.w),
              ),
            ),
          ),
          SizedBox(width: 8.w),
          Container(
            height: 45.h,
            width: 45.w,
            decoration: BoxDecoration(
              color: context.colorScheme.catalogAccent,
              shape: BoxShape.circle,
            ),
            child: IconButton(
              icon: SvgPicture.asset(AppIcons.searchLens, width: 16.w, height: 16.h),
              onPressed: onSearch,
            ),
          ),
        ],
      ),
    );
  }
}
