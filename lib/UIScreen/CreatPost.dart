import 'package:blackchecktech/Layout/ToolbarCreatePost.dart';
import 'package:blackchecktech/Styles/my_colors.dart';
import 'package:blackchecktech/Styles/my_icons.dart';
import 'package:blackchecktech/Utilities/Constant.dart';
import 'package:blackchecktech/Widget/AddLocationView.dart';
import 'package:blackchecktech/Widget/EditTextDecorationBorder.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/src/size_extension.dart';
import 'package:flutter_svg/flutter_svg.dart';


class CreatPost extends StatefulWidget {
  const CreatPost({Key? key}) : super(key: key);

  @override
  _CreatPostState createState() => _CreatPostState();
}

class _CreatPostState extends State<CreatPost> {


  final _Location = [
    'Nairobi, Kenya',
    'Kumasi, Ghana',
    'Abuja, Nigeria',
    'Nairobi, Kenya',
    'Kumasi, Ghana',
    'Abuja, Nigeria',
  ];


  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
          backgroundColor: Colors.white,
          appBar: ToolbarCreatPost(context,"CREATE A POST","POST"),
          body: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Stack(
                  alignment: Alignment.bottomLeft,
                  children: [
                    Image.asset(img_girl,height: 375.h,width: double.infinity,fit: BoxFit.cover,),
                    Padding(
                      padding:  EdgeInsets.all(24.r),
                      child: Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(4),
                          gradient: const LinearGradient(
                              colors: [
                                Color(0xFF1c2535),
                                Color(0xFF04080f),
                              ],
                              begin: Alignment.topCenter,
                              end: Alignment.bottomCenter,
                              stops: [0.0, 1.0],
                              tileMode: TileMode.clamp),
                        ),
                        child: Padding(
                          padding:  EdgeInsets.all(10.r),
                          child: Row(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              const Icon(Icons.person_add,size: 15,color: Colors.white,),
                              SizedBox(width: 5.w,),
                              // Tag People
                              const Text(
                                  "Tag People",
                                  style: TextStyle(
                                      color:  Color(0xffffffff),
                                      fontWeight: FontWeight.w900,
                                      fontFamily: helveticaNeue,
                                      fontStyle:  FontStyle.normal,
                                      fontSize: 12.0
                                  ),
                                  textAlign: TextAlign.left
                              )
                            ],
                          ),
                        ),
                        ),
                    ),

                  ],
                ),

                Padding(
                  padding:  const EdgeInsets.all(24.0),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      // CAPTION
                      const Text(
                          "CAPTION",
                          style:  TextStyle(
                              color:  black_121212,
                              fontWeight: FontWeight.w900,
                              fontFamily: helveticaNeue,
                              fontStyle:  FontStyle.normal,
                              fontSize: 12.0
                          ),
                          textAlign: TextAlign.left
                      ),

                      SizedBox(height: 13.h,),

                      Container(
                        decoration: EditTextDecorationBorder,
                        height: 122.h,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Expanded(
                              flex: 1,
                              child: Padding(
                                padding:  EdgeInsets.only(
                                    top: 4.h, bottom: 2.h, right: 24.w, left: 16.w),
                                child: TextFormField(

                                  minLines: 2,
                                  maxLines: 15,

                                  keyboardType: TextInputType.multiline,
                                  style: TextStyle(
                                      color: black_121212,
                                      fontWeight: FontWeight.w500,
                                      fontFamily: helveticaNeueNeue_medium,
                                      fontStyle: FontStyle.normal,
                                      fontSize: 14.sp),
                                  decoration: InputDecoration(
                                    border: InputBorder.none,
                                    contentPadding: EdgeInsets.zero,
                                    focusedBorder: InputBorder.none,
                                    enabledBorder: InputBorder.none,
                                    errorBorder: InputBorder.none,
                                    disabledBorder: InputBorder.none,
                                    hintText: 'Write a caption...',
                                    hintStyle: TextStyle(
                                        color: grey_aaaaaa,
                                        fontWeight: FontWeight.w500,
                                        fontFamily: helveticaNeueNeue_medium,
                                        fontStyle: FontStyle.normal,
                                        fontSize: 14.sp),
                                  ),
                                ),
                              ),
                            ),

                          ],
                        ),
                      ),

                      SizedBox(height: 16.h,),

                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          const Text(
                              "ADD LOCATION",
                              style:  TextStyle(
                                  color:  black_121212,
                                  fontWeight: FontWeight.w900,
                                  fontFamily: helveticaNeue,
                                  fontStyle:  FontStyle.normal,
                                  fontSize: 12.0
                              ),
                              textAlign: TextAlign.left
                          ),
                          
                          RotatedBox(
                            quarterTurns: 90,
                              child: SvgPicture.asset(icon_back_black_arrow,width: 15.w,height: 15.h,)),
                        ],
                      ),
                    ],
                  ),
                ),
                
                SizedBox(
                  height: 35.h,
                  child: ListView.separated(
                    separatorBuilder:
                        (context, index) => SizedBox(
                          width: 8.w,
                        ),
                    itemCount: 6,
                    padding: EdgeInsets.only(
                      top: 0,
                        left: 24.w,
                        right: 24.w),
                    scrollDirection: Axis.horizontal,
                    itemBuilder: (_, index) {
                    return AddLocationView(
                      title: _Location[index],
                    );
                  },
                  ),
                )

              ],
            ),
          ),
        ));
  }
}
