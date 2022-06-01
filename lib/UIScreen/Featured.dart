import 'dart:math';

import 'package:blackchecktech/Styles/my_colors.dart';
import 'package:blackchecktech/Styles/my_icons.dart';
import 'package:blackchecktech/UIScreen/FeaturedScreenSecond.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/src/size_extension.dart';
import 'package:flutter_svg/flutter_svg.dart';

import 'FeaturedScreenOne.dart';


class Featured extends StatefulWidget {
  const Featured({Key? key}) : super(key: key);

  @override
  _FeaturedState createState() => _FeaturedState();
}

class _FeaturedState extends State<Featured> {

  final List<Widget> _samplePages = [
    const FeaturedScreenOne(),
    const FeaturedScreenSecond(),
    const Center(child: Text('Page 3'))
  ];
  final _controller = PageController();
  static const _kDuration = Duration(milliseconds: 300);
  static const _kCurve = Curves.ease;


  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(

          backgroundColor: Colors.white,
          body:Stack(

            children: <Widget>[
              Flexible(
                child: PageView.builder(
                  controller: _controller,
                  itemCount: _samplePages.length,
                  itemBuilder: (BuildContext context, int index) {
                    return _samplePages[index % _samplePages.length];
                  },
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(20.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    SvgPicture.asset(icon_cancel,width: 30.w,height: 30.h,color: white_ffffff,),

                    // Featured
                    Text(
                        "Featured",
                        style:  TextStyle(
                            color:  white_ffffff,
                            fontWeight: FontWeight.w900,
                            fontFamily: "NeueHelvetica",
                            fontStyle:  FontStyle.normal,
                            fontSize: 20.sp
                        ),
                        textAlign: TextAlign.left
                    ),

                    SvgPicture.asset(search,width: 20.w,height: 20.h,color: white_ffffff,),

                  ],
                ),
              ),
              Padding(
                padding:  EdgeInsets.only(bottom: 50.w,left: 32.w,right: 32.w),
                child: Container(
                 // color: Colors.lightBlueAccent,
                  child: Row(
                    mainAxisSize: MainAxisSize.max,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: <Widget>[
                      GestureDetector(
                        onTap:(){
                          _controller.previousPage(
                              duration: _kDuration, curve: _kCurve);
                        },
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.end,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Transform.rotate(
                                angle: 180 * pi / 180,
                                child: SvgPicture.asset(icon_feature_next_arrow,width: 40,height: 15,)),

                    SizedBox(height: 5.h,),
                    // READ ARTICLE
                    Text(
                          "PAST \nFEATURE",
                    style:  TextStyle(
                    color:  white_ffffff,
                    fontWeight: FontWeight.w700,
                    fontFamily: "NeueHelvetica",
                    fontStyle:  FontStyle.normal,
                    fontSize: 24.sp
                ),
        textAlign: TextAlign.left
    )

                          ],
                        ),
                      ),

                      GestureDetector(
                        onTap:(){
                          _controller.nextPage(duration: _kDuration, curve: _kCurve);
                        },
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.end,
                          crossAxisAlignment: CrossAxisAlignment.end,
                          children: [
                            SvgPicture.asset(icon_feature_next_arrow,width: 40,height: 15,),
                            SizedBox(height: 5.h,),
                            // READ ARTICLE
                            Text(
                                "READ \nARTICLE",
                                style:  TextStyle(
                                    color:  white_ffffff,
                                    fontWeight: FontWeight.w700,
                                    fontFamily: "NeueHelvetica",
                                    fontStyle:  FontStyle.normal,
                                    fontSize: 24.sp
                                ),
                                textAlign: TextAlign.right
                            )

                          ],
                        ),
                      ),
                      // FlatButton(
                      //   child: Text('Prev'),
                      //   onPressed: () {
                      //     _controller.previousPage(
                      //         duration: _kDuration, curve: _kCurve);
                      //   },
                      // ),
                      // FlatButton(
                      //   child: Text('Next'),
                      //   onPressed: () {
                      //     _controller.nextPage(duration: _kDuration, curve: _kCurve);
                      //   },
                      // )
                    ],
                  ),
                ),
              )
            ],
          ),

        ));
  }
}
