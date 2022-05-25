import 'package:blackchecktech/Layout/BlackButton.dart';
import 'package:blackchecktech/Layout/BlackNextButton.dart';
import 'package:blackchecktech/Layout/ToolbarCreatePost.dart';
import 'package:blackchecktech/Layout/ToolbarLocation.dart';
import 'package:blackchecktech/Screens/Authentication/signup/model/TagPeopleModel.dart';
import 'package:blackchecktech/Styles/my_colors.dart';
import 'package:blackchecktech/Styles/my_icons.dart';
import 'package:blackchecktech/UIScreen/Featured.dart';
import 'package:blackchecktech/UIScreen/FeaturedScreenOne.dart';
import 'package:blackchecktech/UIScreen/FeaturedScreenSecond.dart';
import 'package:blackchecktech/Utilities/Constant.dart';
import 'package:blackchecktech/Widget/AddLocationView.dart';
import 'package:blackchecktech/Widget/EditTextDecoration.dart';
import 'package:blackchecktech/Widget/EditTextDecorationBorder.dart';
import 'package:blackchecktech/Widget/search_bar.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/src/size_extension.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../Model/BusinessTypeModel.dart';
import '../Widget/search_bar_demo.dart';
import 'A_TopicaList.dart';


class FilterTopicList extends StatefulWidget {
  const FilterTopicList({Key? key}) : super(key: key);

  @override
  _FilterTopicListState createState() => _FilterTopicListState();
}

class _FilterTopicListState extends State<FilterTopicList> {


  List<BusinessTypeModel> onBusinessTypeModel = [
    BusinessTypeModel( "A",id: 1),
    BusinessTypeModel( "B",id: 2),
    BusinessTypeModel( "C",id: 3),
    BusinessTypeModel( "D",id: 4),
    BusinessTypeModel( "E",id: 5),
    BusinessTypeModel( "F",id: 6),
    BusinessTypeModel( "G-I",id: 7),
    BusinessTypeModel( "J-N",id: 8),
    BusinessTypeModel( "O-S",id: 9),
    BusinessTypeModel( "T-Z",id: 10),
  ];

  int myposition = 1;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
          backgroundColor: Colors.white,
          body: Padding(
            padding:  EdgeInsets.only(left: 24.w,top: 33.h,right: 24.w),
            child: Column(
              children: [
                Stack(
                  children: [
                    Container(
                      child:  GestureDetector(
                        onTap: (){
                          Navigator.pop(context);
                        },
                        child: Container(
                          width: 48.r,
                          height: 48.r,
                          decoration: BoxDecoration(
                            color: Colors.white,
                            shape: BoxShape.circle,
                            // borderRadius: BorderRadius.circular(10.r),
                            boxShadow: [
                              BoxShadow(
                                color: Colors.grey.withOpacity(0.1),
                                spreadRadius: 6,
                                blurRadius: 10,
                                offset: Offset(1, 4), // changes position of shadow
                              ),
                            ],
                          ),
                          child: Padding(
                            padding:  EdgeInsets.all(5.0.r),
                            child: SvgPicture.asset(icon_cancel,width: 30.w,height: 30.w,),
                          ),
                        ),
                      ),
                    ),
                    Padding(
                      padding:  EdgeInsets.only(top: 15),
                      child: Center(child: // TOPICS
                      Text(
                          "TOPICS",
                          style: const TextStyle(
                              color:  const Color(0xff121212),
                              fontWeight: FontWeight.w900,
                              fontFamily: "NeueHelvetica",
                              fontStyle:  FontStyle.normal,
                              fontSize: 16.0
                          ),
                          textAlign: TextAlign.left
                      )),
                    ),

                  ],
                ),
                SizedBox(height: 24.h,),
                SearchBarDemo(
                  placeholder: "Search topics...",
                  fillcolor: Color(0xfff5f5f5),
                ),

                GridView.builder(
                    primary: false,
                    shrinkWrap: true,
                    padding: EdgeInsets.only(bottom: 10.h,top: 16.h),
                    gridDelegate:
                    SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 6,
                        childAspectRatio: 1.5/1.h,

                        mainAxisSpacing: 8.0,
                        crossAxisSpacing: 8.0),
                    itemCount: onBusinessTypeModel.length,
                    itemBuilder: (context, i) => GestureDetector(
                      onTap: (){
                        setState(() {
                          myposition = onBusinessTypeModel[i].id;
                        });
                      },
                      child: Container(
                        height: 20,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(4),
                          color: Color(0xfff5f5f5)
                        ),
                        child: // D
                        Center(
                          child: Text(
                              onBusinessTypeModel[i].title,
                              style:  TextStyle(
                                  color:  myposition== onBusinessTypeModel[i].id ?orange_ff881a: Color(0xff000000),
                                  fontWeight: FontWeight.w700,
                                  fontFamily: "NeueHelvetica",
                                  fontStyle:  FontStyle.normal,
                                  fontSize: 14.0
                              ),
                              textAlign: TextAlign.left
                          ),
                        ),
                      ),
                    )
                ),

                Expanded(
                  flex: 1,
                  child: Container(

                    decoration: BoxDecoration(
                        color: white_ffffff),
                    child: getCotainWidget(myposition),
                  ),
                ),
              ],
            ),
          ),
        ));
  }

  getCotainWidget(int myposition) {
    if(myposition == 1)
    {
      return A_TopicaList();
    }
    else if(myposition == 2)
    {
      return FeaturedScreenSecond();
    }
    else if(myposition == 3)
    {
      return FeaturedScreenOne();
    }
    else if(myposition == 4)
    {
      return FeaturedScreenSecond();
    }
  }


}
