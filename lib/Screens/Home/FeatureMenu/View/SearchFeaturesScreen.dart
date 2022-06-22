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
    return Scaffold(
      backgroundColor: Colors.white,
      body: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
              height: 55.h,
            ),
            ToolbarWithHeaderCenterTitle('Features'),
            SizedBox(
              height: 32.h,
            ),

            Padding(
              padding: EdgeInsets.only(left: 16, right: 16),
              child: SearchBarTag(
                placeholder: "Search features",
                autoFocus: false,
                onSubmit: (value) {
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

                controller: searchableText,
              ),
            ),

            // Recently Search
            Padding(
              padding: EdgeInsets.only(left: 16.w, top: 24.h),
              child: Text("Recently Search",
                  style: TextStyle(
                      color: black_121212,
                      fontWeight: FontWeight.w900,
                      fontFamily: "NeueHelvetica",
                      fontStyle: FontStyle.normal,
                      fontSize: 16.sp),
                  textAlign: TextAlign.left),
            ),

            Expanded(
              flex: 1,
              child: SingleChildScrollView(
                child: Padding(
                  padding: EdgeInsets.only(left: 16.w, right: 16.w),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [

                      // Rectangle 1363

                      searchableFeatureList.length > 0?  ListView.builder(
                    primary: false,
                    shrinkWrap: true,
                    padding: EdgeInsets.only(bottom: 20.h),
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
                        padding: EdgeInsets.only(bottom: 16.h, top: 16),
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
                                ),
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
                                              black_121212,
                                              FontWeight.w900,
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

    );
  }
}
