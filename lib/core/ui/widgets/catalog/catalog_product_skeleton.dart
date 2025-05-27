import 'package:flutter/material.dart';

import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shimmer/shimmer.dart';

import '../../theme/app_colors.dart';

class CatalogProductSkeleton extends StatelessWidget {
  const CatalogProductSkeleton({super.key});

  @override
  Widget build(BuildContext context) {
    return Shimmer.fromColors(
      baseColor: AppColors.gray500,
      highlightColor: AppColors.gray100,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Expanded(
            child: Container(
              width: double.infinity,
              decoration: BoxDecoration(
                color: AppColors.gray100,
                borderRadius: BorderRadius.circular(20.r),
              ),
            ),
          ),
          SizedBox(height: 8.h),
          Container(
            height: 12.h,
            width: double.infinity,
            color: AppColors.gray100,
          ),
          SizedBox(height: 4.h),
          Container(height: 12.h, width: 80.w, color: AppColors.gray100),
          SizedBox(height: 8.h),
          Container(height: 12.h, width: 60.w, color: AppColors.gray100),
          SizedBox(height: 4.h),
          Container(height: 14.h, width: 100.w, color: AppColors.gray100),
        ],
      ),
    );
  }
}
