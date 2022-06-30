import 'package:blackchecktech/Layout/BlackButton.dart';
import 'package:blackchecktech/Layout/ToolbarWithHeaderCenterTitle.dart';
import 'package:blackchecktech/Screens/Home/CreateEvent/controller/EventController.dart';
import 'package:blackchecktech/Screens/Home/CreateVideo/controller/VideoController.dart';
import 'package:blackchecktech/Screens/Home/CreateVideo/model/UserListModel.dart';
import 'package:blackchecktech/Screens/Home/Profile/controller/AdmireProfileController.dart';
import 'package:blackchecktech/Styles/my_colors.dart';
import 'package:blackchecktech/Styles/my_icons.dart';
import 'package:blackchecktech/Utilities/Constant.dart';
import 'package:blackchecktech/Utilities/TextUtilities.dart';
import 'package:blackchecktech/Utils/internet_connection.dart';
import 'package:blackchecktech/Utils/pagination_utils.dart';
import 'package:blackchecktech/Widget/search_bar.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:circular_profile_avatar/circular_profile_avatar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';

class InvitePeople extends StatefulWidget {
  final fromView;
  final id;
  const InvitePeople({Key? key, this.fromView, this.id}) : super(key: key);

  @override
  State<InvitePeople> createState() => _InvitePeopleState();
}

class _InvitePeopleState extends State<InvitePeople> {
  EventController controller = Get.put(EventController());
  VideoController videoController = Get.put(VideoController());
  AdmireProfileController admireProfileController =
      Get.put(AdmireProfileController());
  List<UserList> list = <UserList>[];

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    if(widget.id == null){
      videoController.initScrolling(context, true);
    }else{
      admireProfileController.initUserScrolling(context, widget.id);
    }
    
