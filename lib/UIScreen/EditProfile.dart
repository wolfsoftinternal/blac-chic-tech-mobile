import 'package:blackchecktech/Layout/BlackButton.dart';
import 'package:blackchecktech/Layout/InputTextLayoutDemo.dart';
import 'package:blackchecktech/Layout/ToolbarLocation.dart';
import 'package:blackchecktech/Styles/my_colors.dart';
import 'package:blackchecktech/Styles/my_icons.dart';
import 'package:blackchecktech/Utilities/Constant.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/src/size_extension.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../Styles/my_strings.dart';


class EditProfile extends StatefulWidget {
  const EditProfile({Key? key}) : super(key: key);

  @override
  _EditProfileState createState() => _EditProfileState();
}

class _EditProfileState extends State<EditProfile> {

  final _firstnameController = TextEditingController();
  final _lastnameController = TextEditingController();
  final _usernameController = TextEditingController();
  final _emailController = TextEditingController();

  String? dropdownValue;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
          backgroundColor: Colors.white,
          appBar: ToolbarLocation(context,"Edit Profile VIDEO","assets/images/location_icon.png"),
          body: Column(
            children: [
              Expanded(
                flex: 1,
                child: SingleChildScrollView(
                  child: Padding(
                    padding:  EdgeInsets.only(left: 24.w,right: 24.w,top: 40.h,bottom: 24.h),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [

                        Center(
                          child: Stack(
                            alignment:Alignment.bottomRight,
                            children: [
                              SizedBox(

                                child: Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Container(
                                      decoration: const BoxDecoration(
                                        boxShadow: [
                                          BoxShadow(
                                            color: Color(0xffc4c4c4),
                                            spreadRadius: 2,
                                            blurRadius: 15,
                                            offset: Offset(-2, 7),
                                          ),
                                        ],
                                      ),
                                      child: Image.asset(setting_girl_img,width: 105.w,height: 143.h,fit: BoxFit.fill,)),
                                ),
                              ),
                              SvgPicture.asset(icon_edit_profile,width: 32.w,height: 32.h,)
                            ],
                          ),
                        ),

                        SizedBox(height: 46.h,),
                        Row(
                          children: [
                            Expanded(
                                child: InputTextLayoutDemo(
                                    str_first_name,
                                    _firstnameController,
                                    false,
                                    TextInputAction.next,
                                    TextInputType.text, false,
                                )),
                            SizedBox(
                              width: 8.w,
                            ),
                            Expanded(
                                child: InputTextLayoutDemo(
                                    str_last_name,
                                    _lastnameController,
                                    false,
                                    TextInputAction.next,
                                    TextInputType.text, false)),
                          ],
                        ),
                        SizedBox(height: 16.h,),
                        InputTextLayoutDemo(
                            str_username,
                            _usernameController,
                            false,
                            TextInputAction.next,
                            TextInputType.text, false),
                        SizedBox(height: 16.h,),
                        InputTextLayoutDemo(
                            str_email,
                            _emailController,
                            false,
                            TextInputAction.next,
                            TextInputType.emailAddress, false),
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
                                child: InputTextLayoutDemo(
                                    "Date of Birth",
                                    _lastnameController,
                                    false,
                                    TextInputAction.next,
                                    TextInputType.text, false)),
                          ],
                        ),

                        SizedBox(height: 32.h,),
                        Row(
                          children: [

                            Expanded(
                              flex: 1,
                              child: Container(
                                width: double.infinity,
                                height: 1,
                                decoration: const BoxDecoration(
                                    color:  view_line_f4f6f6
                                )
                            ),),
                            SizedBox(width: 15.w,),
                            // Social media account
                            Text(
                                "Social media account",
                                style:  TextStyle(
                                    color:  const Color(0xff3f3f3f),
                                    fontWeight: FontWeight.w500,
                                    fontFamily: "NeueHelvetica",
                                    fontStyle:  FontStyle.normal,
                                    fontSize: 14.sp
                                ),
                                textAlign: TextAlign.left
                            ),
                            SizedBox(width: 15.w,),
                            Expanded(
                              flex: 1,
                              child: Container(
                                  width: double.infinity,
                                  height: 1,
                                  decoration: const BoxDecoration(
                                      color:  view_line_f4f6f6
                                  )
                              ),)
                          ],
                        ),

                        SizedBox(height: 24.h,),

                        Container(
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(4),
                              color: white_ffffff,
                              border: Border.all(
                                  width: 1,
                                  color: const Color(0xfff2f2f2)
                              )
                          ),
                          child: Padding(
                            padding:  EdgeInsets.only(left: 16.w,right: 16.w,top: 12.h,bottom: 12.h),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                SvgPicture.asset(icon_linkedin_svg,width: 24.w,height: 24.h,),
                                SizedBox(width: 16.w,),
                                // www.linkedin.com/fadeogunro
                                Expanded(
                                  flex: 1,
                                  child: Text(
                                      "www.linkedin.com/fadeogunro",
                                      style:  TextStyle(
                                          color:  black_121212,
                                          fontWeight: FontWeight.w500,
                                          fontFamily: "NeueHelvetica",
                                          fontStyle:  FontStyle.normal,
                                          fontSize: 14.sp
                                      ),
                                      textAlign: TextAlign.left
                                  ),
                                ),
                                SvgPicture.asset(icon_edit_blue,width: 12.w,height: 12.w,)
                              ],
                            ),
                          ),
                        ),

                        SizedBox(height: 16.h,),

                        Container(
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(4),
                            color: white_ffffff,
                            border: Border.all(
                              width: 1,
                              color: const Color(0xfff2f2f2)
                            )
                          ),
                          child: Padding(
                            padding:  EdgeInsets.only(left: 16.w,right: 16.w,top: 12.h,bottom: 12.h),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                SvgPicture.asset(icon_twitter_svg,width: 24.w,height: 24.h,),
                                SizedBox(width: 16.w,),
                                // www.linkedin.com/fadeogunro
                                Expanded(
                                  flex: 1,
                                  child: Text(
                                      "www.twitter.com/fadeogunro",
                                      style:  TextStyle(
                                          color:  black_121212,
                                          fontWeight: FontWeight.w500,
                                          fontFamily: "NeueHelvetica",
                                          fontStyle:  FontStyle.normal,
                                          fontSize: 14.sp
                                      ),
                                      textAlign: TextAlign.left
                                  ),
                                ),
                                SvgPicture.asset(icon_edit_blue,width: 12.w,height: 12.w,)
                              ],
                            ),
                          ),
                        ),

                        SizedBox(height: 16.h,),

                        Container(
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(4),
                              color: white_ffffff,
                              border: Border.all(
                                  width: 1,
                                  color: const Color(0xfff2f2f2)
                              )
                          ),
                          child: Padding(
                            padding:  EdgeInsets.only(left: 16.w,right: 16.w,top: 12.h,bottom: 12.h),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Image.asset(icon_instagram,width: 24.w,height: 24.h,),
                                SizedBox(width: 16.w,),
                                // www.linkedin.com/fadeogunro
                                Expanded(
                                  flex: 1,
                                  child: Text(
                                      "www.instagram.com/fadeogunro",
                                      style:  TextStyle(
                                          color:  black_121212,
                                          fontWeight: FontWeight.w500,
                                          fontFamily: "NeueHelvetica",
                                          fontStyle:  FontStyle.normal,
                                          fontSize: 14.sp
                                      ),
                                      textAlign: TextAlign.left
                                  ),
                                ),
                                SvgPicture.asset(icon_edit_blue,width: 12.w,height: 12.w,)
                              ],
                            ),
                          ),
                        )
                      ],
                    ),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(24.0),
                child: BlackButton("Save Profile", Colors.white, (){}),
              )
            ],
          ),
        ));
  }
}
