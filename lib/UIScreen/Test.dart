import 'package:blackchecktech/Utilities/Constant.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:readmore/readmore.dart';


import '../Styles/my_colors.dart';

class Test extends StatefulWidget {
  @override
  _TestState createState() => _TestState();
}

class _TestState extends State<Test> with SingleTickerProviderStateMixin {
  late Animation<double> _progressAnimation;
  late AnimationController _progressAnimcontroller;

  @override
  void initState() {
    super.initState();

    _progressAnimcontroller = AnimationController(
      duration: Duration(milliseconds: 200),
      vsync: this,
    );

    _progressAnimation = Tween<double>(begin: beginWidth, end: endWidth)
        .animate(_progressAnimcontroller);

    _setProgressAnim(0, 1);
  }

  // late double growStepWidth, beginWidth, endWidth = 0.0;
  late double growStepWidth = 0.0;
  late double beginWidth = 0.0;
  late double  endWidth = 0.0;
  int totalPages = 4;

  _setProgressAnim(double maxWidth, int curPageIndex) {
    setState(() {
      growStepWidth = maxWidth / totalPages;
      beginWidth = growStepWidth * (curPageIndex - 1);
      endWidth = growStepWidth * curPageIndex;

      _progressAnimation = Tween<double>(begin: beginWidth, end: endWidth)
          .animate(_progressAnimcontroller);
    });

    _progressAnimcontroller.forward();
  }

  @override
  Widget build(BuildContext context) {
    var mediaQD = MediaQuery.of(context);
    var maxWidth = mediaQD.size.width;

    return Scaffold(
      appBar: AppBar(
        title: Container(
          color: Colors.transparent,
          child: Row(
            children: <Widget>[
              AnimatedProgressBar(
                animation: _progressAnimation,
              ),
              Expanded(
                child: Container(
                  height: 6.0,
                  width: double.infinity,
                  decoration: BoxDecoration(color: Colors.cyanAccent),
                ),
              )
            ],
          ),
        ),
      ),
      body: PageView(
        onPageChanged: (i) {
          //index i starts from 0!
          _progressAnimcontroller.reset(); //reset the animation first
          _setProgressAnim(maxWidth, i + 1);
        },
        children: <Widget>[
          Container(
            color: Colors.white,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
              ReadMoreText(
              'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Vel vitae malesuada faucibus vitae cursus sed ultricies Lorem ipsum dolor sit amet, consectetur adipiscing elit. Vel vitae malesuada faucibus vitae cursus sed ultricies',
              style: TextStyle(
                fontSize: 15.sp,color:opcity_black_B3121212,fontFamily: roboto_medium
              ),
              trimLines: 3,
              // trimLength: 10,
              // colorClickableText: Colors.pink,
              trimMode: TrimMode.Line,
              trimCollapsedText: 'See full article',
              trimExpandedText: 'See less article',
              moreStyle: TextStyle(fontSize: 12.sp,color: black_121212,fontFamily: helvetica_neu_bold),
              lessStyle : TextStyle(fontSize: 12.sp,color: black_121212,fontFamily: helvetica_neu_bold),
            )
              ],
            ),
          ),
          Container(
            color: Colors.blueAccent,
            child: Center(
              child: Text("Page 2"),
            ),
          ),
          Container(
            color: Colors.amberAccent,
            child: Center(
              child: Text("Page 3"),
            ),
          ),
          Container(
            color: Colors.purpleAccent,
            child: Center(
              child: Text("Page 4"),
            ),
          ),
        ],
      ),
    );
  }
}

class AnimatedProgressBar extends AnimatedWidget {
  AnimatedProgressBar({Key? key, required Animation<double> animation})
      : super(key: key, listenable: animation);
  Widget build(BuildContext context) {
    //  Listenable animation = listenable ;
    final animation = listenable as Animation<double>;
    return Container(
      height: 5.0,
      width: animation.value,
      decoration: BoxDecoration(color: white_ffffff,
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(6),
            bottomLeft: Radius.circular(6),
          )),
    );
  }
}