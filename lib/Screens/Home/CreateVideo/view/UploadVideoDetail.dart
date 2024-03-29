import 'package:blackchecktech/Layout/BlackButton.dart';
import 'package:blackchecktech/Layout/Chip.dart';
import 'package:blackchecktech/Layout/ToolbarWithHeaderCenterTitle.dart';
import 'package:blackchecktech/Screens/Home/CreateVideo/controller/VideoController.dart';
import 'package:blackchecktech/Styles/my_colors.dart';
import 'package:blackchecktech/Styles/my_icons.dart';
import 'package:blackchecktech/Utilities/Constant.dart';
import 'package:blackchecktech/Utilities/TextfieldUtility.dart';
import 'package:blackchecktech/Utils/internet_connection.dart';
import 'package:blackchecktech/Utils/pagination_utils.dart';
import 'package:blackchecktech/Widget/SpeakerHostBottomSheet.dart';
import 'package:blackchecktech/Widget/SpinnerDecorationBorder.dart';
import 'package:blackchecktech/Widget/VideoSpeakerList.dart';
import 'package:blackchecktech/Widget/search_bar.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/src/size_extension.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:material_tag_editor/tag_editor.dart';

class UploadVideoDetail extends StatefulWidget {
  const UploadVideoDetail({Key? key}) : super(key: key);

  @override
  _UploadVideoDetailState createState() => _UploadVideoDetailState();
}

class _UploadVideoDetailState extends State<UploadVideoDetail> {
  VideoController controller = Get.put(VideoController());

  @override
  void initState() {
    super.initState();
    checkNet(context).then((value) async {
      await controller.userListAPI(context, false);
      await controller.topicListAPI(context);
      await controller.languageListAPI(context);
    }).then((value) {
      setState(() {});
    });

    Future.delayed(Duration(seconds: 500), () {
      for (var item in controller.userList) {
        if (item.isSpeakerSelected == true) {
          item.isSpeakerSelected = false;
        }
        setState(() {});
      }
    });
  }

  /*Speaker bottom sheet*/
  void displayRecurringOrderBottomSheet(BuildContext context) {
    showModalBottomSheet(
        isScrollControlled: true,
        backgroundColor: Colors.transparent,
        context: context,
        builder: (ctx) {
          return VideoSpeakerList();
        });
  }

