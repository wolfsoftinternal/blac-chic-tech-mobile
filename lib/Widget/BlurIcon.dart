import 'package:blackchecktech/Styles/my_colors.dart';
import 'package:blur/blur.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class BlurIcon extends StatelessWidget {
  final height;
  const BlurIcon({Key? key, this.height}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Icon(
          Icons.play_arrow,
          color: white,
          size: height,
        ),
      ).frosted(
        blur: 10.0,
        frostColor: black.withOpacity(0.5),
        borderRadius: BorderRadius.circular(50),
      ),
    );
  }
}
