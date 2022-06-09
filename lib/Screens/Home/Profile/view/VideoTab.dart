// ignore_for_file: prefer_const_constructors

import 'package:blackchecktech/Screens/Home/Profile/controller/AdmireProfileController.dart';
import 'package:blackchecktech/Screens/Home/Profile/view/VideoDetail.dart';
import 'package:blackchecktech/Styles/my_colors.dart';
import 'package:blackchecktech/Styles/my_icons.dart';
import 'package:blackchecktech/Utilities/Constant.dart';
import 'package:blackchecktech/Utilities/TextUtilities.dart';
import 'package:flutter/material.dart';
import 'package:flutter_html/flutter_html.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:video_player/video_player.dart';

class VideoTab extends StatefulWidget {
  final id;
  const VideoTab({Key? key, this.id}) : super(key: key);

  @override
  State<VideoTab> createState() => _VideoTabState();
}

class _VideoTabState extends State<VideoTab> {
  AdmireProfileController controller = Get.put(AdmireProfileController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: white_ffffff,
      body:
        Obx(
          () => controller.videoList.isEmpty
          ? SizedBox(
            width: double.infinity,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Image.asset(img_logo, height: 80, width: 80,),
                setHelceticaBold("NO VIDEOS YET", 16, grey_aaaaaa, FontWeight.w500, FontStyle.normal, 0.5)
              ],
            ),
          )
          :  ListView(
            physics: ScrollPhysics(), // <-- this will disable scroll
          shrinkWrap: true,
          padding: EdgeInsets.all(0),
            children: [
              Padding(
                  padding: const EdgeInsets.only(left: 24.0, right: 24.0),
                  child: StaggeredGridView.countBuilder(
                    crossAxisCount: 4,
                  //  physics : NeverScrollableScrollPhysics(),
                    itemCount: controller.videoList.isEmpty ? 0 : controller.videoList.length,
                    shrinkWrap: true,
                    primary: false,
                    itemBuilder: (BuildContext context, int index) {
                      return GridTile(
                        child: Stack(
                          children: [
                            SizedBox(
                              height: 220,
                              width: MediaQuery.of(context).size.width,
                              child: controller
                                          .videoList[index].embededCode ==
                                      null
                                  ? Center(
                                      child: SizedBox(
                                      height: 20,
                                      width: 20,
                                      child: CircularProgressIndicator(
                                        strokeWidth: 2,
                                        valueColor:
                                            AlwaysStoppedAnimation<Color>(
                                                Color(0xff04080f)),
                                      ),
                                    ))
                                  : FittedBox(
                                    fit: BoxFit.fill,
                                    child: Html(
                                        data: controller
                                            .videoList[index].embededCode
                                            .toString()),
                                  ),
                            ),
                            InkWell(
                              onTap: () {
                                Get.to(VideoDetail(id: controller.videoList[index].id));
                              },
                              child: Padding(
                                padding: const EdgeInsets.only(top: 3.0, bottom: 3, left: 3.0, right: 3.0),
                                child: Container(
                                  height: 220,
                                  decoration: BoxDecoration(
                                        gradient: LinearGradient(
                                            begin: Alignment.topCenter,
                                            end: Alignment.bottomCenter,
                                            colors: [
                                              Color(0x00121212),
                                              Color(0xff121212)
                                            ])),
                                ),
                              ),
                            ),
                            // Align(
                            //   alignment: Alignment.topRight,
                            //   child: Padding(
                            //     padding: const EdgeInsets.all(8.0),
                            //     child: Container(
                            //       color: transparent,
                            //       height: 32,
                            //       width: 47,
                            //       child: Center(
                            //         child: setHelceticaBold(
                            //            "00:00",
                            //            12.0,
                            //            white_ffffff,
                            //            FontWeight.w500,
                            //            FontStyle.normal
                            //         ),
                            //       ),
                            //     ),
                            //   ),
                            // ),
                            
                          ],
                        ),
                        footer: Padding(
                              padding: EdgeInsets.only(
                                  bottom: 12.w, left: 12.w, right: 12.w),
                              child: Align(
                                alignment: Alignment.bottomLeft,
                                child: Text(
                                  controller.videoList[index].description ?? "",
                                  softWrap: true,
                                  overflow: TextOverflow.ellipsis,
                                  maxLines: 3,
                                  style: TextStyle(
                                      fontSize: 12.sp,
                                      fontFamily: helvetica_neu_bold,
                                      fontWeight: FontWeight.w600,
                                      color: white_ffffff,
                                      fontStyle: FontStyle.normal),
                                ),
                              ),
                            ),
                      );
                    },

                    staggeredTileBuilder: (int index) =>
                        StaggeredTile.count(2, index.isEven ? 2.6 : 2),
                    mainAxisSpacing: 8.0,

                    crossAxisSpacing: 8.0,
                  )),
            ],
          ),
          )
    );
  }
}  