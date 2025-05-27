import 'package:flutter/material.dart';

import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../layers/presentation/model/sort_option.dart';
import '../../theme/app_colors.dart';

class SortOptionsBottomSheetContent extends StatelessWidget {
  const SortOptionsBottomSheetContent({
    required this.selected,
    required this.options,
    required this.onChanged,
    super.key,
  });

  final String selected;
  final List<SortOption> options;
  final ValueChanged<String?> onChanged;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 16.h),
      decoration: BoxDecoration(
        color: AppColors.gray100,
        borderRadius: BorderRadius.circular(20.r),
      ),
      child: Column(
        children: options
            .asMap()
            .entries
            .map(
              (entry) => Column(
                children: [
                  RadioListTile<String>(
                    value: entry.value.key,
                    groupValue: selected,
                    title: Text(
                      entry.value.label,
                      style: TextStyle(
                        color: AppColors.gray900,
                        fontWeight: FontWeight.w500,
                        fontSize: 14.sp,
                        letterSpacing: 0,
                      ),
                    ),
                    fillColor: WidgetStateProperty.resolveWith<Color>((states) {
                      if (states.contains(WidgetState.selected)) {
                        return AppColors.accent;
                      }
                      return AppColors.unselected;
                    }),
                    contentPadding: EdgeInsets.symmetric(horizontal: 16.w),
                    controlAffinity: ListTileControlAffinity.leading,
                    onChanged: onChanged,
                  ),
                  if (entry.key < options.length - 1)
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: 16.w),
                      child: Divider(color: AppColors.gray400, height: 1.h),
                    ),
                ],
              ),
            )
            .toList(),
      ),
    );
  }
}
