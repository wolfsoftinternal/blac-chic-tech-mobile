import 'package:blackchecktech/Layout/ToolbarBackOnly.dart';
import 'package:blackchecktech/Screens/Authentication/login/model/SignupModel.dart';
import 'package:blackchecktech/Screens/Home/CreateVideo/controller/VideoController.dart';
import 'package:blackchecktech/Screens/Home/Profile/controller/AdmireProfileController.dart';
import 'package:blackchecktech/Screens/Home/Profile/view/AdmireProfile.dart';
import 'package:blackchecktech/Screens/Home/Profile/view/UserProfile.dart';
import 'package:blackchecktech/Screens/Home/Settings/view/ProfileSetting.dart';
import 'package:blackchecktech/Styles/my_colors.dart';
import 'package:blackchecktech/Styles/my_icons.dart';
import 'package:blackchecktech/Utilities/Constant.dart';
import 'package:blackchecktech/Utilities/TextUtilities.dart';
import 'package:blackchecktech/Utils/internet_connection.dart';
import 'package:blackchecktech/Utils/pagination_utils.dart';
import 'package:blackchecktech/Utils/preference_utils.dart';
import 'package:blackchecktech/Utils/share_predata.dart';
import 'package:blackchecktech/Widget/CreateBottomSheet.dart';
import 'package:blackchecktech/Widget/ReportBottomSheet.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:circular_profile_avatar/circular_profile_avatar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:jiffy/jiffy.dart';

class PostDetail extends StatefulWidget {
  final id;
  final userId;
  const PostDetail({Key? key, this.id, this.userId}) : super(key: key);

  @override
  State<PostDetail> createState() => _PostDetailState();
}

