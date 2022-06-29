import 'package:blackchecktech/Screens/Home/CreateEvent/view/CreateEvent.dart';
import 'package:blackchecktech/Screens/Home/CreatePost/view/CreatPost.dart';
import 'package:blackchecktech/Screens/Home/CreateVideo/view/UploadVideoDetail.dart';
import 'package:blackchecktech/Screens/Home/Profile/controller/AdmireProfileController.dart';
import 'package:blackchecktech/Styles/my_colors.dart';
import 'package:blackchecktech/Styles/my_icons.dart';
import 'package:blackchecktech/Utilities/TextUtilities.dart';
import 'package:blackchecktech/Utils/internet_connection.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';

createBottomSheet(context, userId) {
  AdmireProfileController controller = Get.put(AdmireProfileController());

  showModalBottomSheet(
      isScrollControlled: true,
      backgroundColor: Colors.transparent,
      context: context,
      builder: (ctx) {
        return Container(
            decoration: const BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(16.0),
                    topRight: Radius.circular(16.0))),
            child: SingleChildScrollView(
              child: Wrap(
                children: [
                  StatefulBuilder(builder: (context, setState) {
                    return Column(
                      children: [
                         SizedBox(
                          height: 8.h,
                        ),
                        Align(
                            alignment: Alignment.center,
                            child: Container(
                              width: 50,
                              height: 3,
                              decoration: BoxDecoration(
                                  color: grey_3f3f3f.withOpacity(0.4),
                                  borderRadius: const BorderRadius.all(
                                    Radius.circular(50),
                                  )),
                            )),
                        const SizedBox(
                          height: 25,
                        ),
                        setHelceticaBold("CREATE", 16.sp, black_121212,
                            FontWeight.w900, FontStyle.normal, 1.6),
                        SizedBox(height: 15.5,),
                        Divider(
                          color: Color(0xfff4f6f6),
                          height: 1,
                          thickness: 1,
                        ),
                        Padding(
                          padding:  EdgeInsets.only(left: 36.w, right: 36.w,top: 35.5.h,bottom: 19.5.h),
                          child: InkWell(
                            onTap: () {
                              Get.back();
                              Get.to(const CreatePost())!.then((value) => {
                                    checkNet(context).then((value) {
                                      dynamic body = {
                                        'user_id': userId.toString()
                                      };
                                      controller.postListAPI(context, body);
                                    })
                                  });
                                  setState((){});
                            },
                            child: Row(
                              children: [
                                SvgPicture.asset(create_post),
                                const SizedBox(
                                  width: 16,
                                ),
                                setHelceticaBold("Posts", 16, black_121212,
                                    FontWeight.w500, FontStyle.normal, -0.32),
                              ],
                            ),
                          ),
                        ),
                        Divider(
                          color: Color(0xfff4f6f6),
                          height: 1,
                          thickness: 1,
                          endIndent: 24.w,
                          indent: 24.w,
                        ),
                        Padding(
                          padding:  EdgeInsets.only(left: 36.w, right: 36.w,top: 19.5.h,bottom: 19.5.h),
                          child: InkWell(
                            onTap: () {
                              Get.back();
                              Get.to(const UploadVideoDetail())!.then((value) => {
                                    checkNet(context).then((value) {
                                      dynamic body = {
                                        'user_id': userId.toString()
                                      };
                                      controller.videoListAPI(context, body);
                                    })
                                  });
                                  setState((){});
                            },
                            child: Row(
                              children: [
                                SvgPicture.asset(create_video),
                                const SizedBox(
                                  width: 16,
                                ),
                                setHelceticaBold("Videos", 16, black_121212,
                                    FontWeight.w500, FontStyle.normal, -0.32),
                              ],
                            ),
                          ),
                        ),
                        Divider(
                          color: Color(0xfff4f6f6),
                          height: 1,
                          thickness: 1,
                          endIndent: 24.w,
                          indent: 24.w,
                        ),
                        Padding(
                          padding:  EdgeInsets.only(left: 36.w, right: 36.w,top: 19.5.h,bottom: 30.h),
                          child: InkWell(
                            onTap: () {
                              Get.back();
                              Get.to(const CreateEvent())!.then((value) => {
                                    checkNet(context).then((value) {
                                      dynamic body = {
                                        'user_id': userId.toString()
                                      };
                                      controller.eventListAPI(context, body);
                                    })
                                  });
                              setState((){});
                            },
                            child: Row(
                              children: [
                                SvgPicture.asset(create_event),
                                const SizedBox(
                                  width: 16,
                                ),
                                setHelceticaBold("Events", 16, black_121212,
                                    FontWeight.w500, FontStyle.normal, -0.32),
                              ],
                            ),
                          ),
                        )
                      ],
                    );
                  }),
                ],
              ),
            ));
      });
}
