import 'package:blackchecktech/Styles/my_colors.dart';
import 'package:blackchecktech/Styles/my_icons.dart';
import 'package:blackchecktech/Utilities/Constant.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/src/size_extension.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../Model/SpeakersVideoModel.dart';
import '../Widget/SpinnerDecorationBorder.dart';
import '../Widget/search_bar_demo.dart';


class VideoListBct extends StatefulWidget {
  const VideoListBct({Key? key}) : super(key: key);

  @override
  _VideoListBctState createState() => _VideoListBctState();
}

class _VideoListBctState extends State<VideoListBct> {

  List<SpeakersVideoModel> speakerVideoList = [
    SpeakersVideoModel(photo_user, '3:56', "4 steps to hiring fairly and supporting criminal justice...",
        "Steve Roshein","Posted Dec 2021"),
    SpeakersVideoModel(photo_user, '3:56', "4 steps to hiring fairly and supporting criminal justice...",
        "Steve Roshein","Posted Dec 2021"),
    SpeakersVideoModel(photo_user, '3:56', "4 steps to hiring fairly and supporting criminal justice...",
        "Steve Roshein","Posted Dec 2021"),
    SpeakersVideoModel(photo_user, '3:56', "4 steps to hiring fairly and supporting criminal justice...",
        "Steve Roshein","Posted Dec 2021"),
    SpeakersVideoModel(photo_user, '3:56', "4 steps to hiring fairly and supporting criminal justice...",
        "Steve Roshein","Posted Dec 2021"),
    SpeakersVideoModel(photo_user, '3:56', "4 steps to hiring fairly and supporting criminal justice...",
        "Steve Roshein","Posted Dec 2021"),
  ];

  /*Topic Spinner Code is here*/

  List<DropdownMenuItem<String>> get dropdownItems{
    List<DropdownMenuItem<String>> menuItems = [
      const DropdownMenuItem(child: Text("Technology",style: TextStyle(
          fontSize: 14,fontFamily: helveticaNeueNeue_medium,color: black_121212)),value: "USA"),
      const DropdownMenuItem(child: Text("Entertainment",style: TextStyle(
          fontSize: 14,fontFamily: helveticaNeueNeue_medium,color: black_121212)),value: "Canada"),
      const DropdownMenuItem(child: Text("Design",style: TextStyle(
          fontSize: 14,fontFamily: helveticaNeueNeue_medium,color: black_121212)),value: "Brazil"),
      const DropdownMenuItem(child: Text("Business",style: TextStyle(
          fontSize: 14,fontFamily: helveticaNeueNeue_medium,color: black_121212)),value: "England"),
    ];
    return menuItems;
  }

  String? selectedValue;


  /*Language Spinner Code is here*/

  List<DropdownMenuItem<String>> get dropdownItemslang{
    List<DropdownMenuItem<String>> menuItems = [
      const DropdownMenuItem(child: Text("English",style: TextStyle(
          fontSize: 14,fontFamily: helveticaNeueNeue_medium,color: black_121212)),value: "English"),
      const DropdownMenuItem(child: Text("Hindi",style: TextStyle(
          fontSize: 14,fontFamily: helveticaNeueNeue_medium,color: black_121212)),value: "Hindi"),
      const DropdownMenuItem(child: Text("Gujarati",style: TextStyle(
          fontSize: 14,fontFamily: helveticaNeueNeue_medium,color: black_121212)),value: "Gujarati"),
      const DropdownMenuItem(child: Text("Marathi",style: TextStyle(
          fontSize: 14,fontFamily: helveticaNeueNeue_medium,color: black_121212)),value: "Marathi"),
    ];
    return menuItems;
  }

  String? selectedValuelang;

