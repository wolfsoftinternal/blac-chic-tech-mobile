import 'package:blackchecktech/Screens/Home/Profile/controller/AdmireProfileController.dart';
import 'package:blackchecktech/Styles/my_colors.dart';
import 'package:blackchecktech/Styles/my_icons.dart';
import 'package:blackchecktech/Utilities/TextUtilities.dart';
import 'package:blackchecktech/Utils/share_predata.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';

class EventTab extends StatefulWidget {
  EventTab({Key? key}) : super(key: key);

  @override
  State<EventTab> createState() => _EventTabState();
}

class _EventTabState extends State<EventTab> {
  AdmireProfileController controller = Get.put(AdmireProfileController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: white_ffffff,
      body: Obx(
        () => Padding(
          padding: const EdgeInsets.only(left: 24.0, right: 24.0),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                SizedBox(
                  height: 32,
                ),
                setHelceticaBold('Upcomming Events', 14, black_121212, FontWeight.w500, FontStyle.normal, -0.56),
                SizedBox(
                  height: 32,
                ),
                ListView.builder(
                  shrinkWrap: true,
                  primary: false,
                  itemCount: controller.eventList.length,
                  padding: EdgeInsets.zero,
                  itemBuilder: (context, index) {
                    return Padding(
                      padding: const EdgeInsets.only(bottom: 32.0),
                      child: Stack(
                        children: [
                          Container(
                            width: 343,
                            height: 207,
                            child: controller.eventList[index].poster == null
                              ? ClipRRect(
                                borderRadius: BorderRadius.all(const Radius.circular(5)),
                                child: SvgPicture.asset(
                                    placeholder,
                                    fit: BoxFit.cover,
                                    width: 343,
                                    height: 207,
                                  ),
                              )
                              : ClipRRect(
                                borderRadius: BorderRadius.all(const Radius.circular(5)),
                                child: CachedNetworkImage(
                                  imageUrl: controller.eventList[index].poster!,
                                  fit: BoxFit.cover,
                                  width: 343,
                                  height: 207,
                                  progressIndicatorBuilder:
                                      (context, url, downloadProgress) =>
                                          SvgPicture.asset(
                                    placeholder,
                                    fit: BoxFit.cover,
                                    width: 343,
                                    height: 207,
                                  ),
                                  errorWidget: (context, url, error) =>
                                      SvgPicture.asset(
                                    placeholder,
                                    fit: BoxFit.cover,
                                    width: 343,
                                    height: 207,
                                  ),
                                ),
                              ),
                          ),
                          Align(
                            alignment: Alignment.topRight,
                            child: Padding(
                              padding: const EdgeInsets.only(top: 8.0, right: 8.0),
                              child: Container(
                                height: 29,
                                width: 133,
                                decoration: BoxDecoration(
                                  gradient: LinearGradient(colors: [
                                    Color(0xff1c2535),
                                    Color(0xff04080f)
                                  ]),
                                  borderRadius: BorderRadius.all(const Radius.circular(4)),
                                ),
                                child: Row(
                                  children: [
                                    Padding(
                                      padding: const EdgeInsets.only(left: 6.0, right: 6.0),
                                      child: Icon(Icons.person, size: 17, color: grey_aaaaaa,),
                                    ),
                                    setHelceticaBold(controller.eventList[index].hosts![0].fullName!, 11, white_ffffff, FontWeight.w500, FontStyle.normal, -0.22),
                                  ],
                                )
                              ),
                            ),
                          ),
                          Positioned(
                            bottom: 19,
                            child: Padding(
                              padding: const EdgeInsets.only(left: 16.0),
                              child: Row(
                                children: [
                                  SvgPicture.asset(calendar_icon, height: 12, width: 12,),
                                  Padding(
                                    padding: const EdgeInsets.only(left: 4.0),
                                    child: setHelceticaBold('${DateFormat("MMM dd, yyyy").format(controller.eventList[index].startDateTime!)} at ${DateFormat("hh:mm a").format(controller.eventList[index].startDateTime!)}',
                                      10, white_ffffff, FontWeight.w500, FontStyle.normal, -0.4
                                    ),
                                  ),
                                ],
                              ),
                            )
                          ),
                          Positioned(
                            bottom: 19,
                            right: 16,
                            child: Padding(
                              padding: const EdgeInsets.only(left: 16.0),
                              child: Row(
                                children: [
                                  Padding(
                                    padding: const EdgeInsets.only(right: 4.0),
                                    child: setHelceticaBold(controller.eventList[index].venue!, 10, white_ffffff, FontWeight.w500, FontStyle.normal, -0.4),
                                  ),
                                  SvgPicture.asset(icon_location, height: 12, width: 12,),
                                ],
                              ),
                            )
                          ),
                          Positioned(
                            bottom: 40,
                            child: Padding(
                              padding: const EdgeInsets.only(left: 16.0),
                              child: setHelceticaBold(controller.eventList[index].title!, 22, white_ffffff, FontWeight.w500, FontStyle.normal, -0.88),
                            )
                          ),
                        ],
                      ),
                    );
                  }
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
