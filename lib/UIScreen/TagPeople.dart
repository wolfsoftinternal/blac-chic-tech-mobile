import 'package:blackchecktech/Layout/ToolbarCreatePost.dart';
import 'package:blackchecktech/Screens/Authentication/signup/model/TagPeopleModel.dart';
import 'package:blackchecktech/Styles/my_colors.dart';
import 'package:blackchecktech/Styles/my_icons.dart';
import 'package:blackchecktech/Utilities/Constant.dart';
import 'package:blackchecktech/Widget/search_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/src/size_extension.dart';
import 'package:flutter_svg/flutter_svg.dart';


class TagPeople extends StatefulWidget {
  const TagPeople({Key? key}) : super(key: key);

  @override
  _TagPeopleState createState() => _TagPeopleState();
}

class _TagPeopleState extends State<TagPeople> {

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

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
          backgroundColor: Colors.white,
          appBar: ToolbarCreatPost(context,"TAG PEOPLE","DONE"),
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
                    ),

                  ],
                ),

                Padding(
                  padding:  const EdgeInsets.all(24.0),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [

                      const SearchBarTag(
                        placeholder: 'Search people ...',
                      ),

                      SizedBox(height: 24.h,),
                      
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
          ),
        ));
  }
}
