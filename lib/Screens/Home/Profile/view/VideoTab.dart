// ignore_for_file: prefer_const_constructors

import 'package:blackchecktech/Screens/Home/Profile/controller/AdmireProfileController.dart';
import 'package:blackchecktech/Screens/Home/Profile/view/EventListDetail.dart';
import 'package:blackchecktech/Screens/Home/Profile/view/VideoDetail.dart';
import 'package:blackchecktech/Styles/my_colors.dart';
import 'package:blackchecktech/Styles/my_icons.dart';
import 'package:blackchecktech/Utilities/Constant.dart';
import 'package:blackchecktech/Utilities/TextUtilities.dart';
import 'package:blackchecktech/Utils/CommonWidget.dart';
import 'package:blackchecktech/Widget/BlurIcon.dart';
import 'package:blur/blur.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:circular_profile_avatar/circular_profile_avatar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_html/flutter_html.dart';
import 'package:flutter_html/shims/dart_ui_real.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:video_player/video_player.dart';
import 'package:http/http.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';

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
          :  Padding(
                padding: EdgeInsets.only(left: 16.w, right: 16.w),
                child: ListView(
                  physics: ScrollPhysics(), // <-- this will disable scroll
                  shrinkWrap: true,
                  padding: EdgeInsets.all(0),
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        SizedBox(
                          height: 13.h,
                        ),
                        ListView.builder(
                            shrinkWrap: true,
                            primary: false,
                            itemCount: controller.eventList.length >= 7
                                ? 7
                                : controller.eventList.length,
                            padding: EdgeInsets.zero,
                            itemBuilder: (context, index) {
                              return Container(
                                height: 220.h,
                                child: GridTile(
                                  child: Stack(
                                    children: [
                                      SizedBox(
                                        height: 220.h,
                                        width: MediaQuery.of(context).size.width,
                                        child: 
                                        FittedBox(
                                          // fit: BoxFit.fill,
                                          child: ClipRRect(
                                            borderRadius: BorderRadius.all(
                                                        Radius.circular(8.r)),
                                            child: YoutubePlayerBuilder(
                                                    player: YoutubePlayer(
                                                      showVideoProgressIndicator: false,
                                                      // thumbnail: Image.network(controller.thumbnail[index]),
                                                      controller: YoutubePlayerController(initialVideoId: controller.videoId[index], flags: YoutubePlayerFlags(hideControls: true, autoPlay: false))
                                                      // controller
                                                      //     .videoController.value[index],
                                                    ),
                                                    builder: (context, player) {
                                                      return Column(
                                                        children: [
                                                          player,
                                                        ],
                                                      );
                                                    }
                                                    ),
                                          ),
                                        )
                                      ),
                                      InkWell(
                                        onTap: () {
                                          Get.to(VideoDetail(id: controller.videoList[index].id, userId: widget.id,))!.then((value) {
                                            dynamic videoBody = {
                                              'user_id': widget.id.toString(),
                                              'page': controller.videoPageNumber.toString()
                                            };
                                            controller.videoListAPI(context, videoBody);
                                          });
                                        },
                                        child: Container(
                                          height: 213.h,
                                          decoration: BoxDecoration(
                                            borderRadius: BorderRadius.circular(5.r),
                                                gradient: LinearGradient(
                                                    begin: Alignment.topCenter,
                                                    end: Alignment.bottomCenter,
                                                    colors: [
                                                      Color(0x00121212),
                                                      Color(0xff121212).withOpacity(0.8)
                                                    ])),
                                        ),
                                      ),
                                      Center(
                                        child: InkWell(
                                          onTap: () {
                                            Get.to(VideoDetail(id: controller.videoList[index].id, userId: widget.id,))!.then((value) {
                                              dynamic videoBody = {
                                                'user_id': widget.id.toString(),
                                                'page': controller.videoPageNumber.toString()
                                              };
                                              controller.videoListAPI(context, videoBody);
                                            });
                                          },child: BlurIcon()),
                                      ),                                    
                                    ],
                                  ),
                                  footer: Padding(
                                        padding: EdgeInsets.only(
                                            bottom: 28.w, left: 12.w, right: 12.w),
                                        child: Align(
                                          alignment: Alignment.bottomLeft,
                                          child: Text(
                                            controller.videoList[index].description.toString().capitalizeFirst ?? "",
                                            softWrap: true,
                                            overflow: TextOverflow.ellipsis,
                                            maxLines: 2,
                                            style: TextStyle(
                                                fontSize: 12.sp,
                                                fontFamily: helvetica_neu_bold,
                                                fontWeight: FontWeight.w600,
                                                color: white_ffffff,
                                                fontStyle: FontStyle.normal),
                                          ),
                                        ),
                                      ),
                                ),
                              );
                            }),
                        controller.videoList.length > 6 ?
                GestureDetector(
                      child: Padding(
                        padding:
                            const EdgeInsets.only(top: 8.0, bottom: 18.0),
                        child: InkWell(
                            onTap: () {
                             Get.to(VideoDetail(id: controller.videoList[0].id, userId: widget.id,));
                            },
                            child: Center(
                                child: setHelceticaBold(
                                    'See More',
                                    16,
                                    blue_0A84FF,
                                    FontWeight.w400,
                                    FontStyle.normal))),
                      ),
                    ) : Container()
                      ],
                    ),
                  ],
                ),
              ),
      ),
    );
  }
}

          // SingleChildScrollView(
          //   child: Column(
          //     children: [
                // SizedBox(height: 13.h,),
