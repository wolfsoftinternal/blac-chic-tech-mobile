import 'package:blackchecktech/Layout/BlackButton.dart';
import 'package:blackchecktech/Layout/BlackNextButton.dart';
import 'package:blackchecktech/Layout/InputTextLayout.dart';
import 'package:blackchecktech/Layout/InputTextStatic.dart';
import 'package:blackchecktech/Layout/ToolbarBackOnly.dart';
import 'package:blackchecktech/Layout/ToolbarCreatePost.dart';
import 'package:blackchecktech/Layout/ToolbarLocation.dart';
import 'package:blackchecktech/Layout/ToolbarWithHeaderCenterTitle.dart';
import 'package:blackchecktech/Screens/Authentication/signup/model/TagPeopleModel.dart';
import 'package:blackchecktech/Screens/Home/BCConnect/controller/BCConnectController.dart';
import 'package:blackchecktech/Screens/Home/CreateVideo/controller/VideoController.dart';
import 'package:blackchecktech/Screens/Home/FeatureMenu/model/FeaturedListModel.dart';
import 'package:blackchecktech/Screens/Home/Profile/view/UserProfile.dart';
import 'package:blackchecktech/Styles/my_colors.dart';
import 'package:blackchecktech/Styles/my_icons.dart';
import 'package:blackchecktech/Utilities/Constant.dart';
import 'package:blackchecktech/Utilities/TextUtilities.dart';
import 'package:blackchecktech/Utils/internet_connection.dart';
import 'package:blackchecktech/Utils/pagination_utils.dart';
import 'package:blackchecktech/Widget/AddLocationView.dart';
import 'package:blackchecktech/Widget/EditTextDecoration.dart';
import 'package:blackchecktech/Widget/EditTextDecorationBorder.dart';
import 'package:blackchecktech/Widget/search_bar.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_html/shims/dart_ui_real.dart';
import 'package:flutter_screenutil/src/size_extension.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:iconly/iconly.dart';

import '../../../../Model/FollowFriendModel.dart';
import '../../../../Styles/my_strings.dart';
import '../../Profile/view/AdmireProfile.dart';
import '../controller/FeaturedController.dart';
import 'PastFeaturesScreen.dart';

class SearchFeaturesScreen extends StatefulWidget {

  const SearchFeaturesScreen({Key? key})
      : super(key: key);

  @override
  _SearchFeaturesScreenState createState() => _SearchFeaturesScreenState();
}

class _SearchFeaturesScreenState extends State<SearchFeaturesScreen> {

  FeaturedController featuredController = Get.put(FeaturedController());
  String? dropdownValue;

    List<FeaturedList> searchableFeatureList =  <FeaturedList>[];
  TextEditingController searchableText = TextEditingController();

  var _firstnameController = TextEditingController();

