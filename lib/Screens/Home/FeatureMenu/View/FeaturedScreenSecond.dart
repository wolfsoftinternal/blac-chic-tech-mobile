import 'package:blackchecktech/Styles/my_icons.dart';
import 'package:flutter/material.dart';


class FeaturedScreenSecond extends StatefulWidget {
  const FeaturedScreenSecond({Key? key}) : super(key: key);

  @override
  _FeaturedScreenOneState createState() => _FeaturedScreenOneState();
}

class _FeaturedScreenOneState extends State<FeaturedScreenSecond> {



  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(height: 50.0,),
            Stack(
              alignment: Alignment.center,
              children: [
                Image.asset(
                  feature_img_1,
                  fit: BoxFit.cover,
                  alignment: Alignment.center,
                ),

          // OSA UX OF LIVING
          const Center(
            child: Text(
                "OSA \nUI OF LIVING",
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
    );
  }
}
