import 'package:blackchecktech/Layout/ToolbarLocation.dart';
import 'package:blackchecktech/Screens/Authentication/signup/model/TagPeopleModel.dart';
import 'package:blackchecktech/Styles/my_colors.dart';
import 'package:blackchecktech/Utilities/Constant.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/src/size_extension.dart';


class RegisteredPeople extends StatefulWidget {
  const RegisteredPeople({Key? key}) : super(key: key);

  @override
  _RegisteredPeopleState createState() => _RegisteredPeopleState();
}

class _RegisteredPeopleState extends State<RegisteredPeople> {


  List<TagPeopleModel> onTagPeopleModel = [
    TagPeopleModel( "\$25","Gold"),
    TagPeopleModel( "\$20","Bronze"),
    TagPeopleModel( "\$15","Silver"),
    TagPeopleModel( "\$30","Gold"),
    TagPeopleModel( "\$25","Gold"),
    TagPeopleModel( "\$40","Silver"),

  ];


  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
          backgroundColor: Colors.white,
          appBar: ToolbarLocation(context,"REGISTERED PEOPLE","assets/images/location_icon.png"),
          body: SingleChildScrollView(
            child: Padding(
              padding:  EdgeInsets.only(left: 24.w,right: 24.w,top: 40.h),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [

                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [

                      Expanded(
                        flex: 1,
                        child: Container(
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(4.r),
                            color: const Color(0xfff5f5f5)
                          ),
                          child: Padding(
                            padding:  const EdgeInsets.all(14.0),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  children: [
                                    // Bronze
                                    Text(
                                        "Bronze",
                                        style:  TextStyle(
                                            fontFamily: "Roboto",
                                            fontStyle:  FontStyle.normal,
                                            fontSize: 16.sp
                                        ),
                                        textAlign: TextAlign.left
                                    ),

                                    SizedBox(width: 8.w,),
                                    // $15
                                    Text(
                                        "\$15",
                                        style:  TextStyle(
                                            color:   const Color(0xffaaaaaa),
                                            fontWeight: FontWeight.w400,
                                            fontFamily: "Roboto",
                                            fontStyle:  FontStyle.normal,
                                            fontSize: 16.sp
                                        ),
                                        textAlign: TextAlign.left
                                    )
                                  ],
                                ),
                                SizedBox(height: 12.h,),
                                // 111 Sold
                                Text(
                                    "111 Sold",
                                    style:  TextStyle(
                                        color:   const Color(0xff0a84ff),
                                        fontWeight: FontWeight.w600,
                                        fontFamily: "Roboto",
                                        fontStyle:  FontStyle.normal,
                                        fontSize: 16.sp
                                    ),
                                    textAlign: TextAlign.left
                                ),

                                // $1665
                                Text(
                                    "\$1665",
                                    style:  TextStyle(
                                        fontWeight: FontWeight.w400,
                                        fontFamily: "Roboto",
                                        fontStyle:  FontStyle.normal,
                                        fontSize: 14.sp
                                    ),
                                    textAlign: TextAlign.left
                                )
                              ],
                            ),
                          ),
                        ),
                      ),
                      SizedBox(width: 16.5.w,),
                      Expanded(
                        flex: 1,
                        child: Container(
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(4.r),
                              color: const Color(0xfff5f5f5)
                          ),
                          child: Padding(
                            padding:  const EdgeInsets.all(14.0),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  children: [
                                    // Bronze
                                    Text(
                                        "Bronze",
                                        style:  TextStyle(
                                            fontFamily: "Roboto",
                                            fontStyle:  FontStyle.normal,
                                            fontSize: 16.sp
                                        ),
                                        textAlign: TextAlign.left
                                    ),

                                    SizedBox(width: 8.w,),
                                    // $15
                                    Text(
                                        "\$15",
                                        style:  TextStyle(
                                            color:   const Color(0xffaaaaaa),
                                            fontWeight: FontWeight.w400,
                                            fontFamily: "Roboto",
                                            fontStyle:  FontStyle.normal,
                                            fontSize: 16.sp
                                        ),
                                        textAlign: TextAlign.left
                                    )
                                  ],
                                ),
                                SizedBox(height: 12.h,),
                                // 111 Sold
                                Text(
                                    "111 Sold",
                                    style:  TextStyle(
                                        color:   const Color(0xff0a84ff),
                                        fontWeight: FontWeight.w600,
                                        fontFamily: "Roboto",
                                        fontStyle:  FontStyle.normal,
                                        fontSize: 16.sp
                                    ),
                                    textAlign: TextAlign.left
                                ),

                                // $1665
                                Text(
                                    "\$1665",
                                    style:  TextStyle(
                                        fontWeight: FontWeight.w400,
                                        fontFamily: "Roboto",
                                        fontStyle:  FontStyle.normal,
                                        fontSize: 14.sp
                                    ),
                                    textAlign: TextAlign.left
                                )
                              ],
                            ),
                          ),
                        ),
                      )