  // bool isFollow = true;
  // bool isFollowed = false;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    searchableFeatureList.addAll(featuredController.featuredList);
  }

  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
      systemNavigationBarColor: Colors.transparent, // navigation bar color
      statusBarColor: Colors.transparent, // status bar color
      statusBarIconBrightness: Brightness.light, // status bar icons' color
      systemNavigationBarIconBrightness: Brightness.light,
    ));
    return Scaffold(
      backgroundColor: white,
      resizeToAvoidBottomInset: false,
      body: Stack(
        children: [
          ImageFiltered(
            imageFilter: ImageFilter.blur(sigmaX: 30, sigmaY: 30),
            child: CachedNetworkImage(
                imageUrl: featuredController.featuredList[0].image??"",
                fit: BoxFit.cover,
                width: double.infinity,
                height: double.infinity,
                alignment: Alignment.center,
                progressIndicatorBuilder:
                    (context, url, downloadProgress) =>
                    SvgPicture.asset(
                      placeholder,
                      width: double.infinity,
                      height: double.infinity,
                      fit: BoxFit.cover,
                    ),
                errorWidget: (context, url, error) =>
                    SvgPicture.asset(
                      placeholder,
                      width: double.infinity,
                      height: double.infinity,
                      fit: BoxFit.cover,
                    ),
              ),
          ),
          Container(
            color: black.withOpacity(0.79),
            child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(
                    height: 55.h,
                  ),
                  Padding(
                    padding: EdgeInsets.only(right: 24.w),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        InkWell(
                          onTap: (){
                            Get.back();
                          },
                          child: Icon(Icons.close, color: white,)
                        ),
                      ],
                    ),
                  ),
                  // ToolbarWithHeaderCenterTitle('Features'),
                  SizedBox(
                    height: 25.h,
                  ),

                  Padding(
                    padding: EdgeInsets.only(left: 16.w, right: 16.w, bottom: 5.h),
                    child: TextField(
                      style: TextStyle(
                        fontFamily: helvetica_neu_bold,
                        fontSize: 18.sp,
                        color: white
                      ),
                      controller: searchableText,
                      autofocus: false,
                      cursorColor: orange_ff881a,
                      decoration: InputDecoration(
                        filled: false,
                        hintText: "Search..",
                        contentPadding: EdgeInsets.symmetric(horizontal: 10.w, vertical: 15.h),
                        prefixIcon: Padding(
                          padding: const EdgeInsets.only(bottom: 2.0),
                          child: Icon(
                            IconlyLight.search,
                            color: white,
                            size: 20.r,
                          ),
                        ),
                        hintStyle: TextStyle(
                          fontSize: 18.sp,
                          // fontWeight: FontWeight.w500,
                          fontFamily: helvetica_neu_bold,
                          color: white,
                        ),
                        border: OutlineInputBorder(borderSide: BorderSide.none),
                      ),
                      onChanged: (value) {
                        checkNet(context).then((value) {
                          searchableFeatureList.clear();
                          print('searchable text hahah ' + searchableText.text + " " + featuredController.featuredList[0].writer_name!);
                          for(int i=0; i<featuredController.featuredList.length-1; i++){

                            print('writer name ' + featuredController.featuredList[i].writer_name!);

                            if((featuredController.featuredList[i].writer_name!).toLowerCase().contains(searchableText.text.toLowerCase()) ||
                                (featuredController.featuredList[i].title!).toLowerCase().contains(searchableText.text.toLowerCase())){

                              searchableFeatureList.add(featuredController.featuredList[i]);
                            }
                          }

                          setState(() {

                          });
                        });
                      },
                    )
                    // child: SearchBarTag(
                    //   placeholder: "Search features",
                    //   autoFocus: false,
                    //   onSubmit: (value) {
                    //     checkNet(context).then((value) {
                    //       searchableFeatureList.clear();
                    //       print('searchable text hahah ' + searchableText.text + " " + featuredController.featuredList[0].writer_name!);
                    //       for(int i=0; i<featuredController.featuredList.length-1; i++){

                    //         print('writer name ' + featuredController.featuredList[i].writer_name!);

                    //         if((featuredController.featuredList[i].writer_name!).toLowerCase().contains(searchableText.text.toLowerCase()) ||
                    //             (featuredController.featuredList[i].title!).toLowerCase().contains(searchableText.text.toLowerCase())){

                    //           searchableFeatureList.add(featuredController.featuredList[i]);
                    //         }
                    //       }

                    //       setState(() {

                    //       });
                    //     });
                    //   },

                    //   controller: searchableText,
                    // ),
                  ),
                  Container(color: white.withOpacity(0.1),height: 1,),

                  // Recently Search
                  Padding(
                    padding: EdgeInsets.only(left: 30.w, top: 24.h),
                    child: Text("Recently Search",
                        style: TextStyle(
                            color: white,
                            fontWeight: FontWeight.w800,
                            fontFamily: helvetica_neu_bold,
                            fontStyle: FontStyle.normal,
                            fontSize: 16.sp),
                        textAlign: TextAlign.left),
                  ),

                  Expanded(
                    flex: 1,
                    child: SingleChildScrollView(
                      child: Padding(
                        padding: EdgeInsets.only(left: 30.w, right: 16.w),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [

                            // Rectangle 1363

                            searchableFeatureList.length > 0?  ListView.builder(
                          primary: false,
                          shrinkWrap: true,
                          padding: EdgeInsets.only(bottom: 20.h,top: 16.h),
                          itemCount: searchableFeatureList.length,
                          itemBuilder: (context, i) => // Activism
                          InkWell(
                            onTap: () {

                              for(int j=0; j<featuredController.featuredList.length; j++){
                                if(featuredController.featuredList[j].title == searchableFeatureList[i].title &&
                                    featuredController.featuredList[j].writer_name == searchableFeatureList[i].writer_name){
                                  Get.to(PastFeaturesScreen(featureList: featuredController.featuredList,selectedPosition: j,));
                                }
                              }

                            },
                            child: Padding(
                              padding: EdgeInsets.only(bottom: 16.h),
                              child: Row(
                                  mainAxisAlignment:
                                  MainAxisAlignment.spaceBetween,
                                  children: [
                                    ClipRRect(
                                      borderRadius:  BorderRadius.all(Radius.circular(5.r)),
                                      child: CachedNetworkImage(
                                        imageUrl: searchableFeatureList[i].image??"",
                                        fit: BoxFit.cover,
                                        width: 60.w,
                                        height: 60.h,
                                        progressIndicatorBuilder:
                                            (context, url, downloadProgress) =>
                                            SvgPicture.asset(
                                              placeholder,
                                              width: 60.w,
                                              height: 60.h,
                                              fit: BoxFit.cover,
                                            ),
                                        errorWidget: (context, url, error) =>
                                            SvgPicture.asset(
                                              placeholder,
                                              width: 60.w,
                                              height: 60.h,
                                              fit: BoxFit.cover,
                                            ),
                                      )
                                    ),

                                    SizedBox(width: 12.w,),

                                    Expanded(
                                      child: Align(
                                        alignment: Alignment.centerLeft,
                                        child: Column(
                                          mainAxisAlignment: MainAxisAlignment.start,
                                          crossAxisAlignment: CrossAxisAlignment.start,
                                          children: [

                                            setRoboto(
                                                    searchableFeatureList[i].title??"",
                                                    14.sp,
                                                    white.withOpacity(0.9),
                                                    FontWeight.w800,
                                                    ),

                                            SizedBox(height: 4.h,),

                                            // Fade
                                            Text(
                                                searchableFeatureList[i].writer_name??"",
                                                style:  TextStyle(
                                                    color: grey_aaaaaa,
                                                    fontWeight: FontWeight.w500,
                                                    fontFamily: roboto_medium,
                                                    fontStyle:  FontStyle.normal,
                                                    fontSize: 12.sp
                                                ),
                                                textAlign: TextAlign.left
                                            ),


                                          ],
                                        ),
                                      ),
                                    )

                                  ]),
                            ),
                          )):
                                Text('No data found')
                            ,
                          ],
                        ),
                      ),
                    ),
                  ),
                 
                ],
              ),
          ),
        ],
      ),

    );
  }
}
