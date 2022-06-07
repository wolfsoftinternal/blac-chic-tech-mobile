import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';

import '../Model/FollowFriendModel.dart';


class GridLayoutTest extends StatefulWidget {
  const GridLayoutTest({Key? key}) : super(key: key);

  @override
  State<GridLayoutTest> createState() => _GridLayoutTestState();
}

class _GridLayoutTestState extends State<GridLayoutTest> {

  List<FollowFriendModel> onFollowFriendModel = [
    FollowFriendModel('assets/images/grid_img_one.png', 'Queen South'),
    FollowFriendModel('assets/images/grid_img_one.png', 'Jessica J'),
    FollowFriendModel('assets/images/grid_img_one.png', 'Queen South'),
    FollowFriendModel('assets/images/grid_img_one.png', 'Jessica J'),
    FollowFriendModel('assets/images/grid_img_one.png', 'Queen South'),
    FollowFriendModel('assets/images/grid_img_one.png', 'Jessica J'),
    FollowFriendModel('assets/images/grid_img_one.png', 'Queen South'),
    FollowFriendModel('assets/images/grid_img_one.png', 'Jessica J'),
  ];

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
          backgroundColor: Colors.white,
          body: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                StaggeredGridView.countBuilder(
                  crossAxisCount: 4,
                  itemCount: onFollowFriendModel.length,
                  shrinkWrap: true,
                  primary: false,
                  padding: EdgeInsets.only(left: 24,right: 24,top: 24),
                  itemBuilder: (BuildContext context, int index) =>
                      Stack(
                        alignment: Alignment.bottomCenter,
                        children: [
                          Image.asset(onFollowFriendModel[index].title,height: 220.h,fit: BoxFit.fill,),

                          // Startup Bootcamp 2022
                          Padding(
                            padding: const EdgeInsets.all(12.0),
                            child: Text(
                                onFollowFriendModel[index].subtitle,
                                style: const TextStyle(
                                    color:  Colors.white,
                                    fontWeight: FontWeight.w900,
                                    fontFamily: "NeueHelvetica",
                                    fontStyle:  FontStyle.normal,
                                    fontSize: 18.0
                                ),
                                textAlign: TextAlign.left
                            ),
                          )

                        ],
                      ),
                  staggeredTileBuilder: (int index) =>
                      StaggeredTile.count(2, index.isEven ? 2.7 : 2),
                  mainAxisSpacing: 16.h,
                  crossAxisSpacing: 16.w,
                )
              ],
            ),
          ),
        ));
  }
}
