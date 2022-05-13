import 'package:blackchecktech/Layout/ToolbarWithHeaderTitle.dart';
import 'package:blackchecktech/Screens/Home/Profile/controller/AdmireProfileController.dart';
import 'package:blackchecktech/Styles/my_colors.dart';
import 'package:blackchecktech/Styles/my_icons.dart';
import 'package:blackchecktech/Utilities/Constant.dart';
import 'package:blackchecktech/Utilities/TextUtilities.dart';
import 'package:blackchecktech/Utils/internet_connection.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';

class PostDetail extends StatefulWidget {
  final id;
  const PostDetail({Key? key, this.id}) : super(key: key);

  @override
  State<PostDetail> createState() => _PostDetailState();
}

class _PostDetailState extends State<PostDetail> {
  AdmireProfileController controller = Get.put(AdmireProfileController());

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    dynamic body = {
      'post_id': widget.id.toString(),
    };
    checkNet(context).then((value) {
      controller.postListAPI(context, body);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: white_ffffff,
      body: Obx(
        () => Column(children: [
          SizedBox(
            height: 60,
          ),
          ToolbarWithHeaderTitle("POST"),
          Expanded(
            child: ListView.builder(
                shrinkWrap: true,
                primary: false,
                itemCount: controller.postDetailList.length,
                itemBuilder: (context, index) {
                  return Padding(
                    padding: const EdgeInsets.only(
                        left: 24.0, right: 24.0, bottom: 24.0),
                    child: Container(
                      decoration: BoxDecoration(
                        color: white_ffffff,
                        boxShadow: [
                          BoxShadow(
                            color: Color(0x17747796).withOpacity(0.07),
                            spreadRadius: 10,
                            blurRadius: 5,
                            offset: Offset(0, -10), // changes position of shadow
                          ),
                        ],
                        borderRadius: BorderRadius.all(const Radius.circular(5)),
                      ),
                      child: Padding(
                        padding: const EdgeInsets.all(20.0),
                        child: Column(
                          children: [
                            Stack(
                              children: [
                                Container(
                                  height: 300,
                                  width: MediaQuery.of(context).size.width,
                                  child: controller.postDetailList[index].image == null
                                      ? ClipRRect(
                                          borderRadius: BorderRadius.all(
                                              const Radius.circular(5)),
                                          child: SvgPicture.asset(
                                            placeholder,
                                            fit: BoxFit.fill,
                                          ),
                                        )
                                      : ClipRRect(
                                          borderRadius: BorderRadius.all(
                                              const Radius.circular(5)),
                                          child: CachedNetworkImage(
                                            imageUrl:
                                                controller.postDetailList[index].image!,
                                            fit: BoxFit.fill,
                                            progressIndicatorBuilder: (context,
                                                    url, downloadProgress) =>
                                                SvgPicture.asset(
                                              placeholder,
                                              fit: BoxFit.fill,
                                            ),
                                            errorWidget: (context, url, error) =>
                                                SvgPicture.asset(
                                              placeholder,
                                              fit: BoxFit.fill,
                                            ),
                                          ),
                                        ),
                                ),
                                Positioned(
                                  bottom: 15,
                                  left: 15,
                                  child: Container(
                                    height: 40,
                                    width: 120,
                                    decoration: BoxDecoration(
                                      gradient: LinearGradient(colors: [
                                        Color(0xff1c2535),
                                        Color(0xff04080f)
                                      ]),
                                      borderRadius: BorderRadius.all(
                                          const Radius.circular(40)),
                                    ),
                                    child: Padding(
                                      padding: const EdgeInsets.only(left: 8.0, right: 8.0),
                                      child: Row(
                                        children: [
                                          GestureDetector(child: Icon(Icons.heart_broken, color: Colors.red,)),
                                          SizedBox(width: 8,),
                                          setHelceticaBold("1,2k liked", 14, white_ffffff, FontWeight.w500, FontStyle.normal)
                                        ],
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                            SizedBox(
                              height: 15,
                            ),
                            Align(
                              alignment: Alignment.topLeft,
                              child: Text.rich(
                                TextSpan(
                                  children: [
                                    TextSpan(
                                      text:
                                          "@${controller.postDetailList[index].address!} ",
                                      style: TextStyle(
                                          fontSize: 14,
                                          fontFamily: helvetica_neu_bold,
                                          fontWeight: FontWeight.w600,
                                          color: black_121212,
                                      ),
                                    ),
                                    TextSpan(
                                      text: controller.postDetailList[index].caption!,
                                      style: TextStyle(
                                          fontSize: 14,
                                          fontFamily: helveticaNeueNeue_medium,
                                          fontWeight: FontWeight.w400,
                                          color: black_121212
                                      )
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  );
                }),
          ),
        ]),
      ),
    );
  }
}
