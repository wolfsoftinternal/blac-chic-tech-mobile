import 'package:blackchecktech/Styles/my_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/src/size_extension.dart';

class ChipLayout extends StatelessWidget {
  final String label;
  final ValueChanged<int> onDeleted;
  final int index;
  const ChipLayout({
    required this.label, required this.onDeleted, required this.index,
  });

  @override
  Widget build(BuildContext context) {
    return Chip(
      labelPadding:  EdgeInsets.only(right: 8.w,left: 8.w),
      backgroundColor: Color(0x80f2f2f2),
      label: Text(label),
      deleteIcon: Container(
        height: 26.r,
        width: 26.r,
        decoration: BoxDecoration(
            shape: BoxShape.circle, color: Color(0x80f2f2f2).withOpacity(0.2)),
        child: Padding(
          padding: const EdgeInsets.all(5.0),
          child: Icon(
            Icons.close,
            color: black_121212,
            size: 15,
          ),
        ),
      ),
      onDeleted: () {
        onDeleted(index);
      },
    );
  }
}
