import 'package:blackchecktech/Layout/BlackButton.dart';
import 'package:blackchecktech/Layout/ToolbarLocation.dart';
import 'package:blackchecktech/Styles/my_colors.dart';
import 'package:blackchecktech/Styles/my_icons.dart';
import 'package:blackchecktech/Utilities/Constant.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/src/size_extension.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../Layout/InputTextLayoutDemo.dart';


class AboutMe extends StatefulWidget {
  const AboutMe({Key? key}) : super(key: key);

  @override
  _AboutMeState createState() => _AboutMeState();
}

class _AboutMeState extends State<AboutMe> {

  final _firstnameController = TextEditingController();
  final _lastnameController = TextEditingController();
  final _JobfirstnameController = TextEditingController();
  final _JoblastnameController = TextEditingController();
  final _SchoolController = TextEditingController();

  String? dropdownValue;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
          backgroundColor: Colors.white,
          appBar: ToolbarLocation(context,"ABOUT ME","assets/images/location_icon.png"),
          body: Column(
            children: [
              Expanded(
                flex: 1,
                child: SingleChildScrollView(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Padding(
                        padding:  EdgeInsets.only(left: 24.w,right: 24.w,top: 20.h,bottom: 24.h),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [


                            // YOUR CURRENT JOB
                            Text(
                                "YOUR CURRENT JOB",
                                style:  TextStyle(
                                    color:  black_121212,
                                    fontWeight: FontWeight.w900,
                                    fontFamily: "NeueHelvetica",
                                    fontStyle:  FontStyle.normal,
                                    fontSize: 12.sp
                                ),
                                textAlign: TextAlign.left
                            ),

                            SizedBox(height: 16.h,),

                            Row(
                              children: [
                                Expanded(
                                    child: InputTextLayoutDemo(
                                        "Title",
                                        _firstnameController,
                                        false,
                                        TextInputAction.next,
                                        TextInputType.text, false
                                    )),
                                SizedBox(
                                  width: 15.w,
                                ),
                                Expanded(
                                    child: InputTextLayoutDemo(
                                        "Company",
                                        _lastnameController,
                                        false,
                                        TextInputAction.done,
                                        TextInputType.text, false)),
                              ],
                            ),

                            SizedBox(height: 16.h,),
                            // WEBSITE LINK
                            Text(
                                "WEBSITE LINK",
                                style:  TextStyle(
                                    color:  black_121212,
                                    fontWeight: FontWeight.w900,
                                    fontFamily: "NeueHelvetica",
                                    fontStyle:  FontStyle.normal,
                                    fontSize: 12.sp
                                ),
                                textAlign: TextAlign.left
                            ),

                            SizedBox(height: 11.h,),

                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [

                                // www.bookingsafrica.com
                                Opacity(
                                  opacity : 0.699999988079071,
                                  child:   Text(
                                      "www.bookingsafrica.com",
                                      style:  TextStyle(
                                          color:  const Color(0xff0a84ff),
                                          fontWeight: FontWeight.w500,
                                          fontFamily: "NeueHelvetica",
                                          fontStyle:  FontStyle.normal,
                                          fontSize: 12.sp
                                      ),
                                      textAlign: TextAlign.left
                                  ),
                                ),

                                SvgPicture.asset(icon_edit_blue,width: 12.w,height: 12.h,)
                              ],
                            )





                          ],
                        ),
                      ),

                      Container(
                          width: double.infinity,
                          height: 1,
                          decoration: const BoxDecoration(
                              color:  view_line_f4f6f6
                          ),
                      ),

                      Padding(
                        padding:  EdgeInsets.only(left: 24.w,right: 24.w,top: 16.h,bottom: 16.h),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [

                            Text(
                                "PAST JOBS",
                                style:  TextStyle(
                                    color:  black_121212,
                                    fontWeight: FontWeight.w900,
                                    fontFamily: "NeueHelvetica",
                                    fontStyle:  FontStyle.normal,
                                    fontSize: 12.sp
                                ),
                                textAlign: TextAlign.left
                            ),

                            SizedBox(height: 16.h,),

                            Row(
                              children: [
                                SvgPicture.asset(icon_apple,width: 32.w,height: 32.h,),
                                SizedBox(width: 12.w,),
                                // Project Manager @ Apple Inc
                                Expanded(
                                  flex: 1,
                                  child: Text(
                                      "Project Manager @ Apple Inc",
                                      style:  TextStyle(
                                          color:  grey_aaaaaa,
                                          fontFamily: helveticaNeueNeue_medium,
                                          fontStyle:  FontStyle.normal,
                                          fontSize: 14.sp
                                      ),
                                      textAlign: TextAlign.left
                                  ),
                                ),

                                SvgPicture.asset(icon_edit_blue,width: 12.w,height: 12.w,)
                              ],
                            ),

                            SizedBox(height: 12.h,),

                            Row(
                              children: [
                                SvgPicture.asset(icon_spotify,width: 32.w,height: 32.h,),
                                SizedBox(width: 12.w,),
                                // Project Manager @ Apple Inc
                                Expanded(
                                  flex: 1,
                                  child: Text(
                                      "UI/UX Designer @ Spotify",
                                      style:  TextStyle(
                                          color:  grey_aaaaaa,
                                          fontFamily: helveticaNeueNeue_medium,
                                          fontStyle:  FontStyle.normal,
                                          fontSize: 14.sp
                                      ),
                                      textAlign: TextAlign.left
                                  ),
                                ),

                                SvgPicture.asset(icon_edit_blue,width: 12.w,height: 12.w,)
                              ],
                            ),

                            SizedBox(height: 16.h,),

                            Container(
                              decoration: BoxDecoration(
                                border: Border.all(
                                  width: 1,
                                  color: black_121212
                                ),
                                color: white_ffffff,
                                borderRadius: BorderRadius.circular(4.r),
                              ),
                              child: Padding(
                                padding:  const EdgeInsets.all(10.0),
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    SvgPicture.asset(icon_add_black,width: 16.w,height: 16.h,),
                                    SizedBox(width: 10.w,),
                                    // Add More
                                    const Text(
                                        "Add More",
                                        style: TextStyle(
                                            color:  Color(0xff121212),
                                            fontWeight: FontWeight.w700,
                                            fontFamily: "NeueHelvetica",
                                            fontStyle:  FontStyle.normal,
                                            fontSize: 12.0
                                        ),
                                        textAlign: TextAlign.left
                                    )
                                  ],
                                ),
                              ),
                            ),

                            SizedBox(height: 16.h,),

                            Row(
                              children: [
                                Expanded(
                                    child: InputTextLayoutDemo(
                                        "Title",
                                        _JobfirstnameController,
                                        false,
                                        TextInputAction.next,
                                        TextInputType.text, false
                                    )),
                                SizedBox(
                                  width: 15.w,
                                ),
                                Expanded(
                                    child: InputTextLayoutDemo(
                                        "Company",
                                        _JoblastnameController,
                                        false,
                                        TextInputAction.done,
                                        TextInputType.text, false)),
                              ],
                            ),

                            SizedBox(height: 16.h,),

                            Row(
                              children: [
                                Expanded(
                                  flex: 1,
                                  child: Container(
                                    height: 50.h,
                                    decoration: BoxDecoration(
                                      border: Border.all(
                                          width: 1,
                                          color: black_121212
                                      ),
                                      color: white_ffffff,
                                      borderRadius: BorderRadius.circular(4.r),
                                    ),
                                    child: Center(
                                      child: Text(
                                          "DELETE",
                                          style:  TextStyle(
                                              color:  const Color(0xff121212),
                                              fontWeight: FontWeight.w700,
                                              fontFamily: "NeueHelvetica",
                                              fontStyle:  FontStyle.normal,
                                              fontSize: 12.sp
                                          ),
                                          textAlign: TextAlign.left
                                      ),
                                    ),
                                  ),
                                ),
                                SizedBox(width: 15.w,),
                                Expanded(
                                  flex: 1,
                                  child: Container(
                                    height: 50.h,
                                    decoration: BoxDecoration(

                                      color: black_121212,
                                      borderRadius: BorderRadius.circular(4.r),
                                    ),
                                    child: Center(
                                      child: Text(
                                          "SAVE",
                                          style:  TextStyle(
                                              color:  white_ffffff,
                                              fontWeight: FontWeight.w700,
                                              fontFamily: "NeueHelvetica",
                                              fontStyle:  FontStyle.normal,
                                              fontSize: 12.sp
                                          ),
                                          textAlign: TextAlign.left
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            )


                          ],
                        ),
                      ),

                      Container(
                        width: double.infinity,
                        height: 1,
                        decoration: const BoxDecoration(
                            color:  view_line_f4f6f6
                        ),
                      ),

                      Padding(
                        padding:  EdgeInsets.only(left: 24.w,right: 24.w,top: 16.h,bottom: 16.h),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [

                            Text(
                                "EDUCATION",
                                style:  TextStyle(
                                    color:  black_121212,
                                    fontWeight: FontWeight.w900,
                                    fontFamily: "NeueHelvetica",
                                    fontStyle:  FontStyle.normal,
                                    fontSize: 12.sp
                                ),
                                textAlign: TextAlign.left
                            ),

                            SizedBox(height: 16.h,),

                            Container(
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(4.r),
                                color: white_ffffff,
                                border: Border.all(
                                  width: 1,
                                  color: light_grey_f2f2f2
                                )

                              ),
                              child: Padding(
                                padding: const EdgeInsets.all(16.0),
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Row(
                                      children: [
                                        // Project Manager @ Apple Inc
                                        Expanded(
                                          flex: 1,
                                          child: // EDUCATION
                                          Text(
                                              "EDUCATION",
                                              style:  TextStyle(
                                                  color:  black_121212,
                                                  fontWeight: FontWeight.w900,
                                                  fontFamily: "NeueHelvetica",
                                                  fontStyle:  FontStyle.normal,
                                                  fontSize: 12.sp
                                              ),
                                              textAlign: TextAlign.left
                                          )
                                        ),

                                        SvgPicture.asset(icon_edit_blue,width: 12.w,height: 12.w,)
                                      ],
                                    ),
                                    SizedBox(height: 8.h,),
                                    // Diponegoro University / 2011 - 2019
                                    Text(
                                        "Diponegoro University / 2011 - 2019",
                                        style:  TextStyle(
                                            color:  grey_aaaaaa,
                                            fontFamily: helveticaNeueNeue_medium,
                                            fontStyle:  FontStyle.normal,
                                            fontSize: 16.sp
                                        ),
                                        textAlign: TextAlign.left
                                    )
                                  ],
                                ),
                              ),
                            ),

                            SizedBox(height: 16.h,),

                            Container(
                              decoration: BoxDecoration(
                                border: Border.all(
                                    width: 1,
                                    color: black_121212
                                ),
                                color: white_ffffff,
                                borderRadius: BorderRadius.circular(4.r),
                              ),
                              child: Padding(
                                padding:  const EdgeInsets.all(10.0),
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    SvgPicture.asset(icon_add_black,width: 16.w,height: 16.h,),
                                    SizedBox(width: 10.w,),
                                    // Add More
                                    const Text(
                                        "Add More",
                                        style: TextStyle(
                                            color:  Color(0xff121212),
                                            fontWeight: FontWeight.w700,
                                            fontFamily: "NeueHelvetica",
                                            fontStyle:  FontStyle.normal,
                                            fontSize: 12.0
                                        ),
                                        textAlign: TextAlign.left
                                    )
                                  ],
                                ),
                              ),
                            ),

                            SizedBox(height: 16.h,),

                            InputTextLayoutDemo(
                                "University/School",
                                _SchoolController,
                                false,
                                TextInputAction.next,
                                TextInputType.text, false
                            ),

                            SizedBox(height: 16.h,),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Expanded(
                                  flex: 1,
                                  child: Container(
                                    height: 60.h,
                                    padding: const EdgeInsets.only(left: 16, right: 10),
                                    decoration: BoxDecoration(
                                      color: light_grey_f2f2f2,
                                      borderRadius: BorderRadius.circular(4),
                                      // border: Border.all(color: Colors.black,width: 4)
                                    ),
                                    child: DropdownButtonHideUnderline(
                                      child: DropdownButton<String>(
                                        hint: const Text(
                                          "Role",
                                          style: TextStyle(
                                              color: Colors.black,
                                              fontSize: 14,
                                              fontFamily: helveticaNeueNeue_medium),
                                        ),
                                        value: dropdownValue,
                                        isExpanded: true,
                                        icon: SvgPicture.asset(
                                          icon_down_arrow_spinner,
                                          color: grey_aaaaaa,
                                          height: 16,
                                          width: 16,
                                        ),
                                        iconSize: 24,
                                        elevation: 16,
                                        style: const TextStyle(
                                            color: Colors.black,
                                            fontSize: 14,
                                            fontFamily: helveticaNeueNeue_medium),
                                        // underline: Container(
                                        //   height: 2,
                                        //   color: Colors.deepPurpleAccent,
                                        // ),
                                        onChanged: (String? newValue) {
                                          setState(() {
                                            dropdownValue = newValue!;
                                          });
                                        },
                                        items: <String>[
                                          'One',
                                          'Two',
                                          'Three',
                                          'Four',
                                          'Five',
                                          'Six',
                                          'Seven'
                                        ].map<DropdownMenuItem<String>>((String value) {
                                          return DropdownMenuItem<String>(
                                            value: value,
                                            child: Text(value),
                                          );
                                        }).toList(),
                                      ),
                                    ),
                                  ),
                                ),
                                SizedBox(
                                  width: 8.w,
                                ),
                                Expanded(
                                  flex: 1,
                                  child: Container(
                                    height: 60.h,
                                    padding: const EdgeInsets.only(left: 16, right: 10),
                                    decoration: BoxDecoration(
                                      color: light_grey_f2f2f2,
                                      borderRadius: BorderRadius.circular(4),
                                      // border: Border.all(color: Colors.black,width: 4)
                                    ),
                                    child: DropdownButtonHideUnderline(
                                      child: DropdownButton<String>(
                                        hint: const Text(
                                          "Industry",
                                          style: TextStyle(
                                              color: Colors.black,
                                              fontSize: 14,
                                              fontFamily: helveticaNeueNeue_medium),
                                        ),
                                        value: dropdownValue,
                                        isExpanded: true,
                                        icon: SvgPicture.asset(
                                          icon_down_arrow_spinner,
                                          color: grey_aaaaaa,
                                          height: 16,
                                          width: 16,
                                        ),
                                        iconSize: 24,
                                        elevation: 16,
                                        style: const TextStyle(
                                            color: Colors.black,
                                            fontSize: 14,
                                            fontFamily: helveticaNeueNeue_medium),
                                        // underline: Container(
                                        //   height: 2,
                                        //   color: Colors.deepPurpleAccent,
                                        // ),
                                        onChanged: (String? newValue) {
                                          setState(() {
                                            dropdownValue = newValue!;
                                          });
                                        },
                                        items: <String>[
                                          'One',
                                          'Two',
                                          'Three',
                                          'Four',
                                          'Five',
                                          'Six',
                                          'Seven'
                                        ].map<DropdownMenuItem<String>>((String value) {
                                          return DropdownMenuItem<String>(
                                            value: value,
                                            child: Text(value),
                                          );
                                        }).toList(),
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            ),

                            SizedBox(height: 16.h,),

                            Row(
                              children: [
                                Expanded(
                                  flex: 1,
                                  child: Container(
                                    height: 50.h,
                                    decoration: BoxDecoration(
                                      border: Border.all(
                                          width: 1,
                                          color: black_121212
                                      ),
                                      color: white_ffffff,
                                      borderRadius: BorderRadius.circular(4.r),
                                    ),
                                    child: Center(
                                      child: Text(
                                          "DELETE",
                                          style:  TextStyle(
                                              color:  const Color(0xff121212),
                                              fontWeight: FontWeight.w700,
                                              fontFamily: "NeueHelvetica",
                                              fontStyle:  FontStyle.normal,
                                              fontSize: 12.sp
                                          ),
                                          textAlign: TextAlign.left
                                      ),
                                    ),
                                  ),
                                ),
                                SizedBox(width: 15.w,),
                                Expanded(
                                  flex: 1,
                                  child: Container(
                                    height: 50.h,
                                    decoration: BoxDecoration(

                                      color: black_121212,
                                      borderRadius: BorderRadius.circular(4.r),
                                    ),
                                    child: Center(
                                      child: Text(
                                          "SAVE",
                                          style:  TextStyle(
                                              color:  white_ffffff,
                                              fontWeight: FontWeight.w700,
                                              fontFamily: "NeueHelvetica",
                                              fontStyle:  FontStyle.normal,
                                              fontSize: 12.sp
                                          ),
                                          textAlign: TextAlign.left
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            )


                          ],
                        ),
                      ),

                      Container(
                        width: double.infinity,
                        height: 1,
                        decoration: const BoxDecoration(
                            color:  view_line_f4f6f6
                        ),
                      ),

                      Padding(
                        padding:  EdgeInsets.only(left: 24.w,right: 24.w,top: 24.h,bottom: 16.h),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            
                            Container(
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(4.r),
                                  color: white_ffffff,
                                  border: Border.all(
                                      width: 1,
                                      color: light_grey_f2f2f2
                                  )

                              ),
                              child: Padding(
                                padding: const EdgeInsets.all(16.0),
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Row(
                                      children: [
                                        SvgPicture.asset(question_icon,width: 16.w,height: 16.h,),
                                        SizedBox(width: 8.w,),
                                        Expanded(
                                            flex: 1,
                                            child: // EDUCATION
                                            Text(
                                                "ABOUT ME",
                                                style:  TextStyle(
                                                    color:  black_121212,
                                                    fontWeight: FontWeight.w900,
                                                    fontFamily: "NeueHelvetica",
                                                    fontStyle:  FontStyle.normal,
                                                    fontSize: 12.sp
                                                ),
                                                textAlign: TextAlign.left
                                            )
                                        ),

                                        SvgPicture.asset(icon_edit_blue,width: 12.w,height: 12.w,)
                                      ],
                                    ),
                                    SizedBox(height: 8.h,),
                                    // Diponegoro University / 2011 - 2019
                                    Padding(
                                      padding:  EdgeInsets.only(left: 24.w),
                                      child: Text(
                                          "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Id massa sagittis nulla dolor vitae risus libero blandit.",
                                          style:  TextStyle(
                                              color:  grey_aaaaaa,
                                              fontFamily: helveticaNeueNeue_medium,
                                              fontStyle:  FontStyle.normal,
                                              fontSize: 15.sp
                                          ),
                                          textAlign: TextAlign.left
                                      ),
                                    )
                                  ],
                                ),
                              ),
                            ),

                            SizedBox(height: 16.h,),

                            Container(
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(4.r),
                                  color: white_ffffff,
                                  border: Border.all(
                                      width: 1,
                                      color: light_grey_f2f2f2
                                  )

                              ),
                              child: Padding(
                                padding: const EdgeInsets.all(16.0),
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Row(
                                      children: [
                                        SvgPicture.asset(question_icon,width: 16.w,height: 16.h,),
                                        SizedBox(width: 8.w,),
                                        Expanded(
                                            flex: 1,
                                            child: // EDUCATION
                                            Text(
                                                "WHAT HAVE YOU DONE ?",
                                                style:  TextStyle(
                                                    color:  black_121212,
                                                    fontWeight: FontWeight.w900,
                                                    fontFamily: "NeueHelvetica",
                                                    fontStyle:  FontStyle.normal,
                                                    fontSize: 12.sp
                                                ),
                                                textAlign: TextAlign.left
                                            )
                                        ),

                                        SvgPicture.asset(icon_edit_blue,width: 12.w,height: 12.w,)
                                      ],
                                    ),
                                    SizedBox(height: 8.h,),
                                    // Diponegoro University / 2011 - 2019
                                    Padding(
                                      padding:  EdgeInsets.only(left: 24.w),
                                      child: Text(
                                          "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Id massa sagittis nulla dolor vitae risus libero blandit.",
                                          style:  TextStyle(
                                              color:  grey_aaaaaa,
                                              fontFamily: helveticaNeueNeue_medium,
                                              fontStyle:  FontStyle.normal,
                                              fontSize: 15.sp
                                          ),
                                          textAlign: TextAlign.left
                                      ),
                                    )
                                  ],
                                ),
                              ),
                            ),

                            SizedBox(height: 16.h,),

                            Container(
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(4.r),
                                  color: white_ffffff,
                                  border: Border.all(
                                      width: 1,
                                      color: light_grey_f2f2f2
                                  )

                              ),
                              child: Padding(
                                padding: const EdgeInsets.all(16.0),
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Row(
                                      children: [
                                        SvgPicture.asset(question_icon,width: 16.w,height: 16.h,),
                                        SizedBox(width: 8.w,),
                                        Expanded(
                                            flex: 1,
                                            child: // EDUCATION
                                            Text(
                                                "WHAT WILL YOU BE DOING IN THE FUTURE ?",
                                                style:  TextStyle(
                                                    color:  black_121212,
                                                    fontWeight: FontWeight.w900,
                                                    fontFamily: "NeueHelvetica",
                                                    fontStyle:  FontStyle.normal,
                                                    fontSize: 12.sp
                                                ),
                                                textAlign: TextAlign.left
                                            )
                                        ),

                                        SvgPicture.asset(icon_edit_blue,width: 12.w,height: 12.w,)
                                      ],
                                    ),
                                    SizedBox(height: 8.h,),
                                    // Diponegoro University / 2011 - 2019
                                    Padding(
                                      padding:  EdgeInsets.only(left: 24.w),
                                      child: Text(
                                          "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Id massa sagittis nulla dolor vitae risus libero blandit.",
                                          style:  TextStyle(
                                              color:  grey_aaaaaa,
                                              fontFamily: helveticaNeueNeue_medium,
                                              fontStyle:  FontStyle.normal,
                                              fontSize: 15.sp
                                          ),
                                          textAlign: TextAlign.left
                                      ),
                                    )
                                  ],
                                ),
                              ),
                            ),

                            SizedBox(height: 16.h,),

                            Container(
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(4.r),
                                  color: white_ffffff,
                                  border: Border.all(
                                      width: 1,
                                      color: light_grey_f2f2f2
                                  )

                              ),
                              child: Padding(
                                padding: const EdgeInsets.all(16.0),
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Row(
                                      children: [
                                        SvgPicture.asset(question_icon,width: 16.w,height: 16.h,),
                                        SizedBox(width: 8.w,),
                                        Expanded(
                                            flex: 1,
                                            child: // EDUCATION
                                            Text(
                                                "WHAT HILL ARE YOU 1000% WILLING TO DIE ON ?",
                                                style:  TextStyle(
                                                    color:  black_121212,
                                                    fontWeight: FontWeight.w900,
                                                    fontFamily: "NeueHelvetica",
                                                    fontStyle:  FontStyle.normal,
                                                    fontSize: 12.sp
                                                ),
                                                textAlign: TextAlign.left
                                            )
                                        ),

                                        SvgPicture.asset(icon_edit_blue,width: 12.w,height: 12.w,)
                                      ],
                                    ),
                                    SizedBox(height: 8.h,),
                                    // Diponegoro University / 2011 - 2019
                                    Padding(
                                      padding:  EdgeInsets.only(left: 24.w),
                                      child: Text(
                                          "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Id massa sagittis nulla dolor vitae risus libero blandit.",
                                          style:  TextStyle(
                                              color:  grey_aaaaaa,
                                              fontFamily: helveticaNeueNeue_medium,
                                              fontStyle:  FontStyle.normal,
                                              fontSize: 15.sp
                                          ),
                                          textAlign: TextAlign.left
                                      ),
                                    )
                                  ],
                                ),
                              ),
                            ),

                            SizedBox(height: 16.h,),

                            Container(
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(4.r),
                                  color: white_ffffff,
                                  border: Border.all(
                                      width: 1,
                                      color: light_grey_f2f2f2
                                  )

                              ),
                              child: Padding(
                                padding: const EdgeInsets.all(16.0),
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Row(
                                      children: [
                                        SvgPicture.asset(question_icon,width: 16.w,height: 16.h,),
                                        SizedBox(width: 8.w,),
                                        Expanded(
                                            flex: 1,
                                            child: // EDUCATION
                                            Text(
                                                "COME TO ME FOR - WHAT ARE YOU GOOD AT ?",
                                                style:  TextStyle(
                                                    color:  black_121212,
                                                    fontWeight: FontWeight.w900,
                                                    fontFamily: "NeueHelvetica",
                                                    fontStyle:  FontStyle.normal,
                                                    fontSize: 12.sp
                                                ),
                                                textAlign: TextAlign.left
                                            )
                                        ),

                                        SvgPicture.asset(icon_edit_blue,width: 12.w,height: 12.w,)
                                      ],
                                    ),
                                    SizedBox(height: 8.h,),
                                    // Diponegoro University / 2011 - 2019
                                    Padding(
                                      padding:  EdgeInsets.only(left: 24.w),
                                      child: Text(
                                          "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Id massa sagittis nulla dolor vitae risus libero blandit.",
                                          style:  TextStyle(
                                              color:  grey_aaaaaa,
                                              fontFamily: helveticaNeueNeue_medium,
                                              fontStyle:  FontStyle.normal,
                                              fontSize: 15.sp
                                          ),
                                          textAlign: TextAlign.left
                                      ),
                                    )
                                  ],
                                ),
                              ),
                            ),

                            SizedBox(height: 16.h,),

                            Container(
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(4.r),
                                  color: white_ffffff,
                                  border: Border.all(
                                      width: 1,
                                      color: light_grey_f2f2f2
                                  )

                              ),
                              child: Padding(
                                padding: const EdgeInsets.all(16.0),
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Row(
                                      children: [
                                        SvgPicture.asset(question_icon,width: 16.w,height: 16.h,),
                                        SizedBox(width: 8.w,),
                                        Expanded(
                                            flex: 1,
                                            child: // EDUCATION
                                            Text(
                                                "WHAT SHOULD THE WORLD KNOW ABOUT YOU ?",
                                                style:  TextStyle(
                                                    color:  black_121212,
                                                    fontWeight: FontWeight.w900,
                                                    fontFamily: "NeueHelvetica",
                                                    fontStyle:  FontStyle.normal,
                                                    fontSize: 12.sp
                                                ),
                                                textAlign: TextAlign.left
                                            )
                                        ),

                                        SvgPicture.asset(icon_edit_blue,width: 12.w,height: 12.w,)
                                      ],
                                    ),
                                    SizedBox(height: 8.h,),
                                    // Diponegoro University / 2011 - 2019
                                    Padding(
                                      padding:  EdgeInsets.only(left: 24.w),
                                      child: Text(
                                          "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Id massa sagittis nulla dolor vitae risus libero blandit.",
                                          style:  TextStyle(
                                              color:  grey_aaaaaa,
                                              fontFamily: helveticaNeueNeue_medium,
                                              fontStyle:  FontStyle.normal,
                                              fontSize: 15.sp
                                          ),
                                          textAlign: TextAlign.left
                                      ),
                                    )
                                  ],
                                ),
                              ),
                            ),


                            SizedBox(height: 16.h,),

                            Container(
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(4.r),
                                  color: white_ffffff,
                                  border: Border.all(
                                      width: 1,
                                      color: light_grey_f2f2f2
                                  )

                              ),
                              child: Padding(
                                padding: const EdgeInsets.all(16.0),
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Row(
                                      children: [
                                        SvgPicture.asset(question_icon,width: 16.w,height: 16.h,),
                                        SizedBox(width: 8.w,),
                                        Expanded(
                                            flex: 1,
                                            child: // EDUCATION
                                            Text(
                                                "WHAT ARE YOU WORKING ON RIGHT NOW ?",
                                                style:  TextStyle(
                                                    color:  black_121212,
                                                    fontWeight: FontWeight.w900,
                                                    fontFamily: "NeueHelvetica",
                                                    fontStyle:  FontStyle.normal,
                                                    fontSize: 12.sp
                                                ),
                                                textAlign: TextAlign.left
                                            )
                                        ),

                                        SvgPicture.asset(icon_edit_blue,width: 12.w,height: 12.w,)
                                      ],
                                    ),
                                    SizedBox(height: 8.h,),
                                    // Diponegoro University / 2011 - 2019
                                    Padding(
                                      padding:  EdgeInsets.only(left: 24.w),
                                      child: Text(
                                          "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Id massa sagittis nulla dolor vitae risus libero blandit.",
                                          style:  TextStyle(
                                              color:  grey_aaaaaa,
                                              fontFamily: helveticaNeueNeue_medium,
                                              fontStyle:  FontStyle.normal,
                                              fontSize: 15.sp
                                          ),
                                          textAlign: TextAlign.left
                                      ),
                                    )
                                  ],
                                ),
                              ),
                            ),

                            SizedBox(height: 16.h,),

                            Container(
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(4.r),
                                  color: white_ffffff,
                                  border: Border.all(
                                      width: 1,
                                      color: light_grey_f2f2f2
                                  )

                              ),
                              child: Padding(
                                padding: const EdgeInsets.all(16.0),
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Row(
                                      children: [
                                        SvgPicture.asset(question_icon,width: 16.w,height: 16.h,),
                                        SizedBox(width: 8.w,),
                                        Expanded(
                                            flex: 1,
                                            child: // EDUCATION
                                            Text(
                                                "Additional Questions",
                                                style:  TextStyle(
                                                    color:  black_121212,
                                                    fontWeight: FontWeight.w900,
                                                    fontFamily: "NeueHelvetica",
                                                    fontStyle:  FontStyle.normal,
                                                    fontSize: 12.sp
                                                ),
                                                textAlign: TextAlign.left
                                            )
                                        ),

                                        SvgPicture.asset(icon_edit_blue,width: 12.w,height: 12.w,)
                                      ],
                                    ),
                                    SizedBox(height: 8.h,),
                                    // Diponegoro University / 2011 - 2019
                                    Padding(
                                      padding:  EdgeInsets.only(left: 24.w),
                                      child: Text(
                                          "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Id massa sagittis nulla dolor vitae risus libero blandit.",
                                          style:  TextStyle(
                                              color:  grey_aaaaaa,
                                              fontFamily: helveticaNeueNeue_medium,
                                              fontStyle:  FontStyle.normal,
                                              fontSize: 15.sp
                                          ),
                                          textAlign: TextAlign.left
                                      ),
                                    )
                                  ],
                                ),
                              ),
                            ),

                            SizedBox(height: 16.h,),

                            BlackButton("Save", white_ffffff, () { })

                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),

            ],
          ),
        ));
  }
}
