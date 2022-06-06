import 'package:blackchecktech/Styles/my_colors.dart';
import 'package:blackchecktech/UIScreen/PastFeature1.dart';
import 'package:flutter/material.dart';
import 'Test.dart';

class ProgressBarStep extends StatefulWidget {
  @override
  _ProgressBarStepState createState() => _ProgressBarStepState();
}

class _ProgressBarStepState extends State<ProgressBarStep> with SingleTickerProviderStateMixin {
  late Animation<double> _progressAnimation;
  late AnimationController _progressAnimcontroller;

  @override
  void initState() {
    super.initState();
    _progressAnimcontroller = AnimationController(
      duration: const Duration(milliseconds: 200),
      vsync: this,
    );
    _progressAnimation = Tween<double>(begin: beginWidth, end: endWidth)
        .animate(_progressAnimcontroller);
    _setProgressAnim(0, 1);
  }
     double? growStepWidth = 1;
     double? beginWidth = 1;
     double?  endWidth = 1;
     int totalPages = 3;

  _setProgressAnim(double maxWidth, int curPageIndex) {
    setState(() {
      growStepWidth = maxWidth / totalPages;
      beginWidth = growStepWidth!* (curPageIndex - 1);
      endWidth = growStepWidth! * curPageIndex;

      _progressAnimation = Tween<double>(begin: beginWidth, end: endWidth)
          .animate(_progressAnimcontroller);
    });
    _progressAnimcontroller.reset();
  }

  @override
  Widget build(BuildContext context) {
    var mediaQD = MediaQuery.of(context);
    var maxWidth = mediaQD.size.width;

    return Scaffold(
      backgroundColor: Colors.white,
      body: Stack(
        children: [
          Expanded(
            flex: 1,
            child: PageView(
              onPageChanged: (i) {
                //index i starts from 0!
                _progressAnimcontroller.forward(); //reset the animation first
                _setProgressAnim(maxWidth, i + 1);
              },
              children: [
                // PastFeature(),
                // PastFeature(),
                // PastFeature(),

                Container(
                  color: Colors.green,
                  child: Center(
                    child: Text("page 1"),
                  ),
                ),
                Container(
                  color: Colors.yellow,
                  child: Center(
                    child: Text("page 2"),
                  ),
                ),
                Container(
                  color: Colors.red,
                  child: Center(
                    child: Text("page 3"),
                  ),
                ),
                Container(
                  color: Colors.blue,
                  child: Center(
                    child: Text("page 4"),
                  ),
                ),
              ],
            ),
          ),

          Center(
            child: Container(
              width: double.infinity,
              transform: Matrix4.translationValues(0, 400, 0),
              child: Padding(
                padding:  const EdgeInsets.only(top: 25,left: 90,right: 90),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: <Widget>[
                        AnimatedProgressBar(
                          animation: _progressAnimation,
                        ),
                        Expanded(
                          flex: 1,
                          child: Container(
                            height: 5.0,
                            width: double.infinity,
                            decoration: BoxDecoration(color: const Color(0x33ffffff),
                                borderRadius: BorderRadius.circular(6),)
                          ),
                        )
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class AnimatedProgressBar extends AnimatedWidget {
  const AnimatedProgressBar({Key? key, required Animation<double> animation})
      : super(key: key, listenable: animation);
  @override
  Widget build(BuildContext context) {
   //  Listenable animation = listenable ;
     final animation = listenable as Animation<double>;
    return Container(
      height: 5.0,
      width: animation.value,
      decoration: const BoxDecoration(color: white_ffffff,
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(6),
            bottomLeft: Radius.circular(6),
          )),
    );
  }
}