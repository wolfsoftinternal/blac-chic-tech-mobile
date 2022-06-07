import 'package:flutter/material.dart';

class Demo extends StatefulWidget {
  @override
  _DemoState createState() => _DemoState();
}

class _DemoState extends State<Demo> with SingleTickerProviderStateMixin {
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
    _setProgressAnim(1, 4);
  }

  double? growStepWidth = 1.0;
  double? beginWidth = 1.0;
  double?  endWidth = 4.0;
  int totalPages = 4;

  _setProgressAnim(double maxWidth, int curPageIndex) {
    setState(() {
      growStepWidth = maxWidth / totalPages;
      beginWidth = growStepWidth !* (curPageIndex - 1);
      endWidth = growStepWidth !* curPageIndex;

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
                  height: 5.0,
                  width:double.infinity,
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
            color: Colors.greenAccent,
            child: Center(
              child: Text("Page 1"),
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
  const AnimatedProgressBar({Key? key, required Animation<double> animation})
      : super(key: key, listenable: animation);
  @override
  Widget build(BuildContext context) {
    //  Listenable animation = listenable ;
    final animation = listenable as Animation<double>;
    return Container(
      height: 5.0,
      width: animation.value,
      decoration: const BoxDecoration(color: Colors.white,
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(6),
            bottomLeft: Radius.circular(6),
          )),
    );
  }
}