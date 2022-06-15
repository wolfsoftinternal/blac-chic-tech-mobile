import 'package:blackchecktech/Model/BusinessTypeModel.dart';
import 'package:blackchecktech/Screens/Home/videosMenu/Controller/videoMenuController.dart';
import 'package:blackchecktech/Styles/my_colors.dart';
import 'package:blackchecktech/Styles/my_icons.dart';
import 'package:blackchecktech/Screens/Home/videosMenu/View/A_TopicaList.dart';
import 'package:blackchecktech/Widget/search_bar_demo.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/src/size_extension.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';

class FilterTopicList extends StatefulWidget {
  const FilterTopicList({Key? key}) : super(key: key);

  @override
  _FilterTopicListState createState() => _FilterTopicListState();
}

class _FilterTopicListState extends State<FilterTopicList> {
  VideoMenuController controller = Get.find<VideoMenuController>();
  List<BusinessTypeModel> onBusinessTypeModel = [
    BusinessTypeModel("A", id: 1),
    BusinessTypeModel("B", id: 2),
    BusinessTypeModel("C", id: 3),
    BusinessTypeModel("D", id: 4),
    BusinessTypeModel("E", id: 5),
    BusinessTypeModel("F", id: 6),
    BusinessTypeModel("G-I", id: 7),
    BusinessTypeModel("J-N", id: 8),
    BusinessTypeModel("O-S", id: 9),
    BusinessTypeModel("T-Z", id: 10),
  ];
  String myposition = "";
  var list;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Padding(
    padding: EdgeInsets.only(left: 24.w, right: 24.w),
    child: Column(
      children: [
        SizedBox(height: 60.h,),
        Stack(
          children: [
            Container(
              child: GestureDetector(
                onTap: () {
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
                        offset: const Offset(
                            1, 4), // changes position of shadow
                      ),
                    ],
                  ),
                  child: Padding(
                    padding: EdgeInsets.all(5.0.r),
                    child: SvgPicture.asset(
                      icon_cancel,
                      width: 30.w,
                      height: 30.w,
                    ),
                  ),
                ),
              ),
            ),
            const Padding(
              padding: EdgeInsets.only(top: 15),
              child: Center(
                  child: // TOPICS
                      Text("TOPICS",
                          style: TextStyle(
                              color: Color(0xff121212),
                              fontWeight: FontWeight.w900,
                              fontFamily: "NeueHelvetica",
                              fontStyle: FontStyle.normal,
                              fontSize: 16.0),
                          textAlign: TextAlign.left)),
            ),
          ],
        ),
        SizedBox(
          height: 24.h,
        ),
        SearchBarDemo(
          onChanged: (text) {
            controller.filtterListMethod(text, check: true);
          },
          placeholder: "Search topics...",
          fillcolor: Color(0xfff5f5f5),
        ),
        GridView.builder(
            primary: false,
            shrinkWrap: true,
            padding: EdgeInsets.only(bottom: 10.h, top: 16.h),
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 6,
                childAspectRatio: 1.5 / 1.h,
                mainAxisSpacing: 8.0,
                crossAxisSpacing: 8.0),
            itemCount: onBusinessTypeModel.length,
            itemBuilder: (context, i) => GestureDetector(
                  onTap: () {
                    setState(() {
                      myposition = onBusinessTypeModel[i].title;
                      print("Filtter List :: " + list.toString());

                      controller.filtterListMethod(myposition);
                    });
                  },
                  child: Container(
                    height: 20,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(4),
                        color: const Color(0xfff5f5f5)),
                    child: // D
                        Center(
                      child: Text(onBusinessTypeModel[i].title,
                          style: TextStyle(
                              color:
                                  myposition == onBusinessTypeModel[i].title
                                      ? orange_ff881a
                                      : const Color(0xff000000),
                              fontWeight: FontWeight.w700,
                              fontFamily: "NeueHelvetica",
                              fontStyle: FontStyle.normal,
                              fontSize: 14.0),
                          textAlign: TextAlign.left),
                    ),
                  ),
                )),
        Expanded(
          flex: 1,
          child: Container(
            decoration: const BoxDecoration(color: white_ffffff),
            child: A_TopicaList(),
          ),
        ),
      ],
    ),
      ),
    );
  }
}