  bool isLayoutFirst = false;
  bool isTextChange = false;


  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
          backgroundColor: white_ffffff,
          body: SingleChildScrollView(
            child: Column(
              children: [
               Container(
                 color: light_grey_f2f2f2,
                 child: Column(
                   children: [
                     Padding(
                       padding:  EdgeInsets.only(left: 24.w,top: 33.h,right: 24.w),
                       child: Stack(
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
                                       offset: const Offset(1, 4), // changes position of shadow
                                     ),
                                   ],
                                 ),
                                 child: Padding(
                                   padding:  EdgeInsets.all(12.0.r),
                                   child: SvgPicture.asset(icon_back_black_arrow,width: 24.w,height: 24.w,),
                                 ),
                               ),
                             ),
                           ),
                           Center(child: Image.asset(bct_logo,width: 58.w,height: 58.h,)),

                         ],
                       ),
                     ),
                     SizedBox(height: 54.h,),

                     Text(
                         "3,800+ Life & Tech Talks \nto help you navigate.",
                         style:  TextStyle(
                             color:  black_121212,
                             fontWeight: FontWeight.w900,
                             fontFamily: "NeueHelvetica",
                             fontStyle:  FontStyle.normal,
                             fontSize: 24.sp
                         ),
                         textAlign: TextAlign.center
                     ),

                     SizedBox(height: 16.h,),

                     // Find the right one.
                     Text(
                         "Find the right one.",
                         style:  TextStyle(
                             color:  grey_aaaaaa,
                             fontWeight: FontWeight.w500,
                             fontFamily: "NeueHelvetica",
                             fontStyle:  FontStyle.normal,
                             fontSize: 14.sp
                         ),
                         textAlign: TextAlign.left
                     ),

                     SizedBox(height: 30.h,),

                     Padding(
                       padding:  EdgeInsets.only(left: 24.w,right: 24.w),
                       child: Column(
                         mainAxisAlignment: MainAxisAlignment.start,
                         crossAxisAlignment: CrossAxisAlignment.start,
                         children: [
                           const SearchBarDemo(
                             placeholder: "Search Talks...",
                             fillcolor: white_ffffff,
                           ),
                           SizedBox(height: 16.h,),

                           Container(
                             decoration: BoxDecoration(
                                 boxShadow: [
                                   BoxShadow(
                                     color: const Color(0x17747796).withOpacity(0.07),
                                     spreadRadius: 10,
                                     blurRadius: 5,
                                     offset: const Offset(0, 10), // changes position of shadow
                                   ),
                                 ]
                             ),
                             child: SizedBox(
                               width: double.infinity,
                               //height: HeightData.fiftyfive,
                               child: Container(
                                 decoration: BoxDecoration(
                                   borderRadius: BorderRadius.circular(4.0),
                                   gradient: const LinearGradient(
                                     begin: Alignment.topCenter,
                                     end: Alignment.bottomCenter,
                                     colors: [ Color(0xff1c2535),  Color(0xff04080f)],
                                     stops: [0.0, 1.0],
                                   ),
                                 ),
                                 child: ElevatedButton(
                                     child: //
                                     Stack(
                                       alignment: Alignment.centerRight,
                                       children: [
                                         Row(
                                           mainAxisAlignment: MainAxisAlignment.center,
                                           children: [
                                             // setHelveticaBoldCenter(
                                             //     inputText,
                                             //     16,
                                             //     textColor,
                                             //     FontWeight.normal,
                                             //     FontStyle.normal,
                                             //     TextAlign.center),

                                             Text("Find a Speaker",
                                               style: TextStyle(
                                                   fontFamily: helvetica_neu_bold,
                                                   fontSize: 14.sp
                                               ),
                                             ),



                                           ],
                                         ),
                                         Padding(
                                           padding:  EdgeInsets.only(right: 16.w),
                                           child: SvgPicture.asset(icon_next_arrow,width: 16.r,height: 16.r,),
                                         )
                                       ],
                                     ), // Button
                                     onPressed: (){},
                                     style: ElevatedButton.styleFrom(
                                       primary: Colors.transparent,
                                       onSurface: Colors.transparent,
                                       shadowColor: Colors.transparent,
                                       elevation: 0,
                                       padding:
                                       const EdgeInsets.symmetric(horizontal: 0, vertical: 18),
                                       shape: RoundedRectangleBorder(
                                         borderRadius: BorderRadius.circular(4),
                                         side: const BorderSide(color: black_121212, width: 0),
                                       ),
                                     )),
                               ),
                             ),
                           )

                         ],
                       ),
                     ),

                     SizedBox(height: 24.h,),
                   ],
                 ),
               ),


                Container(
                    width: double.infinity,
                    height: 1,
                    decoration: const BoxDecoration(
                        color:  Color(0xffebebeb)
                    )
                ),

                Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        GestureDetector(
                          onTap: (){
                            setState(() {
                              if(isTextChange = !isTextChange){
                                isLayoutFirst=true;
                              }else {
                                isLayoutFirst=false;
                              }
                            }
                            );
                          },
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              SvgPicture.asset(icon_filter_orange,width: 24.w,height: 24.h,),
                              SizedBox(width: 10.w,),
                              // More filters
                              Text(
                                  isTextChange?"Close filters":"More filters",
                                  style:  TextStyle(
                                      fontWeight: FontWeight.w700,
                                      fontFamily: "Roboto",
                                      fontStyle:  FontStyle.normal,
                                      fontSize: 14.sp
                                  ),
                                  textAlign: TextAlign.left
                              )
                            ],
                          ),
                        ),

                        Container(
                            width: 1,
                            height: 48.h,
                            decoration: const BoxDecoration(
                                color:  Color(0xffebebeb)
                            )
                        ),

                        Row(
                          children: [
                            SvgPicture.asset(icon_play_list_orange,width: 24.w,height: 24.h,),
                            SizedBox(width: 10.w,),
                            // More filters
                            Text(
                                "My play list",
                                style:  TextStyle(
                                    fontWeight: FontWeight.w700,
                                    fontFamily: "Roboto",
                                    fontStyle:  FontStyle.normal,
                                    fontSize: 14.sp
                                ),
                                textAlign: TextAlign.left
                            )
                          ],
                        ),
                      ],
                    ),
                    Container(
                        width: double.infinity,
                        height: 1,
                        decoration: const BoxDecoration(
                            color:  Color(0xffebebeb)
                        ),

                    ),


                    Visibility(
                      visible:  isLayoutFirst ,
                      child: Padding(
                        padding:  EdgeInsets.only(left: 24.w,right: 24.w,top: 24.h,),
                        child: Column(
                          children: [
                            Container(
                              height: 50.h,
                              width: double.infinity,
                              decoration: SpinnerDecorationBorder,
                              child: DropdownButtonHideUnderline(
                                child: Padding(
                                  padding:  const EdgeInsets.only(left: 10,right: 10),
                                  child: DropdownButton(
                                    //  validator: (value) => value == null ? "Select a country" : null,
                                      dropdownColor: Colors.white,
                                      value: selectedValuelang,
                                      hint: Text(
                                          "Topic",
                                          style:  TextStyle(
                                              color:  grey_aaaaaa,
                                              fontWeight: FontWeight.w500,
                                              fontFamily: helveticaNeueNeue_medium,
                                              fontStyle:  FontStyle.normal,
                                              fontSize: 14.sp
                                          ),
                                          textAlign: TextAlign.left
                                      ),
                                      icon: SvgPicture.asset(icon_down_arrow_spinner,width: 12.w,height: 12.h,),
                                      onChanged: (String? newValue) {
                                        setState(() {
                                          selectedValuelang = newValue!;
                                        });
                                      },
                                      items: dropdownItemslang),
                                ),
                              ),
                            ),
                            SizedBox(
                              height: 12.h,
                            ),
                            Container(
                              height: 50.h,
                              width: double.infinity,
                              decoration: SpinnerDecorationBorder,
                              child: DropdownButtonHideUnderline(
                                child: Padding(
                                  padding:  const EdgeInsets.only(left: 10,right: 10),
                                  child: DropdownButton(
                                    //  validator: (value) => value == null ? "Select a country" : null,
                                      dropdownColor: Colors.white,
                                      value: selectedValue,
                                      hint: Text(
                                          "Language",
                                          style:  TextStyle(
                                              color:  grey_aaaaaa,
                                              fontWeight: FontWeight.w500,
                                              fontFamily: helveticaNeueNeue_medium,
                                              fontStyle:  FontStyle.normal,
                                              fontSize: 14.sp
                                          ),
                                          textAlign: TextAlign.left
                                      ),
                                      icon: SvgPicture.asset(icon_down_arrow_spinner,width: 12.w,height: 12.h,),
                                      onChanged: (String? newValue) {
                                        setState(() {
                                          selectedValue = newValue!;
                                        });
                                      },
                                      items: dropdownItems),
                                ),
                              ),
                            ),
                            SizedBox(height: 12.h,),
                            Row(
                              children: [

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
                                          "Apply Filter",
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
                                SizedBox(width: 15.w,),
                                Expanded(
                                  flex: 1,
                                  child: Container(
                                    height: 50.h,
                                    decoration: BoxDecoration(
                                      color: const Color(0xfff5f5f5),
                                      borderRadius: BorderRadius.circular(4.r),
                                    ),
                                    child: Center(
                                      child: Text(
                                          "Clear",
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

                              ],
                            )

                          ],
                        ),
                      ),
                    ),

                    Container(
                      margin: EdgeInsets.only(top: 24.h, left: 24.w, right: 24.w),
                      child: ListView.builder(
                          shrinkWrap: true,
                          primary: false,
                          itemCount: speakerVideoList.length,
                          padding: EdgeInsets.zero,
                          itemBuilder: (context, i) {
                            return Padding(
                              padding: EdgeInsets.only(bottom: 20.h),
                              child: SizedBox(
                                  width: double.infinity,
                                  child:Row(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      Stack(
                                        alignment: Alignment.bottomRight,
                                        children: [
                                          ClipRRect(
                                            borderRadius: BorderRadius.circular(4.r),
                                            child: Image.asset(speakerVideoList[i].imgVideo,height: 56.h,width:100.w,fit: BoxFit.fill,),
                                          ),
                                          Container(
                                            margin: EdgeInsets.only(right: 6.w,bottom: 6.h),
                                            padding: EdgeInsets.symmetric(vertical: 1.5.h,horizontal: 6.w),
                                            decoration: BoxDecoration(
                                              borderRadius: BorderRadius.circular(4),
                                              gradient: const LinearGradient(
                                                begin: Alignment.topCenter,
                                                end: Alignment.bottomCenter,
                                                colors: [
                                                  Color(0xff1c2535),
                                                  Color(0xff04080f)
                                                ],
                                                stops: [0.0, 5.0],
                                              ),
                                            ),
                                            child:Text(speakerVideoList[i].tvTime,style: TextStyle(
                                                fontSize: 11.sp,color: Colors.white,fontFamily: helveticaNeueNeue_medium),) ,
                                          ),

                                        ],
                                      ),

                                      Expanded(
                                        child: Container(
                                          margin: EdgeInsets.only(left: 16.w,right: 10.w),
                                          child: Column(
                                            mainAxisAlignment: MainAxisAlignment.start,
                                            crossAxisAlignment: CrossAxisAlignment.start,
                                            children: [
                                              SizedBox(height: 3.h,),

                                              Text(speakerVideoList[i].tvHeading,style: const TextStyle(
                                                  fontFamily: helvetica_neu_bold,color: black_121212,
                                                  fontSize: 14
                                              ),),
                                              SizedBox(height: 8.h,),
                                              Text(speakerVideoList[i].tvTitle,style: const TextStyle(
                                                  fontFamily: helveticaNeueNeue_medium,color: opcity_black_121212,
                                                  fontSize: 10),),
                                              SizedBox(height: 2.h,),
                                              Text(speakerVideoList[i].tvDate,style: const TextStyle(
                                                  fontFamily: helveticaNeueNeue_medium,color: opcity_black_121212,
                                                  fontSize: 8),),

                                            ],
                                          ),
                                        ),
                                      ),


                                    ],
                                  )),
                            );
                          }),
                    ),

                  ],
                ),




              ],
            ),
          ),
        ));
  }
}
