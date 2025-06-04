import 'package:flutter/material.dart';

import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../layers/presentation/model/sort_option.dart';
import '../../theme/extensions/theme_config.dart';

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
        color: context.colorScheme.catalogPrimaryBackground,
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
                        color: context.colorScheme.catalogPrimaryText,
                        fontWeight: FontWeight.w500,
                        fontSize: 14.sp,
                        letterSpacing: 0,
                      ),
                    ),
                    fillColor: WidgetStateProperty.resolveWith<Color>((states) {
                      if (states.contains(WidgetState.selected)) {
                        return context.colorScheme.catalogAccent!;
                      }
                      return context.colorScheme.catalogUnselectedOption!;
                    }),
                    contentPadding: EdgeInsets.symmetric(horizontal: 16.w),
                    controlAffinity: ListTileControlAffinity.leading,
                    onChanged: onChanged,
                  ),
                  if (entry.key < options.length - 1)
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: 16.w),
                      child: Divider(color: context.colorScheme.catalogDivider, height: 1.h),
                    ),
                ],
              ),
            )
            .toList(),
      ),
    );
  }
}
