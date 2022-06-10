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
import 'PastFeaturesScreen.dart';

class SearchFeaturesScreen extends StatefulWidget {
  final List<FeaturedList> featureList;

  const SearchFeaturesScreen({Key? key, required this.featureList})
      : super(key: key);

  @override
  _SearchFeaturesScreenState createState() => _SearchFeaturesScreenState();
}

class _SearchFeaturesScreenState extends State<SearchFeaturesScreen> {

  String? dropdownValue;

    List<FeaturedList> searchableFeatureList =[];
  TextEditingController searchableText = TextEditingController();

  var _firstnameController = TextEditingController();

  // bool isFollow = true;
  // bool isFollowed = false;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    searchableFeatureList.addAll(widget.featureList);
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
              height: 60.h,
            ),
            ToolbarWithHeaderCenterTitle('Features'),
            SizedBox(
              height: 32.h,
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
                      SearchBarTag(
                        placeholder: "Search features",
                        autoFocus: false,
                        onSubmit: (value) {
                          checkNet(context).then((value) {
                            searchableFeatureList.clear();
                            print('searchable text hahah ' + searchableText.text + " " + widget.featureList[0].writer_name!);
                            for(int i=0; i<widget.featureList.length-1; i++){

                              print('writer name ' + widget.featureList[i].writer_name!);

                              if((widget.featureList[i].writer_name!).toLowerCase().contains(searchableText.text.toLowerCase()) ||
                                  (widget.featureList[i].title!).toLowerCase().contains(searchableText.text.toLowerCase())){

                                searchableFeatureList.add(widget.featureList[i]);
                              }
                            }

                            setState(() {

                            });
                          });
                        },

                        controller: searchableText,
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

                      //   SizedBox(height: 16.h,),
                      // Rectangle 1363

                      searchableFeatureList.length > 0?  ListView.builder(
                    primary: false,
                    shrinkWrap: true,
                    padding: EdgeInsets.only(top: 20.h),
                    itemCount: searchableFeatureList.length,
                    itemBuilder: (context, i) => // Activism
                    InkWell(
                      onTap: () {

                        Get.to(PastFeaturesScreen(featureList: widget.featureList,selectedPosition: i,));

                      },
                      child: Padding(
                        padding: EdgeInsets.only(bottom: 16.h, top: 16),
                        child: Row(
                            mainAxisAlignment:
                            MainAxisAlignment.spaceBetween,
                            children: [
                              CachedNetworkImage(
                                imageUrl: searchableFeatureList[i].image??"",
                                fit: BoxFit.cover,
                                width: 50,
                                height: 50,
                                progressIndicatorBuilder:
                                    (context, url, downloadProgress) =>
                                    SvgPicture.asset(
                                      placeholder,
                                      height: 50,
                                      width: 50,
                                      fit: BoxFit.cover,
                                    ),
                                errorWidget: (context, url, error) =>
                                    SvgPicture.asset(
                                      placeholder,
                                      height: 50,
                                      width: 50,
                                      fit: BoxFit.cover,
                                    ),
                              ),

                              SizedBox(width: 12,),

                              Expanded(
                                child: Align(
                                  alignment: Alignment.centerLeft,
                                  child: Column(
                                    children: [

                                      Align(
                                    alignment: Alignment.centerLeft
                                    ,child: setHelveticaMedium(
                                            searchableFeatureList[i].writer_name??"",
                                            18.sp,
                                            black_121212,
                                            FontWeight.w900,
                                            FontStyle.normal),
                                      ),

                                      SizedBox(height: 4,),

                                      Align(
                                        alignment: Alignment.centerLeft
                                        ,child: setHelveticaRegular(
                                          searchableFeatureList[i].title??"",
                                          15.sp,
                                          black_121212,
                                          FontWeight.w900,
                                          FontStyle.normal),
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