class _PostDetailState extends State<PostDetail> {
  AdmireProfileController controller = Get.put(AdmireProfileController());
  VideoController videoController = Get.put(VideoController());
  String username = '';
  SignupModel? myModel;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    controller.initScrolling(context, widget.userId, widget.id);
    dynamic body = {
      'user_id': widget.userId.toString(),
      'post_id': widget.id.toString(),
      'page': controller.postPageNumber.toString()
    };
    checkNet(context).then((value) {
      controller.postListAPI(context, body, 'detail');
    });
    init();
  }

  init() async {
    var preferences = MySharedPref();
    myModel =
        await preferences.getSignupModel(SharePreData.keySignupModel);
    
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: white_ffffff,
      body: Obx(
        () => Column(children: [
          SizedBox(
            height: 60.h,
          ),
          Container(
            child: Row(
              children: [
                BackLayout(),
                SizedBox(
                  height: 48.h,
                  width: 48.w,
                ),
                const Spacer(),
                Center(
                  child: GestureDetector(
                    onTap: () {
                      if (myModel?.data!.id == controller.details.value.id) {
                          Get.to(AdmireProfile());
                        } else {
                          videoController.userList.clear();
                          Get.to(UserProfile(
                            selectedUserId: controller.details.value.id.toString(),
                            isFrom: true,
                          ));
                        }
                    },
                    child: CircularProfileAvatar(
                                '',
                                radius: 24,
                      child: controller.details.value.image == null
                          ? SvgPicture.asset(
                              placeholder,
                              height: 48.h,
                              width: 48.w,
                              fit: BoxFit.cover,
                            )
                          : CachedNetworkImage(
                              imageUrl: controller.details.value.image!,
                              height: 48.h,
                              width: 48.w,
                              fit: BoxFit.cover,
                              progressIndicatorBuilder:
                                  (context, url, downloadProgress) =>
                                      SvgPicture.asset(
                                placeholder,
                                height: 48.h,
                                width: 48.w,
                                fit: BoxFit.cover,
                              ),
                              errorWidget: (context, url, error) =>
                                  SvgPicture.asset(
                                placeholder,
                                height: 48.h,
                                width: 48.w,
                                fit: BoxFit.cover,
                              ),
                            ),
                    ),
                  ),
                ),
                const Spacer(),
                myModel?.data!.id == controller.details.value.id
                    ? GestureDetector(
                        onTap: () {
                          createBottomSheet(context, widget.userId);
                        },
                        child: Container(
                          width: 45.w,
                          height: 40.h,
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(10.r),
                          ),
                          child: Padding(
                            padding: EdgeInsets.all(8.r),
                            child: SvgPicture.asset(
                              add_icon,
                              width: 24.w,
                              height: 24.h,
                            ),
                          ),
                        ),
                      )
                    : SizedBox(
                        width: 48.w,
                        height: 48.h,
                      ),
                myModel?.data!.id == controller.details.value.id
                    ? Padding(
                        padding: EdgeInsets.only(right: 15.w),
                        child: GestureDetector(
                          onTap: () {
                            Get.to(ProfileSetting())!.then((value) {
                              checkNet(context).then((value) {
                                controller.userProfileAPI(context, false);
                              });
                            });
                          },
                          child: Container(
                            width: 45.w,
                            height: 45.h,
                            decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(10.r),
                            ),
                            child: SvgPicture.asset(
                              settings_icon,
                              width: 40.w,
                              height: 40.h,
                              color: black_121212,
                            ),
                          ),
                        ),
                      )
                    : Padding(
                        padding: EdgeInsets.only(right: 5.w),
                        child: GestureDetector(
                          onTap: () {
                            displayBottomSheet(context, widget.userId);
                          },
                          child: SizedBox(
                            width: 55.w,
                            height: 55.h,
                            child: Icon(Icons.more_horiz, color: black_121212),
                          ),
                        ),
                      )
              ],
            ),
          ),
          Expanded(
            child: SingleChildScrollView(
              controller: controller.postScrollController,
            child: ListView.builder(
                shrinkWrap: true,
                primary: false,
                itemCount: controller.postList.length,
                itemBuilder: (context, index) {
                  return Padding(
                    padding:
                        EdgeInsets.only(left: 16.w, right: 16.w, bottom: 16.h),
                    child: Container(
                      decoration: BoxDecoration(
                        color: white_ffffff,
                        boxShadow: [
                          BoxShadow(
                            color: const Color(0x17747796).withOpacity(0.07),
                            spreadRadius: 10,
                            blurRadius: 5,
                            offset: const Offset(
                                0, 10), // changes position of shadow
                          ),
                        ],
                        borderRadius: BorderRadius.all(Radius.circular(4.r)),
                      ),
                      child: Padding(
                        padding: EdgeInsets.all(16.r),
                        child: Column(
                          children: [
                            Stack(
                              children: [
                                InkWell(
                                  onDoubleTap: (){
                                    setState(() {
                                      if(controller.postList[index].isLike == 0){
                                        controller.postList[index].isLike = 1;
                                        controller.postList[index].totalLikes = controller.postList[index].totalLikes! + 1;
                                        checkNet(context).then((value) {
                                          controller.postLikeApi(context, controller.postList[index].id);
                                        });
                                      }
                                    });
                                  },
                                  child: SizedBox(
                                    height: 270.h,
                                    width: MediaQuery.of(context).size.width,
                                    child: controller
                                                .postList[index].image ==
                                            null
                                        ? SvgPicture.asset(
                                          placeholder,
                                          fit: BoxFit.fill,
                                        )
                                        : ClipRRect(
                                            borderRadius: BorderRadius.all(
                                                Radius.circular(4.r)),
                                            child: CachedNetworkImage(
                                              imageUrl: controller
                                                  .postList[index].image!,
                                              fit: BoxFit.fill,
                                              progressIndicatorBuilder: (context,
                                                      url, downloadProgress) =>
                                                  SvgPicture.asset(
                                                placeholder,
                                                fit: BoxFit.fill,
                                              ),
                                            )),
                                  ),
                                ),
                                const SizedBox(
                                  height: 15,
                                ),
                                Positioned(
                                  bottom: 15.h,
                                  left: 15.w,
                                  child: Container(
                                    height: 37.h,
                                    // width: 110.w,
                                    decoration: BoxDecoration(
                                      gradient: LinearGradient(colors: [
                                        Color(0xff1c2535),
                                        Color(0xff04080f)
                                      ]),
                                      borderRadius: BorderRadius.all(
                                          Radius.circular(40.r)),
                                    ),
                                    child: Padding(
                                      padding: const EdgeInsets.only(left: 15.0, right: 15.0),
                                      child: Center(
                                        child: Row(
                                          mainAxisSize: MainAxisSize.min,
                                          children: [
                                            controller.postList[index].isLike == 1 ?
                                            InkWell(
                                              onTap: (){
                                                setState(() {
                                                  controller.postList[index].isLike = 0;
                                                  controller.postList[index].totalLikes = controller.postList[index].totalLikes! - 1;
                                                  checkNet(context).then((value) {
                                                    controller.postDisLikeApi(context, controller.postList[index].id);
                                                  });
                                                });
                                              },
                                              child: SvgPicture.asset(
                                              icon_heart,
                                              width: 17.w,
                                              height: 17.h,
                                              color:Colors.red,
                                            )) :
                                            InkWell(
                                              onTap: (){
                                                setState(() {
                                                  controller.postList[index].isLike = 1;
                                                  controller.postList[index].totalLikes = controller.postList[index].totalLikes! + 1;
                                                  checkNet(context).then((value) {
                                                    controller.postLikeApi(context, controller.postList[index].id);
                                                  });
                                                });
                                              },
                                              child: Image.asset(
                                              heart,
                                              width: 17.w,
                                              height: 17.h,
                                              color: Colors.white,
                                            )),
                                            SizedBox(
                                              width: 5.w,
                                            ),
                                            setHelceticaBold(
                                                "${controller.postList[index].totalLikes} likes",
                                                14.sp,
                                                white_ffffff,
                                                FontWeight.w500,
                                                FontStyle.normal)
                                          ],
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                            SizedBox(
                              height: 16.h,
                            ),
                            Align(
                              alignment: Alignment.topLeft,
                              child: Text.rich(
                                TextSpan(
                                  children: [
                                    for (int i = 0; i < controller.postList[index].taggedUsers!.length; i++)
                                    TextSpan(
                                      text:
                                          "${"@" + controller.postList[index].taggedUsers![i].userDetails!.userName!.replaceAll("@", '') + " "}",
                                      style: TextStyle(
                                        fontSize: 12.sp,
                                        fontFamily: helvetica_neu_bold,
                                        fontWeight: FontWeight.w600,
                                        color: black_121212,
                                      ),
                                    ),
                                    TextSpan(
                                        text: controller
                                            .postList[index].caption!,
                                        style: TextStyle(
                                            fontSize: 12.sp,
                                            fontFamily:
                                                helveticaNeueNeue_medium,
                                            fontWeight: FontWeight.w400,
                                            color: grey_3f3f3f)),
                                  ],
                                ),
                              ),
                            ),
                            Padding(
                                padding: const EdgeInsets.only(top: 5.0),
                                child: Row(
                                  children: [
                                    SvgPicture.asset(calendar_icon, color: grey_aaaaaa, height: 14.h, width: 14.w,),
                                    SizedBox(width: 5,),
                                    Text(Jiffy(DateFormat('yyyy-MM-dd').format(controller.postList[index].createdAt!)).fromNow(),
                                            style: TextStyle(
                                                fontSize: 12,
                                                fontFamily:
                                                    helveticaNeueNeue_medium,
                                                fontWeight: FontWeight.w400,
                                                color: grey_aaaaaa)),
                                  ],
                                ),
                              )
                          ],
                        ),
                      ),
                    ),
                  );
                }),
          ),
          ),
          if (controller.isPostPaginationLoading.value == true)
                PaginationUtils().loader(),
        ]),
      ),
    );
  }
}
