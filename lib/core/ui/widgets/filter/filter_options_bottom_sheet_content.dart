import 'package:flutter/material.dart';

import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../l10n/l10n.dart';
import '../../theme/app_colors.dart';
import '../outlined_text_field.dart';

class FilterOptionsBottomSheetContent extends StatelessWidget {
  const FilterOptionsBottomSheetContent({
    required this.minPriceController,
    required this.maxPriceController,
    required this.onShowResults,
    super.key,
  });

  final TextEditingController minPriceController;
  final TextEditingController maxPriceController;
  final void Function(String? minPrice, String? maxPrice) onShowResults;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 16.h),
          decoration: BoxDecoration(
            color: AppColors.gray100,
            borderRadius: BorderRadius.circular(20.r),
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                context.l10n.priceRange,
                style: TextStyle(
                  color: AppColors.gray900,
                  fontWeight: FontWeight.w500,
                  fontSize: 13.sp,
                  letterSpacing: 0,
                ),
              ),
              SizedBox(height: 16.h),
              Row(
                children: [
                  Expanded(
                    child: OutlinedTextField(
                      label: context.l10n.minimum,
                      controller: minPriceController,
                      keyboardType: TextInputType.number,
                    ),
                  ),
                  Container(
                    width: 10.w,
                    margin: EdgeInsets.symmetric(horizontal: 8.w),
                    child: Divider(
                      color: AppColors.gray600,
                      thickness: 2.h,
                      radius: BorderRadius.circular(100.r),
                    ),
                  ),
                  Expanded(
                    child: OutlinedTextField(
                      label: context.l10n.maximum,
                      controller: maxPriceController,
                      keyboardType: TextInputType.number,
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
        SizedBox(height: 16.h),
        Row(
          children: [
            Expanded(
              child: TextButton(
                onPressed: () {
                  minPriceController.clear();
                  maxPriceController.clear();
                },
                style: TextButton.styleFrom(
                  padding: EdgeInsets.symmetric(vertical: 10.h),
                ),
                child: Text(
                  context.l10n.deleteEverything,
                  style: TextStyle(
                    color: AppColors.accent,
                    fontWeight: FontWeight.w600,
                    fontSize: 14.sp,
                    letterSpacing: 0,
                  ),
                ),
              ),
            ),
            SizedBox(width: 8.w),
            Expanded(
              child: ElevatedButton(
                onPressed: () {
                  onShowResults(
                    minPriceController.text.trim(),
                    maxPriceController.text.trim(),
                  );
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: AppColors.accent,
                  padding: EdgeInsets.symmetric(vertical: 10.h),
                ),
                child: Text(
                  context.l10n.showResults,
                  style: TextStyle(
                    color: AppColors.gray100,
                    fontWeight: FontWeight.w600,
                    fontSize: 14.sp,
                    letterSpacing: 0,
                  ),
                ),
              ),
            ),
          ],
        ),
      ],
    );
  }
}