,
                    ],
                  ),
                  SizedBox(height: 16.h,),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [

                      Expanded(
                        flex: 1,
                        child: Container(
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(4.r),
                              color: const Color(0xfff5f5f5)
                          ),
                          child: Padding(
                            padding:  const EdgeInsets.all(14.0),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  children: [
                                    // Bronze
                                    Text(
                                        "Gold",
                                        style:  TextStyle(
                                            fontFamily: "Roboto",
                                            fontStyle:  FontStyle.normal,
                                            fontSize: 16.sp
                                        ),
                                        textAlign: TextAlign.left
                                    ),

                                    SizedBox(width: 8.w,),
                                    // $15
                                    Text(
                                        "\$15",
                                        style:  TextStyle(
                                            color:   const Color(0xffaaaaaa),
                                            fontWeight: FontWeight.w400,
                                            fontFamily: "Roboto",
                                            fontStyle:  FontStyle.normal,
                                            fontSize: 16.sp
                                        ),
                                        textAlign: TextAlign.left
                                    )
                                  ],
                                ),
                                SizedBox(height: 12.h,),
                                // 111 Sold
                                Text(
                                    "111 Sold",
                                    style:  TextStyle(
                                        color:   const Color(0xff0a84ff),
                                        fontWeight: FontWeight.w600,
                                        fontFamily: "Roboto",
                                        fontStyle:  FontStyle.normal,
                                        fontSize: 16.sp
                                    ),
                                    textAlign: TextAlign.left
                                ),

                                // $1665
                                Text(
                                    "\$1665",
                                    style:  TextStyle(
                                        fontWeight: FontWeight.w400,
                                        fontFamily: "Roboto",
                                        fontStyle:  FontStyle.normal,
                                        fontSize: 14.sp
                                    ),
                                    textAlign: TextAlign.left
                                )
                              ],
                            ),
                          ),
                        ),
                      ),
                      SizedBox(width: 16.5.w,),
                      Expanded(
                        flex: 1,
                        child: Container(
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(4.r),
                              color: white_ffffff
                          ),

                        ),
                      )
                      ,
                    ],
                  ),


                  /*--------------Please Uncomment the below search bar--------------*/

                   //  SizedBox(height: 16.h,),
                  //   SearchBarTag(placeholder: "Search people"),

                  SizedBox(height: 16.h,),

                  // 100 Users
                  Text(
                      "100 Users",
                      style:  TextStyle(
                          color:  grey_aaaaaa,
                          fontFamily: "Roboto",
                          fontStyle:  FontStyle.normal,
                          fontSize: 14.sp
                      ),
                      textAlign: TextAlign.left
                  ),

                  SizedBox(height: 16.h,),

                  ListView.builder(
                    primary: false,
                    shrinkWrap: true,
                    padding: const EdgeInsets.all(0),
                    itemCount: onTagPeopleModel.length,
                    itemBuilder: (context, i) => Padding(
                      padding:  EdgeInsets.only(bottom: 16.h),
                      child: Container(
                        color: Colors.white,
                        child: Row(
                          mainAxisSize: MainAxisSize.max,
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            ClipRRect(
                                borderRadius: BorderRadius.circular(50),
                                child: Image.asset("assets/images/img_girl.png",width: 40.w,height: 40.h,fit: BoxFit.cover,)),
                            SizedBox(width: 16.w,),
                            Expanded(
                              flex: 1,
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.start,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  // claireroman
                                  Text(
                                      "claireroman",
                                      style:  TextStyle(
                                          color:   grey_aaaaaa,
                                          fontWeight: FontWeight.w500,
                                          fontFamily: helveticaNeueNeue_medium,
                                          fontStyle:  FontStyle.normal,
                                          fontSize: 14.sp
                                      ),
                                      textAlign: TextAlign.left
                                  ),
                                  SizedBox(height: 2.h,),
                                  // Claire Roman
                                  Text(
                                      "Claire Roman",
                                      style:  TextStyle(
                                          color:  black_121212,
                                          fontWeight: FontWeight.w500,
                                          fontFamily: helveticaNeueNeue_medium,
                                          fontStyle:  FontStyle.normal,
                                          fontSize: 14.sp
                                      ),
                                      textAlign: TextAlign.left
                                  ),
                                  SizedBox(height: 2.h,),
                                  // 12 Jun 2020, 110:00 AM
                                  const Text(
                                      "12 Jun 2020, 110:00 AM",
                                      style: TextStyle(
                                          color:  Color(0xffaaaaaa),
                                          fontWeight: FontWeight.w400,
                                          fontFamily: "Roboto",
                                          fontStyle:  FontStyle.normal,
                                          fontSize: 10.0
                                      ),
                                      textAlign: TextAlign.left
                                  )
                                ],
                              ),
                            ),

                            Column(
                              mainAxisAlignment: MainAxisAlignment.end,
                              crossAxisAlignment: CrossAxisAlignment.end,
                              children: [
                                // $25
                                Text(
                                    "\$25",
                                    style:  TextStyle(
                                        color:  grey_aaaaaa,
                                        fontWeight: FontWeight.w500,
                                        fontFamily: "Roboto",
                                        fontStyle:  FontStyle.normal,
                                        fontSize: 14.sp
                                    ),
                                    textAlign: TextAlign.right
                                ),

                                // Gold
                                Text(
                                    onTagPeopleModel[i].title,
                                    style:  TextStyle(
                                        color:  orange_ff881a,
                                        fontFamily: "Roboto",
                                        fontWeight: FontWeight.w500,
                                        fontStyle:  FontStyle.normal,
                                        fontSize: 14.sp
                                    ),
                                    textAlign: TextAlign.right
                                )
                              ],
                            )
                          ],
                        ),
                      ),
                    ),
                  ),

                ],
              ),
            ),
          ),
        ));
  }
}
