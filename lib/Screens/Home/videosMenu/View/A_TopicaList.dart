import 'package:blackchecktech/Screens/Home/videosMenu/Controller/videoMenuController.dart';
import 'package:blackchecktech/Screens/Home/videosMenu/Model/TopicModel.dart';
import 'package:blackchecktech/Styles/my_colors.dart';
import 'package:blackchecktech/Utilities/Constant.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class A_TopicaList extends StatefulWidget {
  A_TopicaList({Key? key}) : super(key: key);

  @override
  _A_TopicaListState createState() => _A_TopicaListState();
}

class _A_TopicaListState extends State<A_TopicaList> {
  VideoMenuController controller = Get.find<VideoMenuController>();
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    if (mounted) {
      controller.isLoading.value = false;
      controller.isLoadingButton.value = false;
    }
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    if (mounted) {
      controller.isLoading.value = false;
      controller.isLoadingButton.value = false;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
    child: Column(
      children: [
        Obx(
          () => controller.allTopicData.length == 0
              ? SizedBox(
                  height: MediaQuery.of(context).size.height * 0.5,
                  width: double.infinity,
                  child: const Center(
                      child: Text("No Data Found",
                          style: TextStyle(
                              color: grey_aaaaaa,
                              fontWeight: FontWeight.w500,
                              fontFamily: helveticaNeueNeue_medium,
                              fontStyle: FontStyle.normal,
                              fontSize: 14))),
                )
              : ListView.builder(
                  primary: false,
                  shrinkWrap: true,
                  padding: EdgeInsets.only(top: 20.h),
                  itemCount: controller.allTopicData.length,
                  itemBuilder: (context, i) => // Activism
                      InkWell(
                        onTap: () {
                          if (!controller.selectMutiTopicList
                              .contains(controller.allTopicData[i])) {
                            controller.selectMutiTopicList
                                .add(controller.allTopicData[i]);
                          } else {
                            controller.selectMutiTopicList
                                .remove(controller.allTopicData[i]);
                          }
                          setState(() {});
                        },
                        child: Padding(
                          padding: EdgeInsets.only(bottom: 16.h),
                          child: Row(
                              mainAxisAlignment:
                                  MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                    controller.allTopicData[i].name
                                        .toString(),
                                    style: TextStyle(
                                        color: black_121212,
                                        fontWeight: FontWeight.w700,
                                        fontFamily: "NeueHelvetica",
                                        fontStyle: FontStyle.normal,
                                        fontSize: 14.sp),
                                    textAlign: TextAlign.left),
                                controller.selectMutiTopicList.contains(
                                        controller.allTopicData[i])
                                    ? const Icon(Icons.check, size: 18,)
                                    : const SizedBox()
                              ]),
                        ),
                      )),
        ),
      ],
    ),
      ),
    );
  }
}
