import 'package:flutter/material.dart';

import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';

import '../../../utils/icon_constants.dart';
import '../../theme/app_colors.dart';

class CatalogFilterBottomSheet extends StatelessWidget {
  const CatalogFilterBottomSheet({
    required this.title,
    required this.content,
    required this.onClose,
    super.key,
  });

  final String title;
  final Widget content;
  final VoidCallback onClose;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(top: 7.h, bottom: 16.h, right: 16.w, left: 16.w),
      decoration: BoxDecoration(
        color: AppColors.gray300,
        borderRadius: BorderRadius.vertical(top: Radius.circular(20.r)),
      ),
      child: ListView(
        controller: PrimaryScrollController.of(context),
        children: [
          Center(
            child: Container(
              width: 45.w,
              height: 5.h,
              decoration: BoxDecoration(
                color: AppColors.gray600,
                borderRadius: BorderRadius.circular(100.r),
              ),
            ),
          ),
          Align(
            alignment: Alignment.centerRight,
            child: IconButton(
              onPressed: onClose,
              icon: SvgPicture.asset(AppIcons.cross, width: 16.w, height: 16.h),
            ),
          ),
          Text(
            title,
            textAlign: TextAlign.center,
            style: TextStyle(
              color: AppColors.gray900,
              fontWeight: FontWeight.w600,
              fontSize: 15.sp,
              letterSpacing: 0,
            ),
          ),
          SizedBox(height: 20.h),
          content,
        ],
      ),
    );
  }

  static void show({
    required BuildContext context,
    required String title,
    required Widget child,
    required VoidCallback onClose,
    double? portraitMaxSize,
    double? landscapeMaxSize,
  }) {
    showModalBottomSheet<void>(
      context: context,
      isScrollControlled: true,
      backgroundColor: Colors.transparent,
      builder: (context) => OrientationBuilder(
        builder: (context, orientation) {
          final maxSize = orientation == Orientation.portrait
              ? (portraitMaxSize ?? 0.4)
              : (landscapeMaxSize ?? 0.8);

          return Padding(
            padding: EdgeInsets.only(
              bottom: MediaQuery.of(context).viewInsets.bottom,
            ),
            child: DraggableScrollableSheet(
              expand: false,
              initialChildSize: maxSize,
              maxChildSize: maxSize,
              builder: (context, scrollController) {
                return CatalogFilterBottomSheet(
                  title: title,
                  content: child,
                  onClose: onClose,
                );
              },
            ),
          );
        },
      ),
    );
  }
}
