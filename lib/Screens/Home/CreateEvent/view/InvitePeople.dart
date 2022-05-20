import 'package:blackchecktech/Layout/ToolbarWithHeaderCenterTitle.dart';
import 'package:blackchecktech/Screens/Home/CreateEvent/controller/EventController.dart';
import 'package:blackchecktech/Screens/Home/CreateVideo/controller/VideoController.dart';
import 'package:blackchecktech/Styles/my_colors.dart';
import 'package:blackchecktech/Styles/my_icons.dart';
import 'package:blackchecktech/Utilities/Constant.dart';
import 'package:blackchecktech/Utilities/TextUtilities.dart';
import 'package:blackchecktech/Utils/internet_connection.dart';
import 'package:blackchecktech/Widget/search_bar.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';

class InvitePeople extends StatefulWidget {
  final fromView;
  InvitePeople({Key? key, this.fromView}) : super(key: key);

  @override
  State<InvitePeople> createState() => _InvitePeopleState();
}

class _InvitePeopleState extends State<InvitePeople> {
  EventController controller = Get.put(EventController());
  VideoController videoController = Get.put(VideoController());
  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    if(widget.fromView == true){
      controller.searchList.value = controller.selectedList;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Obx(
        () => Column(
          children: [
            SizedBox(
              height: 60,
            ),
            ToolbarWithHeaderCenterTitle('Invite People'),
            Expanded(
              child: SingleChildScrollView(
                child: Padding(
                  padding: const EdgeInsets.only(top:24.0, left: 24.0, right: 24.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SearchBarTag(
                        placeholder: "Search people",
                        onSubmit: (value){
                          checkNet(context).then((value) {
                            videoController.userListAPI(context, controller.searchController.value.text);
                          });
                          for(var item in videoController.userList){
                            if(controller.selectedList.contains(item)){
                              controller.searchList.clear();
                              controller.searchList.add(item);
                            }
                          }
                        },
                        controller: controller.searchController.value,
                      ),
                      SizedBox(
                        height: 24.h,
                      ),
                      Padding(
                        padding: const EdgeInsets.only(bottom: 24.0),
                        child: Row(
                          children: [
                            widget.fromView == true
                            ? setHelveticaLight(controller.searchList.length.toString() + " Users Selected", 16.sp, grey_aaaaaa, FontWeight.w900, FontStyle.normal)
                            : setHelveticaLight(videoController.userList.length.toString() + " Users", 16.sp, grey_aaaaaa, FontWeight.w900, FontStyle.normal),
                            Spacer(),
                            InkWell(
                              onTap: (){
                                setState(() {
                                  if( widget.fromView != true){
                                    if (controller.selectedList.length == videoController.userList.length) {
                                      for(int i =0; i<videoController.userList.length; i++){
                                        controller.selectedList.remove(videoController.userList[i]);
                                      }
                                      controller.selectName.value = 'Select All';
                                    } else {
                                      controller.selectedList.clear();                                  
                                      for(int i =0; i<videoController.userList.length; i++){
                                        controller.selectedList.add(videoController.userList[i]);
                                      }
                                      controller.selectName.value = 'Deselect All';
                                    }
                                  }
                                });
                              },
                              child: widget.fromView == true
                              ? Container()
                              : setHelveticaLight(controller.selectName.value, 16.sp, grey_aaaaaa, FontWeight.w900, FontStyle.normal)
                            ),
                          ],
                        ),
                      ),
                      ListView.builder(
                        primary: false,
                        shrinkWrap: true,
                        padding: EdgeInsets.all(0),
                        itemCount: widget.fromView == true ? controller.searchList.length : videoController.userList.length,
                        itemBuilder: (context, i) => GestureDetector(
                          onTap: () {
                            setState(
                              () {
                                if(widget.fromView == true){
                                  if (controller.searchList.contains(controller.searchList[i])) {
                                    controller.searchList.remove(controller.searchList[i]);
                                    controller.selectName.value = 'Select All';
                                  } else {
                                    controller.searchList.add(controller.searchList[i]);
                                    if(controller.searchList.length == controller.searchList.length){
                                      controller.selectName.value = 'Deselect All';
                                    }
                                  }
                                }else{
                                  if (controller.selectedList.contains(videoController.userList[i])) {
                                    controller.selectedList.remove(videoController.userList[i]);
                                    controller.selectName.value = 'Select All';
                                  } else {
                                    controller.selectedList.add(videoController.userList[i]);
                                    if(controller.selectedList.length == videoController.userList.length){
                                      controller.selectName.value = 'Deselect All';
                                    }
                                  }
                                }
                              },
                            );
                          },
                          child: Padding(
                            padding: EdgeInsets.only(bottom: 16.h),
                            child: Container(
                              color: Colors.white,
                              child: Padding(
                                padding: const EdgeInsets.all(10.0),
                                child: Row(
                                  mainAxisSize: MainAxisSize.max,
                                  mainAxisAlignment:
                                      MainAxisAlignment.start,
                                  crossAxisAlignment:
                                      CrossAxisAlignment.center,
                                  children: [
                                    ClipRRect(
                                      borderRadius: BorderRadius.circular(50),
                                      child: widget.fromView == true ? controller.searchList[i].image == null 
                                      ? SvgPicture.asset(
                                        placeholder,
                                        height: 44.h,
                                        width: 44.w,
                                        fit: BoxFit.cover,
                                      )
                                      : CachedNetworkImage(
                                        imageUrl: controller.searchList[i].image!,
                                        height: 44.h, width: 44.w,
                                        fit: BoxFit.cover,
                                        progressIndicatorBuilder: (context, url, downloadProgress) => SvgPicture.asset(placeholder, height: 44.h, width: 44.w, fit: BoxFit.cover,),
                                        errorWidget: (context, url, error) => SvgPicture.asset(placeholder, height: 44.h, width: 44.w, fit: BoxFit.cover,),
                                      )
                                      : videoController.userList[i].image == null
                                      ? SvgPicture.asset(
                                        placeholder,
                                        height: 44.h,
                                        width: 44.w,
                                        fit: BoxFit.cover,
                                      )
                                      : CachedNetworkImage(
                                        imageUrl: videoController.userList[i].image!,
                                        height: 44.h, width: 44.w,
                                        fit: BoxFit.cover,
                                        progressIndicatorBuilder: (context, url, downloadProgress) => SvgPicture.asset(placeholder, height: 44.h, width: 44.w, fit: BoxFit.cover,),
                                        errorWidget: (context, url, error) => SvgPicture.asset(placeholder, height: 44.h, width: 44.w, fit: BoxFit.cover,),
                                      ),
                                    ),
                                    SizedBox(
                                      width: 16.w,
                                    ),
                                    Expanded(
                                      flex: 1,
                                      child: Column(
                                        mainAxisAlignment:
                                            MainAxisAlignment.start,
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          // claireroman
                                          Text(widget.fromView == true
                                            ? controller.searchList[i].userName != null ? controller.searchList[i].userName! : ""
                                            : videoController.userList[i].userName != null ? videoController.userList[i].userName! : "",
                                              style: TextStyle(
                                                  color: grey_aaaaaa,
                                                  fontWeight:
                                                      FontWeight.w500,
                                                  fontFamily:
                                                      helveticaNeueNeue_medium,
                                                  fontStyle:
                                                      FontStyle.normal,
                                                  fontSize: 14.sp),
                                              textAlign:
                                                  TextAlign.left),
                                          SizedBox(
                                            height: 2.h,
                                          ),
                                          // Claire Roman
                                          Text(widget.fromView == true
                                              ? controller.searchList[i].firstName != null ? controller.searchList[i].firstName!.capitalizeFirst! + " " + controller.searchList[i].lastName!.capitalizeFirst! : ""
                                              : videoController.userList[i].firstName != null ? videoController.userList[i].firstName!.capitalizeFirst! + " " + videoController.userList[i].lastName!.capitalizeFirst! : "",
                                              style: TextStyle(
                                                  color: black_121212,
                                                  fontWeight:
                                                      FontWeight.w700,
                                                  fontFamily:
                                                      helveticaNeueNeue_medium,
                                                  fontStyle:
                                                      FontStyle.normal,
                                                  fontSize: 14.sp),
                                              textAlign: TextAlign.left)
                                        ],
                                      ),
                                    ),
                                    SvgPicture.asset(widget.fromView == true
                                      ? controller.searchList.contains(controller.searchList[i])
                                        ? orange_tick_icon
                                        : icon_next_arrow
                                      : controller.selectedList.contains(videoController.userList[i])
                                        ? orange_tick_icon
                                        : icon_next_arrow,
                                      width: 25.w,
                                      height: 25.h,
                                    )
                                  ],
                                ),
                              ),
                            ),
                          ),
                        ),
                      )
                    ],
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}