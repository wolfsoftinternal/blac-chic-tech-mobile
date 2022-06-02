import 'package:blackchecktech/Screens/Home/Profile/controller/AdmireProfileController.dart';
import 'package:blackchecktech/Screens/Home/Profile/view/VideoDetail.dart';
import 'package:blackchecktech/Styles/my_colors.dart';
import 'package:blackchecktech/Styles/my_icons.dart';
import 'package:blackchecktech/Utilities/TextUtilities.dart';
import 'package:flutter/material.dart';
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
          :  Padding(
              padding: const EdgeInsets.only(left: 24.0, right: 24.0),
              child: StaggeredGridView.countBuilder(
                crossAxisCount: 4,
                itemCount: controller.videoList.isEmpty ? 0 : controller.videoList.length,
                shrinkWrap: true,
                primary: false,
                itemBuilder: (BuildContext context, int index) {
                  return InkWell(
                    onTap: () {
                      Get.to(VideoDetail(id: controller.videoList[index].id));
                    },
                    child: Stack(
                      children: [
                        SizedBox(
                          height: 220,
                          child: FutureBuilder(
                            future: controller.initializeVideoPlayerFutureList[index],
                            builder: (context, snapshot) {
                              if (snapshot.connectionState ==
                                  ConnectionState.done) {
                                return AspectRatio(
                                  aspectRatio: controller.videoControllerList[index].value.aspectRatio,
                                  child: VideoPlayer(controller.videoControllerList[index]),
                                );
                              } else {
                                return Container();
                              }
                            },
                          ),
                        ),
                        Align(
                          alignment: Alignment.topRight,
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Container(
                              color: transparent,
                              height: 32,
                              width: 47,
                              child: Center(
                                child: setHelceticaBold(
                                   controller.videoList[index].duration ?? "00:00",
                                   12.0,
                                   white_ffffff,
                                   FontWeight.w500,
                                   FontStyle.normal
                                ),
                              ),
                            ),
                          ),
                        ),
                        Center(
                            child: InkWell(
                          onTap: () {
                            Get.to(VideoDetail(userId: widget.id,
                              id: controller.videoList[index].id));
                            // if (controller.videoController[index].value.isPlaying) {
                            //   setState(() {
                            //     controller.videoController[index].pause();
                            //   });
                            // } else {
                            //   setState(() {
                            //     controller.videoController[index].play();
                            //   });
                            // }
                          },
                          child: 
                          // controller.videoController[index].value.isPlaying
                            // ? Container(
                            //   height: 40,
                            //   width: 40,
                            //   decoration: BoxDecoration(
                            //     color: trans,
                            //     borderRadius: BorderRadius.circular(50.0),
                            //   ),
                            //   child: Icon(
                            //     Icons.pause, color: white_ffffff,
                            //     size: 20,
                            //   )
                            // )
                            // ? Container()
                            // : controller.videoController[index].value.position == controller.videoController[index].value.duration
                            SvgPicture.asset(icon_play)
                            // : SvgPicture.asset(icon_play)
                        )),
                        Padding(
                          padding: const EdgeInsets.only(left: 15, right: 15, bottom: 15.0),
                          child: Align(
                              alignment: Alignment.bottomLeft,
                              child: setHelceticaBold(
                                  controller.postList[index].caption!,
                                  12.0,
                                  white_ffffff,
                                  FontWeight.w500,
                                  FontStyle.normal)),
                        ),
                      ],
                    ),
                  );
                },
                staggeredTileBuilder: (int index) =>
                    StaggeredTile.count(2, index.isEven ? 2.6 : 2),
                mainAxisSpacing: 8.0,
                crossAxisSpacing: 8.0,
              )),
          )
    );
  }
}  