    if (widget.fromView == true) {
      // controller.searchList.clear();
      controller.searchList = controller.selectedList;
    }
    list = controller.selectedList;
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Obx(
        () => Stack(
          alignment: Alignment.bottomCenter,
          children: [
            Column(
              children: [
                Expanded(
                  child: Column(
                    children: [
                      SizedBox(
                        height: 60.h,
                      ),
                      ToolbarWithHeaderCenterTitle('Invite People'),
                      Expanded(
                        child: SingleChildScrollView(
                          controller: widget.id != null
                              ? admireProfileController.userScrollController
                              : videoController.scrollController,
                          child: Padding(
                            padding: EdgeInsets.only(top: 10.h,
                                 left: 24.w, right: 24.w),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                widget.fromView == true ? Container() :
                                Padding(
                                  padding: const EdgeInsets.only(top: 30),
                                  child: SearchBarTag(
                                    placeholder: "Search people",
                                    autoFocus: false,
                                    onSubmit: (value) async {
                                      if (controller
                                              .searchController.value.text ==
                                          '') {
                                        admireProfileController.isSearched.value = true;
                                        // if (widget.fromView == true) {
                                        //   checkNet(context).then((value) async {
                                        //     videoController.PageNumber.value = 0;
                                        //     await videoController
                                        //         .userListAPI(context);
                                        //   });
                                        // } else {
                                          videoController.userList.clear();

                                          if (widget.id != null) {
                                            admireProfileController
                                                .userPageNumber.value = 0;
                                            await admireProfileController
                                                .eventInviteUsersList(
                                                    context, widget.id);
                                          } else {
                                            videoController.PageNumber.value = 0;
                                            await videoController
                                                .userListAPI(context, true);
                                          // }
                                        }

                                        Future.delayed(Duration(milliseconds: 500),
                                            () {
                                          for (var item
                                              in videoController.userList) {
                                            for (var selectedItem in list) {
                                              if (selectedItem.id == item.id) {
                                                item.isSpeakerSelected =
                                                    selectedItem
                                                        .isSpeakerSelected;
                                              }
                                            }
                                          }
                                          setState(() {});
                                        });
                                      } else {
                                        admireProfileController.isSearched.value = false;
                                        // if (widget.fromView == true) {
                                        //   checkNet(context).then((value) async {
                                        //     videoController.PageNumber.value = 0;
                                        //     await videoController
                                        //         .userListAPI(context);
                                        //   });
                                        // } else {
                                          videoController.userList.clear();

                                          if (widget.id != null) {
                                            admireProfileController
                                                .userPageNumber.value = 0;
                                            await admireProfileController
                                                .eventInviteUsersList(
                                                    context, widget.id);
                                          } else {
                                            videoController.PageNumber.value = 0;
                                            await videoController
                                                .userListAPI(context, true);
                                          }
                                        // }

                                        Future.delayed(Duration(milliseconds: 500),
                                            () {
                                          for (var item
                                              in videoController.userList) {
                                            for (var selectedItem in list) {
                                              if (selectedItem.id == item.id) {
                                                item.isSpeakerSelected =
                                                    selectedItem
                                                        .isSpeakerSelected;
                                              }
                                            }
                                          }
                                          setState(() {});
                                        });

                                        
                                      }
                                    },
                                    controller:
                                        videoController.searchController.value,
                                  ),
                                ),
                                SizedBox(
                                  height: 16.h,
                                ),
                                Padding(
                                  padding: const EdgeInsets.only(bottom: 24.0),
                                  child: Row(
                                    children: [
                                      widget.fromView == true
                                          ? setHelveticaLight(
                                              controller.searchList.length
                                                      .toString() +
                                                  " Users Selected",
                                              14.sp,
                                              grey_aaaaaa,
                                              FontWeight.w900,
                                              FontStyle.normal)
                                          : setHelveticaLight(
                                              videoController.userList.length
                                                      .toString() +
                                                  " Users",
                                              14.sp,
                                              grey_aaaaaa,
                                              FontWeight.w900,
                                              FontStyle.normal),
                                      const Spacer(),
                                      InkWell(
                                          onTap: () {
                                            setState(() {
                                              if (widget.fromView != true) {
                                                if (list.length ==
                                                    videoController
                                                        .userList.length) {
                                                  for (int i = 0;
                                                      i <
                                                          videoController
                                                              .userList.length;
                                                      i++) {
                                                    // controller.selectedList.remove(
                                                    //     videoController.userList[i]);
                                                    videoController.userList[i]
                                                            .isSpeakerSelected =
                                                        false;
                                                    list.remove(videoController
                                                        .userList[i]);
                                                    admireProfileController
                                                        .selectedPeople
                                                        .remove(videoController
                                                            .userList[i].id);
                                                    videoController.userList[i]
                                                            .isSpeakerSelected =
                                                        false;
                                                  }
                                                  controller.selectName.value =
                                                      'Select all';
                                                } else {
                                                  list.clear();
                                                  for (int i = 0;
                                                      i <
                                                          videoController
                                                              .userList.length;
                                                      i++) {
                                                    // controller.selectedList.add(
                                                    //     videoController.userList[i]);
                                                    videoController.userList[i]
                                                            .isSpeakerSelected =
                                                        true;
                                                    list.add(videoController
                                                        .userList[i]);
                                                    admireProfileController
                                                        .selectedPeople
                                                        .add(videoController
                                                            .userList[i].id);
                                                    videoController.userList[i]
                                                            .isSpeakerSelected =
                                                        true;
                                                  }
                                                  controller.selectName.value =
                                                      'Deselect all';
                                                }
                                              }
                                            });
                                          },
                                          child: widget.fromView == true
                                              ? Container()
                                              : setHelveticaLight(
                                                  controller.selectName.value,
                                                  14.sp,
                                                  black_121212,
                                                  FontWeight.w900,
                                                  FontStyle.normal)),
                                    ],
                                  ),
                                ),
                                ListView.builder(
                                  primary: false,
                                  shrinkWrap: true,
                                  padding: const EdgeInsets.only(bottom: 80),
                                  itemCount: widget.fromView == true
                                      ? controller.searchList.length
                                      : videoController.userList.length,
                                  itemBuilder: (context, i) => GestureDetector(
                                    onTap: () {
                                      setState(
                                        () {
                                          if (widget.fromView == true) {
                                            // if (controller.searchList.contains(
                                            //     controller.searchList[i])) {
                                            //   controller.searchList.remove(
                                            //       controller.searchList[i]);
                                            //   controller.selectName.value =
                                            //       'Select All';
                                            // } else {
                                            //   controller.searchList.add(
                                            //       controller.searchList[i]);
                                            //   if (controller
                                            //           .searchList.length ==
                                            //       controller
                                            //           .searchList.length) {
                                            //     controller.selectName.value =
                                            //         'Deselect All';
                                            //   }
                                            // }
                                          } else {




                                          List removeList = [];
                                          if(list.isEmpty){
                                            videoController.userList[i].isSpeakerSelected = true;
                                            list.add(videoController.userList[i]);
                                          }else{
                                            if (videoController.userList[i].isSpeakerSelected == true) {
                                              videoController.userList[i].isSpeakerSelected = false;
                                              // for (var item in controller.userList) {
                                                for (var selectedItem in list) {
                                                  if (selectedItem.id == videoController.userList[i].id) {
                                                    selectedItem.isSpeakerSelected = videoController.userList[i].isSpeakerSelected;
                                                    admireProfileController.selectedPeople.remove(videoController.userList[i].id);
                                                    controller.selectName.value = 'Select All';
                                                    removeList.add(selectedItem.id);
                                                  }
                                                }
                                              // }

                                              print(admireProfileController.selectedPeople.length);

                                              for (var selectedItem in removeList) {
                                                list.removeWhere((element) => element.id == selectedItem);
                                              }
                                            } else {
                                              list.add(videoController.userList[i]);
                                              videoController.userList[i].isSpeakerSelected = true;
                                              admireProfileController.selectedPeople.add(videoController.userList[i].id);
                                              if (list.length == videoController.userList.length) {
                                                controller.selectName.value = 'Deselect All';
                                              }
                                            }
                                          }

                                            
                                        //     videoController
                                        // .userList[i].isSpeakerSelected = true;
                                        //     if (list.contains(
                                        //         videoController.userList[i])) {
                                        //       // controller.selectedList.remove(
                                        //       // videoController.userList[i]);
                                        //       videoController
                                        // .userList[i].isSpeakerSelected = true;
                                        //       admireProfileController
                                        //           .selectedPeople
                                        //           .remove(videoController
                                        //               .userList[i].id);
                                        //       list.remove(
                                        //           videoController.userList[i]);
                                        //       controller.selectName.value =
                                        //           'Select All';
                                        //       videoController.userList[i]
                                        //           .isSpeakerSelected = false;
                                        //     } else {
                                        //       // controller.selectedList
                                        //       //     .add(videoController.userList[i]);
                                              
                                        //       admireProfileController
                                        //           .selectedPeople
                                        //           .add(videoController
                                        //               .userList[i].id);
                                        //       list.add(
                                        //           videoController.userList[i]);
                                        //       videoController.userList[i]
                                        //           .isSpeakerSelected = true;
                                        //       if (list.length ==
                                        //           videoController
                                        //               .userList.length) {
                                        //         controller.selectName.value =
                                        //             'Deselect All';
                                        //       }
                                        //     }
                                          }
                                        },
                                      );
                                    },
                                    child: Padding(
                                      padding: EdgeInsets.only(bottom: 16.h),
                                      child: Container(
                                        color: Colors.white,
                                        child: Row(
                                          mainAxisSize: MainAxisSize.max,
                                          mainAxisAlignment:
                                              MainAxisAlignment.start,
                                          crossAxisAlignment:
                                              CrossAxisAlignment.center,
                                          children: [
                                            CircularProfileAvatar(
                                              '',
                                              radius: 19.5,
                                              child: widget.fromView == true
                                                  ? controller.searchList[i]
                                                              .image ==
                                                          null
                                                      ? SvgPicture.asset(
                                                          placeholder,
                                                          height: 40.h,
                                                          width: 40.w,
                                                          fit: BoxFit.cover,
                                                        )
                                                      : CachedNetworkImage(
                                                          imageUrl: controller
                                                              .searchList[i]
                                                              .image!,
                                                          height: 40.h,
                                                          width: 40.w,
                                                          fit: BoxFit.cover,
                                                          progressIndicatorBuilder:
                                                              (context, url,
                                                                      downloadProgress) =>
                                                                  SvgPicture
                                                                      .asset(
                                                            placeholder,
                                                            height: 44.h,
                                                            width: 44.w,
                                                            fit: BoxFit.cover,
                                                          ),
                                                          errorWidget: (context,
                                                                  url, error) =>
                                                              SvgPicture.asset(
                                                            placeholder,
                                                            height: 44.h,
                                                            width: 44.w,
                                                            fit: BoxFit.cover,
                                                          ),
                                                        )
                                                  : videoController.userList[i]
                                                              .image ==
                                                          null
                                                      ? SvgPicture.asset(
                                                          placeholder,
                                                          height: 40.h,
                                                          width: 40.w,
                                                          fit: BoxFit.cover,
                                                        )
                                                      : CachedNetworkImage(
                                                          imageUrl:
                                                              videoController
                                                                  .userList[i]
                                                                  .image!,
                                                          height: 40.h,
                                                          width: 40.w,
                                                          fit: BoxFit.cover,
                                                          progressIndicatorBuilder:
                                                              (context, url,
                                                                      downloadProgress) =>
                                                                  SvgPicture
                                                                      .asset(
                                                            placeholder,
                                                            height: 44.h,
                                                            width: 44.w,
                                                            fit: BoxFit.cover,
                                                          ),
                                                          errorWidget: (context,
                                                                  url, error) =>
                                                              SvgPicture.asset(
                                                            placeholder,
                                                            height: 44.h,
                                                            width: 44.w,
                                                            fit: BoxFit.cover,
                                                          ),
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
                                                  Text(
                                                      widget.fromView == true
                                                          ? controller
                                                                      .searchList[
                                                                          i]
                                                                      .userName !=
                                                                  null
                                                              ? controller
                                                                  .searchList[i]
                                                                  .userName!
                                                              : ""
                                                          : videoController
                                                                      .userList[
                                                                          i]
                                                                      .userName !=
                                                                  null
                                                              ? videoController
                                                                  .userList[i]
                                                                  .userName!
                                                              : "",
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
                                                  Text(
                                                      widget.fromView == true
                                                          ? controller
                                                                      .searchList[
                                                                          i]
                                                                      .firstName !=
                                                                  null
                                                              ? controller
                                                                      .searchList[
                                                                          i]
                                                                      .firstName!
                                                                      .capitalizeFirst! +
                                                                  " " +
                                                                  controller
                                                                      .searchList[
                                                                          i]
                                                                      .lastName!
                                                                      .capitalizeFirst!
                                                              : ""
                                                          : videoController
                                                                      .userList[
                                                                          i]
                                                                      .firstName !=
                                                                  null
                                                              ? videoController
                                                                      .userList[
                                                                          i]
                                                                      .firstName!
                                                                      .capitalizeFirst! +
                                                                  " " +
                                                                  videoController
                                                                      .userList[
                                                                          i]
                                                                      .lastName!
                                                                      .capitalizeFirst!
                                                              : "",
                                                      style: TextStyle(
                                                          color: black_121212,
                                                          fontWeight:
                                                              FontWeight.w500,
                                                          fontFamily:
                                                              helvetica_neu_bold,
                                                          fontStyle:
                                                              FontStyle.normal,
                                                          fontSize: 14.sp),
                                                      textAlign: TextAlign.left)
                                                ],
                                              ),
                                            ),
                                            SvgPicture.asset(
                                              widget.fromView == true
                                                  ? icon_next_arrow
                                                  : videoController.userList[i].isSpeakerSelected == true
                                                  // : admireProfileController
                                                  //         .selectedPeople
                                                  //         .contains(
                                                  //             videoController
                                                  //                 .userList[i]
                                                  //                 .id)
                                                      ? orange_tick_icon
                                                      : icon_next_arrow,
                                              width: 24.w,
                                              height: 24.h,
                                            )
                                          ],
                                        ),
                                      ),
                                    ),
                                  ),
                                )
                              ],
                            ),
                          ),
                        ),
                      ),
                      if (admireProfileController.isUserPaginationLoading.value == true)
                        PaginationUtils().loader(),
                    ],
                  ),
                ),
              ],
            ),
            Padding(
              padding: const EdgeInsets.all(24.0),
              child: widget.fromView == true
                  ? Container()
                  : BlackButton('Send Invite', white, () {
                      if (widget.id != null) {
                        // controller.selectedList.addAll(list);
                        checkNet(context).then((value) {
                          admireProfileController.eventInviteUsers(
                              context, widget.id);
                        });
                      } else {
                        Get.back();
                        // controller.selectedList.addAll(list);
                      }
                    }),
            )
          ],
        ),
      ),
    );
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();

    videoController.searchController.value.text = "";
  }
}
