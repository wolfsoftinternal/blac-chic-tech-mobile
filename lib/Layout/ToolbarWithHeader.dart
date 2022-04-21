import 'package:blackchecktech/Layout/ToolbarBackOnly.dart';
import 'package:blackchecktech/Styles/my_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';

class ToolbarWithHeader extends StatelessWidget {
  final step;
  const ToolbarWithHeader({this.step, Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        BackLayout(),
        const SizedBox(width: 30,),
        Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text("Step ${step + 1}", style: const TextStyle(color: orange_ff881a, fontWeight: FontWeight.bold),),
            SizedBox(
              height: 30,
              width: 190,
              child: ListView.builder(
                  itemCount: 5,
                  scrollDirection: Axis.horizontal,
                  itemBuilder: ((context, index) {
                    return Row(
                      children: [
                        Container(
                          height: 6,
                          width: 30,
                          decoration: BoxDecoration(
                            color: step == index ? orange_ff881a : grey_aaaaaa,
                            borderRadius: const BorderRadius.all(Radius.circular(5.0)),
                          ),
                        ),
                        const SizedBox(
                          width: 10,
                        )
                      ],
                    );
                  })),
            ),
          ],
        ),
        const Spacer(),
      ],
    );
  }
}
