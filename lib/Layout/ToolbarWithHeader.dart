import 'package:blackchecktech/Layout/ToolbarBackOnly.dart';
import 'package:blackchecktech/Styles/my_colors.dart';
import 'package:blackchecktech/Utilities/Constant.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/src/size_extension.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';

class ToolbarWithHeader extends StatelessWidget {
  final step;
  Function()? ontap;
  ToolbarWithHeader({Key? key, this.step, this.ontap}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        BackLayout(),
         SizedBox(
          width: 30.w,
        ),
        Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text(
              "Step ${step + 1}",
              style: const TextStyle(
                  color: orange_ff881a,
                  fontWeight: FontWeight.bold,
                  fontFamily: helveticaNeueNeue_medium),
            ),
            SizedBox(
              height: 30.h,
              width: 190.h,
              child: ListView.builder(
                  itemCount: 5,
                  scrollDirection: Axis.horizontal,
                  itemBuilder: ((context, index) {
                    return Row(
                      children: [
                        Container(
                          height: 6.h,
                          width: 30.w,
                          decoration: BoxDecoration(
                            color: step == index ? orange_ff881a : grey_aaaaaa,
                            borderRadius:
                                 BorderRadius.all(Radius.circular(5.r)),
                          ),
                        ),
                         SizedBox(
                          width: 10.w,
                        )
                      ],
                    );
                  })),
            ),
          ],
        ),
        const Spacer(),
        step == 0
            ? Container()
            : Padding(
                padding:  EdgeInsets.only(right: 24.r),
                child: InkWell(
                    onTap: ontap,
                    child: Text(
                      "Skip",
                      style: const TextStyle(
                          color: black_121212,
                          fontWeight: FontWeight.bold,
                          fontFamily: helveticaNeueNeue_medium),
                    )),
              )
      ],
    );
  }
}
