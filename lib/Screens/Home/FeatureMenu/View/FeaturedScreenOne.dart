import 'package:blackchecktech/Styles/my_icons.dart';
import 'package:flutter/material.dart';


class FeaturedScreenOne extends StatefulWidget {
  const FeaturedScreenOne({Key? key}) : super(key: key);

  @override
  _FeaturedScreenOneState createState() => _FeaturedScreenOneState();
}

class _FeaturedScreenOneState extends State<FeaturedScreenOne> {



  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
          backgroundColor: Colors.white,
          body: SingleChildScrollView(
            child: Column(
              children: [
                Stack(
                  alignment: Alignment.center,
                  children: [
                    FittedBox(
                      fit: BoxFit.fill,
                      child: Image.asset(
                        feature_img_1,
                        fit: BoxFit.cover,
                        alignment: Alignment.center,
                      ),
                    ),

              // OSA UX OF LIVING
              const Center(
                child: Text(
                    "OSA \nUX OF LIVING",
                style: TextStyle(
                color:  Color(0xffffffff),
                fontWeight: FontWeight.w900,
                fontFamily: "NeueHelvetica",
                fontStyle:  FontStyle.normal,
                fontSize: 40.0
          ),
            textAlign: TextAlign.center
        ),
              )
                  ],
                ),
              ],
            ),
          ),
        ));
  }
}
