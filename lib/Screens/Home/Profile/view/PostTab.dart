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
            : SingleChildScrollView(
              child: Column(
                children: [
                  SizedBox(height: 13.h,),
                  ListView(
                    primary: false,
                      shrinkWrap: true,
                      padding: EdgeInsets.zero,
                      children: [
                        Padding(
                            padding: EdgeInsets.only(left: 16.w, right: 16.w),
                            child: StaggeredGridView.countBuilder(
                              crossAxisCount: 4,
                              itemCount: controller.postList.length >= 6
                                  ? 6
                                  : controller.postList.length,
                              shrinkWrap: true,
                              primary: false,
                              padding: EdgeInsets.zero,
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
                                                  height: 250.h,
                                                ),
                                              )
                                            : ClipRRect(
                                                borderRadius: BorderRadius.all(
                                                    Radius.circular(5.r)),
                                                child: CachedNetworkImage(
                                                  imageUrl: controller
                                                      .postList[index].image!,
                                                  fit: BoxFit.cover,
                                                  height: 250.h,
                                                  progressIndicatorBuilder: (context,
                                                          url, downloadProgress) =>
                                                      SvgPicture.asset(
                                                    placeholder,
                                                    fit: BoxFit.cover,
                                                    height: 250.h,
                                                  ),
                                                  errorWidget:
                                                      (context, url, error) =>
                                                          SvgPicture.asset(
                                                    placeholder,
                                                    fit: BoxFit.cover,
                                                    height: 250.h,
                                                  ),
                                                ),
                                              ),
                                      ),
                                      Container(
                                        width: MediaQuery.of(context).size.width,
                                        height: 250.h,
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
                                  StaggeredTile.count(2, index.isEven ? 2.8 : 2.1),
                              mainAxisSpacing: 23.h,
                              crossAxisSpacing: 23.w,
                            )),
                      ],
                    ),
                    controller.postList.length > 6 ?
                    GestureDetector(
                      child: Padding(
                        padding:
                            const EdgeInsets.only(top: 8.0, bottom: 18.0),
                        child: InkWell(
                            onTap: () {
                             Get.to(PostDetail(
                                  userId: widget.id,
                                  id: controller.postList[0].id));
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
            ),
      ),
    );
  }
}