//                 Padding(
//                           padding:  EdgeInsets.only(top: 16.h, left: 16.w, right: 16.w),
//                   child: ListView(
//                     physics: ScrollPhysics(), // <-- this will disable scroll
//                   shrinkWrap: true,
//                   padding: EdgeInsets.all(0),
//                     children: [
//                       Column(
//                         children: [
//                           ListView.builder(
//                             itemCount: controller.videoList.length >= 6
//                                   ? 6
//                                   : controller.videoList.length,
//                             shrinkWrap: true,
//                             primary: false,
//                             padding: EdgeInsets.zero,
//                             itemBuilder: (BuildContext context, int index) {
//                               return GridTile(
//                                 child: Stack(
//                                   children: [
//                                     SizedBox(
//                                       height: 220.h,
//                                       width: MediaQuery.of(context).size.width,
//                                       child: 
//                                       FittedBox(
//                                         // fit: BoxFit.fill,
//                                         child: ClipRRect(
//                                           borderRadius: BorderRadius.all(
//                                                       Radius.circular(8.r)),
//                                           child: YoutubePlayerBuilder(
//                                                   player: YoutubePlayer(
//                                                     showVideoProgressIndicator: false,
//                                                     // thumbnail: Image.network(controller.thumbnail[index]),
//                                                     controller: YoutubePlayerController(initialVideoId: controller.videoId[index], flags: YoutubePlayerFlags(hideControls: true, autoPlay: false))
//                                                     // controller
//                                                     //     .videoController.value[index],
//                                                   ),
//                                                   builder: (context, player) {
//                                                     return Column(
//                                                       children: [
//                                                         player,
//                                                       ],
//                                                     );
//                                                   }
//                                                   ),
//                                         ),
//                                       )
//                                     ),
//                                     InkWell(
//                                       onTap: () {
//                                         Get.to(VideoDetail(id: controller.videoList[index].id, userId: widget.id,))!.then((value) {
//                                           dynamic videoBody = {
//                                             'user_id': widget.id.toString(),
//                                             'page': controller.videoPageNumber.toString()
//                                           };
//                                           controller.videoListAPI(context, videoBody);
//                                         });
//                                       },
//                                       child: Container(
//                                         height: 210.h,
//                                         decoration: BoxDecoration(
//                                           borderRadius: BorderRadius.circular(5.r),
//                                               gradient: LinearGradient(
//                                                   begin: Alignment.topCenter,
//                                                   end: Alignment.bottomCenter,
//                                                   colors: [
//                                                     Color(0x00121212),
//                                                     Color(0xff121212).withOpacity(0.8)
//                                                   ])),
//                                       ),
//                                     ),
//                                     Center(
//                                       child: InkWell(
//                                         onTap: () {
//                                           Get.to(VideoDetail(id: controller.videoList[index].id, userId: widget.id,))!.then((value) {
//                                             dynamic videoBody = {
//                                               'user_id': widget.id.toString(),
//                                               'page': controller.videoPageNumber.toString()
//                                             };
//                                             controller.videoListAPI(context, videoBody);
//                                           });
//                                         },child: BlurIcon()),
//                                     ),                                    
//                                   ],
//                                 ),
//                                 footer: Padding(
//                                       padding: EdgeInsets.only(
//                                           bottom: 28.w, left: 12.w, right: 12.w),
//                                       child: Align(
//                                         alignment: Alignment.bottomLeft,
//                                         child: Text(
//                                           controller.videoList[index].description.toString().capitalizeFirst ?? "",
//                                           softWrap: true,
//                                           overflow: TextOverflow.ellipsis,
//                                           maxLines: 2,
//                                           style: TextStyle(
//                                               fontSize: 12.sp,
//                                               fontFamily: helvetica_neu_bold,
//                                               fontWeight: FontWeight.w600,
//                                               color: white_ffffff,
//                                               fontStyle: FontStyle.normal),
//                                         ),
//                                       ),
//                                     ),
//                               );
//                             },
//                           ),
//                           controller.videoList.length > 6 ?
//                 GestureDetector(
//                       child: Padding(
//                         padding:
//                             const EdgeInsets.only(top: 8.0, bottom: 18.0),
//                         child: InkWell(
//                             onTap: () {
//                              Get.to(VideoDetail(id: controller.videoList[0].id, userId: widget.id,));
//                             },
//                             child: Center(
//                                 child: setHelceticaBold(
//                                     'See More',
//                                     16,
//                                     blue_0A84FF,
//                                     FontWeight.w400,
//                                     FontStyle.normal))),
//                       ),
//                     ) : Container()
//                         ],
//                       ),
//                     ],
//                   ),
//                 ),
                
//             //   ],
//             // ),
//           // ),
//           )
//     );
//   }
// }  