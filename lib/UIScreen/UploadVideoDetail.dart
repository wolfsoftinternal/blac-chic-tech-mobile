import 'package:blackchecktech/Layout/BlackButton.dart';
import 'package:blackchecktech/Layout/ToolbarLocation.dart';
import 'package:blackchecktech/Screens/Authentication/signup/model/TagPeopleModel.dart';
import 'package:blackchecktech/Styles/my_colors.dart';
import 'package:blackchecktech/Styles/my_icons.dart';
import 'package:blackchecktech/Utilities/Constant.dart';
import 'package:blackchecktech/Utilities/TextfieldUtility.dart';
import 'package:blackchecktech/Widget/SpinnerDecorationBorder.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/src/size_extension.dart';
import 'package:flutter_svg/flutter_svg.dart';

class UploadVideoDetail extends StatefulWidget {
  const UploadVideoDetail({Key? key}) : super(key: key);

  @override
  _UploadVideoDetailState createState() => _UploadVideoDetailState();
}

class _UploadVideoDetailState extends State<UploadVideoDetail> {
  var emailTextController = TextEditingController();

  /*Topic Spinner Code is here*/

  List<DropdownMenuItem<String>> get dropdownItems{
    List<DropdownMenuItem<String>> menuItems = [
      const DropdownMenuItem(child: Text("USA",style: TextStyle(
          fontSize: 14,fontFamily: helveticaNeueNeue_medium,color: black_121212)),value: "USA"),
      const DropdownMenuItem(child: Text("Canada",style: TextStyle(
          fontSize: 14,fontFamily: helveticaNeueNeue_medium,color: black_121212)),value: "Canada"),
      const DropdownMenuItem(child: Text("Brazil",style: TextStyle(
          fontSize: 14,fontFamily: helveticaNeueNeue_medium,color: black_121212)),value: "Brazil"),
      const DropdownMenuItem(child: Text("England",style: TextStyle(
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

  List<TagPeopleModel> onDealsModel = [];
  List<TagPeopleModel> selectedList = [];

  @override
  void initState() {
    onDealsModel.clear();
    onDealsModel.add( TagPeopleModel( "assets/images/img_girl.png","claireroman"));
    onDealsModel.add( TagPeopleModel( "assets/images/img_girl.png","tokyoguinere"));
    onDealsModel.add( TagPeopleModel(  "assets/images/img_girl.png","naidafortes"));
    onDealsModel.add( TagPeopleModel( "assets/images/img_girl.png","tokyoguinere"));
    super.initState();
  }


  /*Speaker bottom sheet*/
  void displayRecurringOrderBottomSheet(BuildContext context) {
    showModalBottomSheet(
        isScrollControlled: true,
        backgroundColor: Colors.transparent,
        context: context,
        builder: (ctx) {
          return Container(
            decoration: const BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(30.0),
                    topRight: Radius.circular(30.0))),
            child: SingleChildScrollView(
              child: Wrap(
                children: [
                  StatefulBuilder(
                      builder: (BuildContext context, StateSetter setState) {
                        return
                              Container(
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: <Widget>[
                                    const SizedBox(
                                      height: 15,
                                    ),

                                    // Rectangle 1329
                                    Align(
                                      alignment: Alignment.topCenter,
                                      child: Opacity(
                                        opacity: 0.4000000059604645,
                                        child: Container(
                                            width: 48,
                                            height: 4,
                                            decoration: const BoxDecoration(
                                                borderRadius: BorderRadius.all(
                                                    Radius.circular(4)),
                                                color: Color(
                                                    0xff96a6a3))),
                                      ),
                                    ),

                                    SizedBox(
                                      height: 24.h,
                                    ),



                                    // SPEAKERS
                                    const Center(
                                      child: Text(
                                          "SPEAKERS",
                                          style: TextStyle(
                                              color:  Color(0xff121212),
                                              fontWeight: FontWeight.w900,
                                              fontFamily: "NeueHelvetica",
                                              fontStyle:  FontStyle.normal,
                                              fontSize: 16.0
                                          ),
                                          textAlign: TextAlign.left
                                      ),
                                    ),
                                    SizedBox(
                                      height: 24.h,
                                    ),

                                    const Divider(
                                      thickness: 1,
                                      height: 1,
                                      color: Color(0xfff4f6f6),
                                    ),


                                    
                                    Padding(
                                      padding: const EdgeInsets.all(24.0),
                                      child: Column(
                                        mainAxisAlignment: MainAxisAlignment.start,
                                        crossAxisAlignment: CrossAxisAlignment.start,
                                        children: [

                                       //   SearchBarTag(placeholder: "Search people"),

                                          SizedBox(
                                            height: 24.h,
                                          ),


                                          ListView.builder(
                                            primary: false,
                                            shrinkWrap: true,
                                            padding: const EdgeInsets.all(0),
                                            itemCount: onDealsModel.length,
                                            itemBuilder: (context, i) => GestureDetector(
                                              onTap: () {
                                                setState(() {
                                                  if(selectedList.contains(onDealsModel[i])){
                                                    selectedList.remove(onDealsModel[i]);
                                                  }
                                                  else{
                                                    selectedList.add(onDealsModel[i]);
                                                  }
                                                },

                                                );
                                                print(selectedList.length);
                                                print(onDealsModel.length);
                                              },
                                              child: Padding(
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
                                                          child: Image.asset(onDealsModel[i].image,width: 40.w,height: 40.h,fit: BoxFit.cover,)),
                                                      SizedBox(width: 16.w,),
                                                      Expanded(
                                                        flex: 1,
                                                        child: Column(
                                                          mainAxisAlignment: MainAxisAlignment.start,
                                                          crossAxisAlignment: CrossAxisAlignment.start,
                                                          children: [
                                                            // claireroman
                                                            Text(
                                                                onDealsModel[i].title,
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
                                                                    fontWeight: FontWeight.w700,
                                                                    fontFamily: helveticaNeueNeue_medium,
                                                                    fontStyle:  FontStyle.normal,
                                                                    fontSize: 14.sp
                                                                ),
                                                                textAlign: TextAlign.left
                                                            )
                                                          ],
                                                        ),
                                                      ),
                                                      SvgPicture.asset(selectedList.contains(onDealsModel[i]) ?orange_tick_icon:icon_next_arrow,width: 25.w,height: 25.h,)

                                                    ],
                                                  ),
                                                ),
                                              ),
                                            ),
                                          )
                                        ],
                                      ),
                                    ),



                                  ],
                                ),
                              );

                      }),
                ],
              ),
            ),
          );
        });
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
          resizeToAvoidBottomInset: false,
      backgroundColor: Colors.white,
      appBar: ToolbarLocation(
          context, "UPLOAD VIDEO", "assets/images/location_icon.png"),
      body: Stack(
        alignment: Alignment.bottomCenter,
        children: [
          Expanded(
            flex: 1,
            child: SingleChildScrollView(
              child: Padding(
                padding: EdgeInsets.only(
                    left: 24.w, right: 24.w, top: 40.h, bottom: 24.h),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // UPLOAD VIDEO
                    Text("VIDEO TITLE",
                        style: TextStyle(
                            color: black_121212,
                            fontWeight: FontWeight.w900,
                            fontFamily: "Roboto",
                            fontStyle: FontStyle.normal,
                            fontSize: 12.sp),
                        textAlign: TextAlign.left),

                    SizedBox(
                      height: 14.h,
                    ),

                    setTextFieldHelveticaMediumBorder(
                      emailTextController,
                      "Type here...",
                      false,
                      TextInputType.text,
                      false,
                      "",
                      TextInputAction.next,
                      () => {
                        // on Chnages
                      },
                    ),

                    SizedBox(
                      height: 24.h,
                    ),


                    Text(
                        "TOPIC",
                        style:  TextStyle(
                            color:   black_121212,
                            fontWeight: FontWeight.w900,
                            fontFamily: "Roboto",
                            fontStyle:  FontStyle.normal,
                            fontSize: 12.sp
                        ),
                        textAlign: TextAlign.left
                    ),

                    SizedBox(
                      height: 14.h,
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
                                  "Select Topic",
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

                    SizedBox(
                      height: 24.h,
                    ),


                    Text(
                        "LANGUAGE",
                        style:  TextStyle(
                            color:   black_121212,
                            fontWeight: FontWeight.w900,
                            fontFamily: "Roboto",
                            fontStyle:  FontStyle.normal,
                            fontSize: 12.sp
                        ),
                        textAlign: TextAlign.left
                    ),

                    SizedBox(
                      height: 14.h,
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
                              value: selectedValuelang,
                              hint: Text(
                                  "Select Language",
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
                      height: 24.h,
                    ),


                    Text(
                        "EMBED CODE",
                        style:  TextStyle(
                            color:   black_121212,
                            fontWeight: FontWeight.w900,
                            fontFamily: "Roboto",
                            fontStyle:  FontStyle.normal,
                            fontSize: 12.sp
                        ),
                        textAlign: TextAlign.left
                    ),

                    SizedBox(
                      height: 14.h,
                    ),

                    Container(
                      decoration: BoxDecoration(
                        color: const Color(0x66f5f5f5),
                        borderRadius: BorderRadius.circular(4),
                        border: Border.all(
                          width: 1,
                          color: grey_aaaaaa
                        ),
                      ),
                      child: // <iframe width="560" height="315" src="https://www.youtube.com/embed/yfwNi4aK1_w" title="YouTube vide
                      const Padding(
                        padding: EdgeInsets.all(16.0),
                        child: Text(
                            "<iframe width=560 height=315 src=https:www.youtube.com/embed/yfwNi4aK1_w title=YouTube video player frameborder=0 allow=accelerometer autoplay clipboard-write encrypted-media; gyroscope; picture-in-picture allowfullscreen></iframe>",
                        style: TextStyle(
                        color:  Color(0xff121212),
                          fontWeight: FontWeight.w500,
                          fontFamily: "NeueHelvetica",
                          fontStyle:  FontStyle.normal,
                          fontSize: 11.0
                    ),
                  textAlign: TextAlign.left
              ),
                      ),
                    ),

                    SizedBox(
                      height: 24.h,
                    ),


                    Text(
                        "DESCRIPTION",
                        style:  TextStyle(
                            color:   black_121212,
                            fontWeight: FontWeight.w900,
                            fontFamily: "Roboto",
                            fontStyle:  FontStyle.normal,
                            fontSize: 12.sp
                        ),
                        textAlign: TextAlign.left
                    ),

                    SizedBox(
                      height: 14.h,
                    ),

                    Container(
                      decoration: SpinnerDecorationBorder,
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
                                  hintText: 'Write a Description...',
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


                    SizedBox(
                      height: 24.h,
                    ),


                    Text(
                        "RELATED TAGS",
                        style:  TextStyle(
                            color:   black_121212,
                            fontWeight: FontWeight.w900,
                            fontFamily: "Roboto",
                            fontStyle:  FontStyle.normal,
                            fontSize: 12.sp
                        ),
                        textAlign: TextAlign.left
                    ),

                    SizedBox(
                      height: 14.h,
                    ),


                    Container(
                      decoration: SpinnerDecorationBorder,
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [

                            Container(
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(40),
                                color: const Color(0xffebebeb),
                              ),
                              child: // Frame 8618

                              Padding(
                                padding: const EdgeInsets.only(left: 16,right: 16,top: 8,bottom: 8),
                                child: Text(
                                    "Tag name",
                                    style:  TextStyle(
                                        color:   const Color(0xff3f3f3f),
                                        fontWeight: FontWeight.w700,
                                        fontFamily: "Inter",
                                        fontStyle:  FontStyle.normal,
                                        fontSize: 12.sp
                                    ),
                                    textAlign: TextAlign.left
                                ),
                              ),
                            ),


                            // ADD TAG
                            Text(
                                "ADD TAG",
                                style:  TextStyle(
                                    color:   const Color(0xffff8819),
                                    fontWeight: FontWeight.w500,
                                    fontFamily: "Inter",
                                    fontStyle:  FontStyle.normal,
                                    fontSize: 12.sp
                                ),
                                textAlign: TextAlign.left
                            )
                          ],
                        ),
                      ),
                    ),


                    SizedBox(
                      height: 24.h,
                    ),


                    GestureDetector(
                      onTap: (){
                        setState(() {
                          displayRecurringOrderBottomSheet(context);
                        });
                      },
                      child: Container(
                        color: white_ffffff,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                                "TAG SPEAKERS",
                                style:  TextStyle(
                                    color:   black_121212,
                                    fontWeight: FontWeight.w900,
                                    fontFamily: "Roboto",
                                    fontStyle:  FontStyle.normal,
                                    fontSize: 12.sp
                                ),
                                textAlign: TextAlign.left
                            ),
                            const Icon(Icons.add,size: 15,color: orange_ff881a,)
                          ],
                        ),
                      ),
                    ),

                    SizedBox(
                      height: 14.h,
                    ),

                    Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(40),
                        color: const Color(0xffebebeb),
                      ),
                      child: // Frame 8618

                      Padding(
                        padding: const EdgeInsets.only(left: 10,right: 10,top: 8,bottom: 8),
                        child: Row(
                          mainAxisSize: MainAxisSize.min,
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            ClipRRect(
                                borderRadius: BorderRadius.circular(50),
                                child: Image.asset("assets/images/img_girl.png",width: 17.w,height: 17.h,fit: BoxFit.cover,)),
                            SizedBox(width: 5.w,),
                            // @HennaBack
                            Text(
                                "@HennaBack",
                                style:  TextStyle(
                                    color:  black_121212,
                                    fontWeight: FontWeight.w700,
                                    fontFamily: "Roboto",
                                    fontStyle:  FontStyle.normal,
                                    fontSize: 11.sp
                                ),
                                textAlign: TextAlign.left
                            ),
                            SizedBox(width: 5.w,),
                            const Icon
                              (Icons.cancel_outlined,size: 12,)
                          ],
                        ),
                      ),
                    ),


                    SizedBox(height: 100.h,),







                  ],
                ),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(24.0),
            child: BlackButton("Next", Colors.white, () {}),
          )
        ],
      ),
    ));
  }


}
