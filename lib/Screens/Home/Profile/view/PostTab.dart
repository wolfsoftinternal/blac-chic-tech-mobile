import 'package:blackchecktech/Screens/Home/Profile/controller/AdmireProfileController.dart';
import 'package:blackchecktech/Screens/Home/Profile/view/PostDetail.dart';
import 'package:blackchecktech/Styles/my_colors.dart';
import 'package:blackchecktech/Styles/my_icons.dart';
import 'package:blackchecktech/Utilities/Constant.dart';
import 'package:blackchecktech/Utilities/TextUtilities.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';

class PostTab extends StatefulWidget {
  final id;
  const PostTab({this.id, Key? key}) : super(key: key);

  @override
  State<PostTab> createState() => _PostTabState();
}

class _PostTabState extends State<PostTab> {
  AdmireProfileController controller = Get.put(AdmireProfileController());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: white_ffffff,
      body: Obx(
        () => controller.postList.isEmpty
            ? SizedBox(
                width: double.infinity,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Image.asset(
                      img_logo,
                      height: 80.h,
                      width: 80.w,
                    ),
                    setHelceticaBold("NO POSTS YET", 16.sp, grey_aaaaaa,
                        FontWeight.w500, FontStyle.normal, 0.5)
                  ],
                ),
              )
            : ListView(
                physics: ScrollPhysics(), // <-- this will disable scroll
                shrinkWrap: true,
                padding: EdgeInsets.all(0),
                children: [
                  Padding(
                      padding: EdgeInsets.only(left: 24.w, right: 24.w),
                      child: StaggeredGridView.countBuilder(
                        crossAxisCount: 4,
                        itemCount: controller.postList.length >= 10
                            ? 10
                            : controller.postList.length,
                        shrinkWrap: true,
                        primary: false,
                        itemBuilder: (BuildContext context, int index) =>
                            GestureDetector(
                          onTap: () {
                            Get.to(PostDetail(
                                userId: widget.id,
                                id: controller.postList[index].id));
                          },
                          child: GridTile(
                            child: Stack(
                              children: [
                                Container(
                                  child: controller.postList[index].image ==
                                          null
                                      ? ClipRRect(
                                          borderRadius: BorderRadius.all(
                                              Radius.circular(5.r)),
                                          child: SvgPicture.asset(
                                            placeholder,
                                            fit: BoxFit.cover,
                                            height: 220.h,
                                          ),
                                        )
                                      : ClipRRect(
                                          borderRadius: BorderRadius.all(
                                              Radius.circular(5.r)),
                                          child: CachedNetworkImage(
                                            imageUrl: controller
                                                .postList[index].image!,
                                            fit: BoxFit.cover,
                                            height: 220.h,
                                            progressIndicatorBuilder: (context,
                                                    url, downloadProgress) =>
                                                SvgPicture.asset(
                                              placeholder,
                                              fit: BoxFit.cover,
                                              height: 220.h,
                                            ),
                                            errorWidget:
                                                (context, url, error) =>
                                                    SvgPicture.asset(
                                              placeholder,
                                              fit: BoxFit.cover,
                                              height: 220.h,
                                            ),
                                          ),
                                        ),
                                ),
                                Container(
                                  width: MediaQuery.of(context).size.width,
                                  height: 220.h,
                                  decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(5.r),
                                      gradient: LinearGradient(
                                          begin: Alignment.topCenter,
                                          end: Alignment.bottomCenter,
                                          colors: [
                                            Color(0x00121212),
                                            Color(0xff121212)
                                          ])),
                                ),
                              ],
                            ),
                            footer: Padding(
                              padding: EdgeInsets.only(
                                  bottom: 12.w, left: 12.w, right: 12.w),
                              child: Align(
                                alignment: Alignment.bottomLeft,
                                child: Text(
                                  controller.postList[index].caption!,
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
                          ),
                        ),
                        staggeredTileBuilder: (int index) =>
                            StaggeredTile.count(2, index.isEven ? 2.6 : 2),
                        mainAxisSpacing: 23.h,
                        crossAxisSpacing: 23.w,
                      )),
                ],
              ),
      ),
    );
  }
}
