import 'package:blackchecktech/Screens/Home/Profile/controller/AdmireProfileController.dart';
import 'package:blackchecktech/Screens/Home/Profile/view/PostDetail.dart';
import 'package:blackchecktech/Styles/my_colors.dart';
import 'package:blackchecktech/Styles/my_icons.dart';
import 'package:blackchecktech/Utilities/TextUtilities.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
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
              Image.asset(img_logo, height: 80, width: 80,),
              setHelceticaBold("NO POSTS YET", 16, grey_aaaaaa, FontWeight.w500, FontStyle.normal, 0.5)
            ],
          ),
        )
        : Padding(
            padding: const EdgeInsets.only(left: 24.0, right: 24.0),
            child: StaggeredGridView.countBuilder(
              crossAxisCount: 4,
              itemCount: controller.postList.length,
              shrinkWrap: true,
              primary: false,
              itemBuilder: (BuildContext context, int index) => 
              GestureDetector(
                onTap: (){
                  Get.to(PostDetail(userId: widget.id,
                    id: controller.postList[index].id));
                },
                child: Stack(
                  children: [
                    Container(
                      child: controller.postList[index].image == null
                      ? ClipRRect(
                        borderRadius: const BorderRadius.all(Radius.circular(5)),
                        child: SvgPicture.asset(
                            placeholder,
                             fit: BoxFit.cover,
                             height: 220,
                          ),
                      )
                      : ClipRRect(
                          borderRadius: const BorderRadius.all(Radius.circular(5)),
                        child: CachedNetworkImage(
                            imageUrl: controller.postList[index].image!,
                            fit: BoxFit.cover,
                            height: 220,
                            progressIndicatorBuilder:
                                (context, url, downloadProgress) =>
                                    SvgPicture.asset(
                              placeholder,
                               fit: BoxFit.cover,
                               height: 220,
                            ),
                            errorWidget: (context, url, error) =>
                                SvgPicture.asset(
                              placeholder,
                               fit: BoxFit.cover,
                               height: 220,
                            ),
                          ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(bottom: 15.0),
                      child: Align(
                        alignment: Alignment.bottomCenter,
                        child: setHelceticaBold(controller.postList[index].caption!, 12.0, white_ffffff, FontWeight.w500, FontStyle.normal)
                      ),
                    ),
                  ],
                ),
              ),
              staggeredTileBuilder: (int index) =>
                  StaggeredTile.count(2, index.isEven ? 2.6 : 2),
              mainAxisSpacing: 8.0,
              crossAxisSpacing: 8.0,
            )
        ),
      ),
    );
  }
}
