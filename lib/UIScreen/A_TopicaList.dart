import 'package:blackchecktech/Layout/BlackButton.dart';
import 'package:blackchecktech/Layout/BlackNextButton.dart';
import 'package:blackchecktech/Layout/ToolbarCreatePost.dart';
import 'package:blackchecktech/Layout/ToolbarLocation.dart';
import 'package:blackchecktech/Screens/Authentication/signup/model/TagPeopleModel.dart';
import 'package:blackchecktech/Screens/Home/CreateVideo/model/TopicListModel.dart';
import 'package:blackchecktech/Styles/my_colors.dart';
import 'package:blackchecktech/Styles/my_icons.dart';
import 'package:blackchecktech/Utilities/Constant.dart';
import 'package:blackchecktech/Widget/AddLocationView.dart';
import 'package:blackchecktech/Widget/EditTextDecoration.dart';
import 'package:blackchecktech/Widget/EditTextDecorationBorder.dart';
import 'package:blackchecktech/Widget/search_bar.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/src/size_extension.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../Model/TopicModel.dart';


class A_TopicaList extends StatefulWidget {
  const A_TopicaList({Key? key}) : super(key: key);

  @override
  _A_TopicaListState createState() => _A_TopicaListState();
}

class _A_TopicaListState extends State<A_TopicaList> {

  List<A_Topic_Model> onA_Topic_Model = [
    A_Topic_Model('Activism'),
    A_Topic_Model('Addiction'),
    A_Topic_Model('Advertising'),
    A_Topic_Model('Africa'),
    A_Topic_Model('Aging'),
    A_Topic_Model('Agriculture'),
    A_Topic_Model('Activism'),
    A_Topic_Model('Addiction'),
    A_Topic_Model('Advertising'),
    A_Topic_Model('Africa'),
    A_Topic_Model('Aging'),
    A_Topic_Model('Agriculture'),
    A_Topic_Model('Activism'),
    A_Topic_Model('Addiction'),
    A_Topic_Model('Advertising'),
    A_Topic_Model('Africa'),
    A_Topic_Model('Aging'),
    A_Topic_Model('Agriculture'),

  ];


  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
          backgroundColor: Colors.white,

          body: SingleChildScrollView(
            child: Column(
              children: [
                ListView.builder(
                    primary: false,
                    shrinkWrap: true,
                    padding: EdgeInsets.only(top: 20.h),
                    itemCount: onA_Topic_Model.length,
                    itemBuilder: (context, i) =>  // Activism
                    Padding(
                      padding:  EdgeInsets.only(bottom: 16.h),
                      child: Text(
                          onA_Topic_Model[i].title,
                          style:  TextStyle(
                              color:  black_121212,
                              fontWeight: FontWeight.w700,
                              fontFamily: "NeueHelvetica",
                              fontStyle:  FontStyle.normal,
                              fontSize: 14.sp
                          ),
                          textAlign: TextAlign.left
                      ),
                    )
                )
              ],
            ),
          ),
        ));
  }
}
