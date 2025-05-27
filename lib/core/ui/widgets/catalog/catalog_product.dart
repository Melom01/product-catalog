import 'package:flutter/material.dart';

import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../l10n/l10n.dart';
import '../../theme/app_colors.dart';

class CatalogProduct extends StatelessWidget {
  const CatalogProduct({
    required this.imageUrl,
    required this.title,
    required this.merchant,
    required this.price,
    required this.installmentPrice,
    super.key,
  });

  final String imageUrl;
  final String title;
  final String merchant;
  final String price;
  final String installmentPrice;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          width: double.infinity,
          height: 195.h,
          decoration: BoxDecoration(
            color: AppColors.gray100,
            borderRadius: BorderRadius.circular(20.r),
          ),
          child: Image.network(
            imageUrl,
            fit: BoxFit.contain,
            errorBuilder: (context, error, stackTrace) =>
                const Icon(Icons.broken_image),
          ),
        ),
        SizedBox(height: 8.h),
        Text(
          title,
          maxLines: 2,
          overflow: TextOverflow.ellipsis,
          style: TextStyle(
            color: AppColors.gray900,
            fontWeight: FontWeight.w600,
            fontSize: 13.sp,
            letterSpacing: 0,
          ),
        ),
        SizedBox(height: 4.h),
        Text(
          merchant,
          maxLines: 1,
          overflow: TextOverflow.ellipsis,
          style: TextStyle(
            color: AppColors.gray850,
            fontWeight: FontWeight.w500,
            fontSize: 12.sp,
            letterSpacing: 0,
          ),
        ),
        SizedBox(height: 8.h),
        Text(
          context.l10n.priceOr(price),
          style: TextStyle(
            color: AppColors.gray700,
            fontWeight: FontWeight.w500,
            fontSize: 12.sp,
            letterSpacing: 0,
          ),
        ),
        Text(
          context.l10n.installments(installmentPrice),
          maxLines: 2,
          overflow: TextOverflow.ellipsis,
          style: TextStyle(
            color: AppColors.accent,
            fontWeight: FontWeight.w600,
            fontSize: 14.sp,
            letterSpacing: 0,
          ),
        ),
      ],
    );
  }
}