  @override
  Widget build(BuildContext context) {
    return Obx(
      () => Scaffold(
        backgroundColor: Colors.white,
        body: Stack(
          alignment: Alignment.bottomCenter,
          children: [
            Column(
              children: [
                Expanded(
                  child: Column(
                    children: [
                      const SizedBox(
                        height: 60,
                      ),
                      ToolbarWithHeaderCenterTitle("UPLOAD VIDEO"),
                      const SizedBox(
                        height: 20,
                      ),
                      Expanded(
                        child: SingleChildScrollView(
                          child: Padding(
                            padding: EdgeInsets.only(
                                left: 24.w,
                                right: 24.w,
                                top: 20.h,
                                bottom: 24.h),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                // UPLOAD VIDEO
                                Text("VIDEO TITLE",
                                    style: TextStyle(
                                        color: black_121212,
                                        fontWeight: FontWeight.w900,
                                        fontFamily: helvetica_neu_bold,
                                        letterSpacing: 0.7,
                                        fontStyle: FontStyle.normal,
                                        fontSize: 12.sp),
                                    textAlign: TextAlign.left),

                                SizedBox(
                                  height: 14.h,
                                ),

                                setTextFieldHelveticaMediumBorder(
                                  controller.titleController.value,
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
                                  height: 20.h,
                                ),

                                Text("TOPIC",
                                    style: TextStyle(
                                        color: black_121212,
                                        fontWeight: FontWeight.w900,
                                        fontFamily: helvetica_neu_bold,
                                        letterSpacing: 0.7,
                                        fontStyle: FontStyle.normal,
                                        fontSize: 12.sp),
                                    textAlign: TextAlign.left),

                                SizedBox(
                                  height: 14.h,
                                ),

                                Container(
                                  height: 50.h,
                                  width: double.infinity,
                                  decoration: SpinnerDecorationBorder,
                                  child: DropdownButtonHideUnderline(
                                    child: DropdownButton2(
                                        value: controller.topicName,
                                        hint: Text("Select Topic",
                                            style: TextStyle(
                                                color: grey_aaaaaa,
                                                fontWeight: FontWeight.w500,
                                                fontFamily:
                                                    helveticaNeueNeue_medium,
                                                fontStyle: FontStyle.normal,
                                                fontSize: 14.sp),
                                            textAlign: TextAlign.left),
                                        icon: SvgPicture.asset(
                                          icon_down_arrow_spinner,
                                          width: 12.w,
                                          height: 12.h,
                                        ),
                                        isExpanded: true,
                                        customItemsHeight: 4,
                                        iconEnabledColor: black_121212,
                                        iconDisabledColor: Colors.grey,
                                        buttonHeight: 60,
                                        buttonWidth: double.infinity,
                                        buttonPadding: const EdgeInsets.only(
                                            left: 14, right: 14),
                                        buttonDecoration: BoxDecoration(
                                          borderRadius:
                                              BorderRadius.circular(4),
                                          color: white,
                                        ),
                                        itemHeight: 42,
                                        itemPadding: const EdgeInsets.symmetric(
                                            horizontal: 15.0),
                                        onChanged: (String? newValue) {
                                          setState(() {
                                            controller.topicName = newValue!;
                                          });
                                        },
                                        items: controller.dropDownTopicItems),
                                  ),
                                ),

                                SizedBox(
                                  height: 20.h,
                                ),

                                Text("LANGUAGE",
                                    style: TextStyle(
                                        color: black_121212,
                                        fontWeight: FontWeight.w900,
                                        fontFamily: helvetica_neu_bold,
                                        letterSpacing: 0.7,
                                        fontStyle: FontStyle.normal,
                                        fontSize: 12.sp),
                                    textAlign: TextAlign.left),

                                SizedBox(
                                  height: 14.h,
                                ),

                                Container(
                                  height: 50.h,
                                  width: double.infinity,
                                  decoration: SpinnerDecorationBorder,
                                  child: DropdownButtonHideUnderline(
                                    child: DropdownButton2(
                                        //  validator: (value) => value == null ? "Select a country" : null,
                                        value: controller.languageName,
                                        hint: Text("Select Language",
                                            style: TextStyle(
                                                color: grey_aaaaaa,
                                                fontWeight: FontWeight.w500,
                                                fontFamily:
                                                    helveticaNeueNeue_medium,
                                                fontStyle: FontStyle.normal,
                                                fontSize: 14.sp),
                                            textAlign: TextAlign.left),
                                        icon: SvgPicture.asset(
                                          icon_down_arrow_spinner,
                                          width: 12.w,
                                          height: 12.h,
                                        ),
                                        onChanged: (String? newValue) {
                                          setState(() {
                                            controller.languageName = newValue!;
                                          });
                                        },
                                        isExpanded: true,
                                        customItemsHeight: 4,
                                        iconEnabledColor: black_121212,
                                        iconDisabledColor: Colors.grey,
                                        buttonHeight: 60,
                                        buttonWidth: double.infinity,
                                        buttonPadding: const EdgeInsets.only(
                                            left: 14, right: 14),
                                        buttonDecoration: BoxDecoration(
                                          borderRadius:
                                              BorderRadius.circular(4),
                                          color: white,
                                        ),
                                        itemHeight: 42,
                                        itemPadding: const EdgeInsets.symmetric(
                                            horizontal: 15.0),
                                        items:
                                            controller.dropDownLanguageItems),
                                  ),
                                ),

                                SizedBox(
                                  height: 20.h,
                                ),

                                Text("VIDEO LINK",
                                    style: TextStyle(
                                        color: black_121212,
                                        fontWeight: FontWeight.w900,
                                        fontFamily: helvetica_neu_bold,
                                        letterSpacing: 0.7,
                                        fontStyle: FontStyle.normal,
                                        fontSize: 12.sp),
                                    textAlign: TextAlign.left),

                                SizedBox(
                                  height: 14.h,
                                ),

                                setTextFieldHelveticaMediumBorder(
                                    controller.linkController.value,
                                    "Type here...",
                                    false,
                                    TextInputType.text,
                                    false,
                                    "",
                                    TextInputAction.next,
                                    () => {
                                          // on Chnages
                                        },
                                    3),

                                // Container(
                                //   decoration: BoxDecoration(
                                //     color: Color(0x66f5f5f5),
                                //     borderRadius: BorderRadius.circular(4),
                                //     border: Border.all(width: 1, color: grey_aaaaaa),
                                //   ),
                                //   child: // <iframe width="560" height="315" src="https://www.youtube.com/embed/yfwNi4aK1_w" title="YouTube vide
                                //       Padding(
                                //     padding: const EdgeInsets.all(20.0),
                                //     child: Text(
                                //         "<iframe width=560 height=315 src=https:www.youtube.com/embed/yfwNi4aK1_w title=YouTube video player frameborder=0 allow=accelerometer autoplay clipboard-write encrypted-media; gyroscope; picture-in-picture allowfullscreen></iframe>",
                                //         style: const TextStyle(
                                //             color: const Color(0xff121212),
                                //             fontWeight: FontWeight.w500,
                                //             fontFamily: helveticaNeue,
                                //             fontStyle: FontStyle.normal,
                                //             fontSize: 11.0),
                                //         textAlign: TextAlign.left),
                                //   ),
                                // ),

                                SizedBox(
                                  height: 20.h,
                                ),

                                Text("DESCRIPTION",
                                    style: TextStyle(
                                        color: black_121212,
                                        fontWeight: FontWeight.w900,
                                        fontFamily: helvetica_neu_bold,
                                        letterSpacing: 0.7,
                                        fontStyle: FontStyle.normal,
                                        fontSize: 12.sp),
                                    textAlign: TextAlign.left),

                                SizedBox(
                                  height: 14.h,
                                ),

                                Container(
                                  decoration: SpinnerDecorationBorder,
                                  height: 122.h,
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Expanded(
                                        flex: 1,
                                        child: Padding(
                                          padding: EdgeInsets.only(
                                              top: 4.h,
                                              bottom: 2.h,
                                              right: 24.w,
                                              left: 11.w),
                                          child: TextFormField(
                                            controller:
                                                controller.descController.value,
                                            minLines: 2,
                                            maxLines: 15,
                                            keyboardType:
                                                TextInputType.multiline,
                                            cursorColor: black_121212,
                                            style: TextStyle(
                                                color: black_121212,
                                                fontWeight: FontWeight.w500,
                                                fontFamily:
                                                    helveticaNeueNeue_medium,
                                                fontStyle: FontStyle.normal,
                                                fontSize: 14.sp),
                                            decoration: InputDecoration(
                                              border: InputBorder.none,
                                              contentPadding: EdgeInsets.zero,
                                              focusedBorder: InputBorder.none,
                                              enabledBorder: InputBorder.none,
                                              errorBorder: InputBorder.none,
                                              disabledBorder: InputBorder.none,
                                              hintText:
                                                  'Write a Description...',
                                              hintStyle: TextStyle(
                                                  color: grey_aaaaaa,
                                                  fontWeight: FontWeight.w500,
                                                  fontFamily:
                                                      helveticaNeueNeue_medium,
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
                                  height: 20.h,
                                ),

                                Text("RELATED TAGS",
                                    style: TextStyle(
                                        color: black_121212,
                                        fontWeight: FontWeight.w900,
                                        fontFamily: helvetica_neu_bold,
                                        letterSpacing: 0.7,
                                        fontStyle: FontStyle.normal,
                                        fontSize: 12.sp),
                                    textAlign: TextAlign.left),

                                SizedBox(
                                  height: 14.h,
                                ),

                                Container(
                                  decoration: SpinnerDecorationBorder,
                                  child: Padding(
                                    padding: EdgeInsets.only(left: 8.w),
                                    // child: Row(
                                    //   mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                    //   children: [
                                    // Container(
                                    //   decoration: BoxDecoration(
                                    //     borderRadius: BorderRadius.circular(40),
                                    //     color: Color(0xffebebeb),
                                    //   ),
                                    //   child: // Frame 8618

                                    //       Padding(
                                    //     padding: const EdgeInsets.only(
                                    //         left: 20, right: 20, top: 8, bottom: 8),
                                    //     child: Text("Tag name",
                                    //         style: TextStyle(
                                    //             color: Color(0xff3f3f3f),
                                    //             fontWeight: FontWeight.w700,
                                    //             fontFamily: "Inter",
                                    //             fontStyle: FontStyle.normal,
                                    //             fontSize: 12.sp),
                                    //         textAlign: TextAlign.left),
                                    //   ),
                                    // ),

                                    child: TagEditor(
                                      controller:
                                          controller.tagController.value,
                                      length: controller.tagValues.length,
                                      hasAddButton: true,
                                      resetTextOnSubmitted: true,
                                      delimiters: const [',', ' '],
                                      inputFormatters: <TextInputFormatter>[
                                        FilteringTextInputFormatter.allow(
                                            RegExp(r'^[a-z A-Z]+$')),
                                      ],
                                      inputDecoration: InputDecoration(
                                          border: InputBorder.none,
                                          hintText: 'Tag name',
                                          hintStyle: TextStyle(
                                            color: grey_aaaaaa,
                                            fontFamily:
                                                helveticaNeueNeue_medium,
                                            fontSize: 14.sp,
                                          )),
                                      onTagChanged: (newValue) {
                                        setState(() {
                                          controller.tagValues.add(newValue);
                                        });
                                      },
                                      onSubmitted: (newValue) {
                                        setState(() {
                                          controller.tagValues.add(newValue);
                                        });
                                      },
                                      tagBuilder: (context, index) =>
                                          ChipLayout(
                                        index: index,
                                        label: controller.tagValues[index],
                                        onDeleted: _onDelete,
                                      ),
                                    ),

                                    // ADD TAG
                                    // InkWell(
                                    //   onTap: (){
                                    //     setState(() {
                                    //       controller.tagValues.add(controller.tagController.value.text);
                                    //     });
                                    //   },
                                    //   child: Text("ADD TAG",
                                    //       style: TextStyle(
                                    //           color: Color(0xffff8819),
                                    //           fontWeight: FontWeight.w500,
                                    //           fontFamily: "Inter",
                                    //           fontStyle: FontStyle.normal,
                                    //           fontSize: 12.sp),
                                    //       textAlign: TextAlign.left),
                                    // )
                                    //   ],
                                    // ),
                                  ),
                                ),

                                SizedBox(
                                  height: 20.h,
                                ),

                                GestureDetector(
                                  onTap: () {
                                    setState(() {
                                      if (controller.isSearched.value == true) {
                                        controller.isSearched.value = false;
                                        checkNet(context).then((value) async {
                                          controller.PageNumber.value = 0;
                                          controller.userList.clear();
                                          await controller.userListAPI(
                                              context, false);

                                          Future.delayed(
                                              Duration(milliseconds: 500), () {
                                            for (var item
                                                in controller.userList) {
                                              for (var selectedItem
                                                  in controller.selectedList) {
                                                if (selectedItem.id ==
                                                    item.id) {
                                                  item.isSpeakerSelected =
                                                      selectedItem
                                                          .isSpeakerSelected;
                                                }
                                              }
                                            }
                                            setState(() {});
                                            displayRecurringOrderBottomSheet(
                                                context);
                                          });
                                        });
                                      } else {
                                        displayRecurringOrderBottomSheet(
                                            context);
                                      }
                                    });
                                  },
                                  child: Container(
                                    color: white_ffffff,
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        Text("TAG SPEAKERS",
                                            style: TextStyle(
                                                color: black_121212,
                                                fontWeight: FontWeight.w900,
                                                fontFamily: helvetica_neu_bold,
                                                letterSpacing: 0.7,
                                                fontStyle: FontStyle.normal,
                                                fontSize: 12.sp),
                                            textAlign: TextAlign.left),
                                        Padding(
                                          padding: const EdgeInsets.only(
                                              right: 18.5),
                                          child: Text(
                                            '+',
                                            style: TextStyle(
                                                fontSize: 20,
                                                fontWeight: FontWeight.w500,
                                                color: orange_ff881a),
                                          ),
                                        )
                                      ],
                                    ),
                                  ),
                                ),

                                controller.selectedList.isEmpty
                                    ? Container()
                                    : SizedBox(
                                        height: 14.h,
                                      ),

                                controller.selectedList.isEmpty
                                    ? Container()
                                    : SizedBox(
                                        height: 37.h,
                                        width:
                                            MediaQuery.of(context).size.width,
                                        child: ListView.builder(
                                            scrollDirection: Axis.horizontal,
                                            itemCount:
                                                controller.selectedList.length,
                                            itemBuilder: (context, index) {
                                              return Padding(
                                                padding: const EdgeInsets.only(
                                                    right: 8.0),
                                                child: Container(
                                                  decoration: BoxDecoration(
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              40),
                                                      color: grey_f5f5f5),
                                                  child: Padding(
                                                    padding:
                                                        const EdgeInsets.only(
                                                            left: 10,
                                                            right: 10,
                                                            top: 8,
                                                            bottom: 8),
                                                    child: Row(
                                                      mainAxisSize:
                                                          MainAxisSize.min,
                                                      mainAxisAlignment:
                                                          MainAxisAlignment
                                                              .center,
                                                      crossAxisAlignment:
                                                          CrossAxisAlignment
                                                              .center,
                                                      children: [
                                                        ClipRRect(
                                                          borderRadius:
                                                              BorderRadius
                                                                  .circular(50),
                                                          child: controller
                                                                      .selectedList[
                                                                          index]
                                                                      .image ==
                                                                  null
                                                              ? SvgPicture
                                                                  .asset(
                                                                  placeholder,
                                                                  height: 17.h,
                                                                  width: 17.w,
                                                                  fit: BoxFit
                                                                      .cover,
                                                                )
                                                              : CachedNetworkImage(
                                                                  imageUrl: controller
                                                                      .selectedList[
                                                                          index]
                                                                      .image!,
                                                                  height: 17.h,
                                                                  width: 17.w,
                                                                  fit: BoxFit
                                                                      .cover,
                                                                  progressIndicatorBuilder: (context,
                                                                          url,
                                                                          downloadProgress) =>
                                                                      SvgPicture
                                                                          .asset(
                                                                    placeholder,
                                                                    height:
                                                                        17.h,
                                                                    width: 17.w,
                                                                    fit: BoxFit
                                                                        .cover,
                                                                  ),
                                                                  errorWidget: (context,
                                                                          url,
                                                                          error) =>
                                                                      SvgPicture
                                                                          .asset(
                                                                    placeholder,
                                                                    height:
                                                                        17.h,
                                                                    width: 17.w,
                                                                    fit: BoxFit
                                                                        .cover,
                                                                  ),
                                                                ),
                                                        ),
                                                        SizedBox(
                                                          width: 5.w,
                                                        ),
                                                        Text(
                                                            "@${controller.selectedList[index].userName != null ? controller.selectedList[index].userName! : controller.selectedList[index].firstName ?? ""}",
                                                            style: TextStyle(
                                                                color:
                                                                    black_121212,
                                                                fontWeight:
                                                                    FontWeight
                                                                        .w700,
                                                                fontFamily:
                                                                    "Roboto",
                                                                fontStyle:
                                                                    FontStyle
                                                                        .normal,
                                                                fontSize:
                                                                    11.sp),
                                                            textAlign:
                                                                TextAlign.left),
                                                        SizedBox(
                                                          width: 5.w,
                                                        ),
                                                        InkWell(
                                                          onTap: () {
                                                            if (controller
                                                                    .selectedList
                                                                    .length ==
                                                                1) {
                                                              controller
                                                                  .selectedList
                                                                  .clear();
                                                              for (var item
                                                                  in controller
                                                                      .userList) {
                                                                if (item.isSpeakerSelected ==
                                                                    true) {
                                                                  item.isSpeakerSelected =
                                                                      false;
                                                                }
                                                              }
                                                            } else {
                                                              if (controller
                                                                      .selectedList[
                                                                          index]
                                                                      .id ==
                                                                  null) {
                                                                controller
                                                                    .selectedList
                                                                    .remove(controller
                                                                            .selectedList[
                                                                        index]);
                                                              } else {
                                                                var selectedIndex =
                                                                    controller
                                                                        .selectedList[
                                                                            index]
                                                                        .id;
                                                                for (var item
                                                                    in controller
                                                                        .userList) {
                                                                  if (selectedIndex ==
                                                                      item.id) {
                                                                    controller
                                                                        .selectedList
                                                                        .remove(
                                                                            item);
                                                                    item.isSpeakerSelected =
                                                                        false;
                                                                  }
                                                                }
                                                              }
                                                            }
                                                          },
                                                          child: const Icon(
                                                            Icons
                                                                .cancel_outlined,
                                                            size: 12,
                                                          ),
                                                        )
                                                      ],
                                                    ),
                                                  ),
                                                ),
                                              );
                                            }),
                                      ),
                                SizedBox(
                                  height: 100.h,
                                ),
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
            Padding(
              padding: const EdgeInsets.all(24.0),
              child: BlackButton("Next", Colors.white, () {
                if (controller.checkVideoValidation(context)) {
                  checkNet(context).then((value) {
                    controller.createVideoApi(context);
                  });
                }
              }),
            )
          ],
        ),
      ),
    );
  }

  _onDelete(index) {
    setState(() {
      controller.tagValues.removeAt(index);
    });
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();

    controller.searchController.value.text = "";
    controller.userList.clear();
    controller.selectedList.clear();
  }
}
