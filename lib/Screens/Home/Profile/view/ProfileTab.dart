import 'package:blackchecktech/Screens/Home/Profile/controller/AdmireProfileController.dart';
import 'package:blackchecktech/Styles/my_colors.dart';
import 'package:blackchecktech/Styles/my_icons.dart';
import 'package:blackchecktech/Utilities/TextUtilities.dart';
import 'package:blackchecktech/Utils/share_predata.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';

class ProfileTab extends StatefulWidget {
  ProfileTab({Key? key}) : super(key: key);

  @override
  State<ProfileTab> createState() => _ProfileTabState();
}

class _ProfileTabState extends State<ProfileTab> {
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
                setHelceticaBold('About Me', 16, black_121212, FontWeight.w600, FontStyle.normal, -0.32),
                 SizedBox(
                  height: 32,
                ),
                controller.details.value.pastJobs!.isNotEmpty
                ? Padding(
                  padding: const EdgeInsets.only(bottom: 16.0),
                  child: Container(
                    decoration: BoxDecoration(
                      color: white_ffffff,
                       border: Border.all(color: light_grey_f2f2f2)
                    ),
                    child: Padding(
                      padding: const EdgeInsets.only(bottom: 4.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(top: 16.0, left: 16.0),
                            child: setHelceticaBold('PAST JOBS', 12, black_121212, FontWeight.w600, FontStyle.normal, -0.24),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(top: 12.0, left: 16.0),
                            child: Expanded(
                              flex: 1,
                              child: ListView.builder(
                                padding: EdgeInsets.zero,
                                shrinkWrap: true,
                                itemCount: controller.details.value.pastJobs!.length,
                                itemBuilder: (context, index) {
                                  return Padding(
                                    padding: const EdgeInsets.only(bottom: 12.0),
                                    child: Row(
                                      children: [
                                        ClipRRect(
                                          borderRadius: BorderRadius.circular(50),
                                          child: controller.details.value.pastJobs![index].logo == null
                                          ? SvgPicture.asset(
                                            placeholder,
                                            height: 32,
                                            width: 32,
                                            fit: BoxFit.cover,
                                          )
                                          : CachedNetworkImage(
                                            imageUrl: controller.details.value.pastJobs![index].logo,
                                            height: MediaQuery.of(context).size.height * .78, width: double.infinity,
                                            fit: BoxFit.cover,
                                            progressIndicatorBuilder: (context, url, downloadProgress) => SvgPicture.asset(placeholder, height: MediaQuery.of(context).size.height * .78, width: double.infinity, fit: BoxFit.cover,),
                                            errorWidget: (context, url, error) => SvgPicture.asset(placeholder, height: MediaQuery.of(context).size.height * .78, width: double.infinity, fit: BoxFit.cover,),
                                          ),
                                        ),
                                        controller.details.value.pastJobs![index].title != null
                                        ? Padding(
                                          padding: const EdgeInsets.only(left: 12.0),
                                          child: setHelveticaMedium(controller.details.value.pastJobs![index].title!.toUpperCase() + " @" + controller.details.value.pastJobs![index].companyName!, 16, grey_aaaaaa, FontWeight.w500, FontStyle.normal, -0.28),
                                        ) : Container(),
                                      ],
                                    ),
                                  );
                                }
                              ),
                            ),
                          )
                        ],
                      ),
                    ),
                  ),
                ) : Container(),
                controller.details.value.educations!.isNotEmpty
                ? Padding(
                  padding: const EdgeInsets.only(bottom: 16.0),
                  child: Container(
                    decoration: BoxDecoration(
                      color: white_ffffff,
                       border: Border.all(color: light_grey_f2f2f2)
                    ),
                    child: Padding(
                      padding: const EdgeInsets.only(bottom: 4.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(top: 16.0, left: 16.0),
                            child: setHelceticaBold('EDUCATION', 12, black_121212, FontWeight.w600, FontStyle.normal, -0.24),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(top: 12.0, left: 16.0),
                            child: Expanded(
                              flex: 1,
                              child: ListView.builder(
                                padding: EdgeInsets.zero,
                                shrinkWrap: true,
                                itemCount: controller.details.value.educations!.length,
                                itemBuilder: (context, index) {
                                  return Padding(
                                    padding: const EdgeInsets.only(bottom: 12.0),
                                    child: setHelveticaMedium(
                                      controller.details.value.educations![index].schoolUniversity! + " / " + controller.details.value.educations![index].startYear! + ' - ' + controller.details.value.educations![index].endYear!,
                                      16, grey_aaaaaa, FontWeight.w500, FontStyle.normal, -0.32
                                    ),
                                  );
                                }
                              ),
                            ),
                          )
                        ],
                      ),
                    ),
                  ),
                ) : Container(),
                controller.details.value.dateOfBirth != null 
                ? Padding(
                  padding: const EdgeInsets.only(bottom: 16.0),
                  child: Container(
                    decoration: BoxDecoration(
                      color: white_ffffff,
                       border: Border.all(color: light_grey_f2f2f2)
                    ),
                    child: Padding(
                      padding: const EdgeInsets.only(bottom: 4.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(top: 16.0, left: 16.0),
                            child: Row(
                              children: [
                                SvgPicture.asset(calendar_icon),
                                SizedBox(width: 8,),
                                setHelceticaBold("DATE OF BIRTH", 12, black_121212, FontWeight.w600, FontStyle.normal, -0.24),
                              ],
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(top: 12.0, left: 16.0, bottom: 12.0),
                            child: setHelveticaMedium(controller.details.value.dateOfBirth, 16, grey_aaaaaa, FontWeight.w500, FontStyle.normal, -0.32),
                          )
                        ],
                      ),
                    ),
                  ),
                ) : Container(),
                controller.details.value.questions!.isNotEmpty
                ? controller.details.value.questions![0].answer != null
                ? Padding(
                  padding: const EdgeInsets.only(bottom: 16.0),
                  child: Container(
                    decoration: BoxDecoration(
                      color: white_ffffff,
                       border: Border.all(color: light_grey_f2f2f2)
                    ),
                    child: Padding(
                      padding: const EdgeInsets.only(bottom: 4.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(top: 16.0, left: 16.0),
                            child: Row(
                              children: [
                                SvgPicture.asset(question_icon),
                                SizedBox(width: 8,),
                                setHelceticaBold(controller.details.value.questions![0].question!.toUpperCase(), 12, black_121212, FontWeight.w600, FontStyle.normal, -0.24),
                              ],
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(top: 12.0, left: 16.0, bottom: 12.0),
                            child: Container(child: setHelveticaMedium(controller.details.value.questions![0].answer!, 16, grey_aaaaaa, FontWeight.w500, FontStyle.normal, -0.32, 5)),
                          )
                        ],
                      ),
                    ),
                  ),
                ) : Container() : Container(),
                controller.details.value.questions!.length >= 2
                ? Padding(
                  padding: const EdgeInsets.only(bottom: 16.0),
                  child: Container(
                    decoration: BoxDecoration(
                      color: white_ffffff,
                       border: Border.all(color: light_grey_f2f2f2)
                    ),
                    child: Padding(
                      padding: const EdgeInsets.only(bottom: 4.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(top: 16.0, left: 16.0),
                            child: Row(
                              children: [
                                SvgPicture.asset(question_icon),
                                SizedBox(width: 8,),
                                setHelceticaBold(controller.details.value.questions![1].question!.toUpperCase(), 12, black_121212, FontWeight.w600, FontStyle.normal, -0.24),
                              ],
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(top: 12.0, left: 16.0, bottom: 12.0),
                            child: Container(child: setHelveticaMedium(controller.details.value.questions![1].answer!, 16, grey_aaaaaa, FontWeight.w500, FontStyle.normal, -0.32, 5)),
                          )
                        ],
                      ),
                    ),
                  ),
                ): Container(),
                controller.details.value.questions!.length >= 3
                ? Padding(
                  padding: const EdgeInsets.only(bottom: 16.0),
                  child: Container(
                    decoration: BoxDecoration(
                      color: white_ffffff,
                       border: Border.all(color: light_grey_f2f2f2)
                    ),
                    child: Padding(
                      padding: const EdgeInsets.only(bottom: 4.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(top: 16.0, left: 16.0),
                            child: Row(
                              children: [
                                SvgPicture.asset(question_icon),
                                SizedBox(width: 8,),
                                setHelceticaBold(controller.details.value.questions![2].question!.toUpperCase(), 12, black_121212, FontWeight.w600, FontStyle.normal, -0.24),
                              ],
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(top: 12.0, left: 16.0, bottom: 12.0),
                            child: Container(child: setHelveticaMedium(controller.details.value.questions![2].answer!, 16, grey_aaaaaa, FontWeight.w500, FontStyle.normal, -0.32, 5)),
                          )
                        ],
                      ),
                    ),
                  ),
                ): Container(),
                controller.details.value.questions!.length >= 4
                ? Padding(
                  padding: const EdgeInsets.only(bottom: 16.0),
                  child: Container(
                    decoration: BoxDecoration(
                      color: white_ffffff,
                       border: Border.all(color: light_grey_f2f2f2)
                    ),
                    child: Padding(
                      padding: const EdgeInsets.only(bottom: 4.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(top: 16.0, left: 16.0),
                            child: Row(
                              children: [
                                SvgPicture.asset(question_icon),
                                SizedBox(width: 8,),
                                setHelceticaBold(controller.details.value.questions![3].question!.toUpperCase(), 12, black_121212, FontWeight.w600, FontStyle.normal, -0.24),
                              ],
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(top: 12.0, left: 16.0, bottom: 12.0),
                            child: Container(child: setHelveticaMedium(controller.details.value.questions![3].answer!, 16, grey_aaaaaa, FontWeight.w500, FontStyle.normal, -0.32, 5)),
                          )
                        ],
                      ),
                    ),
                  ),
                ): Container(),
                controller.details.value.questions!.length >= 5
                ? Padding(
                  padding: const EdgeInsets.only(bottom: 16.0),
                  child: Container(
                    decoration: BoxDecoration(
                      color: white_ffffff,
                       border: Border.all(color: light_grey_f2f2f2)
                    ),
                    child: Padding(
                      padding: const EdgeInsets.only(bottom: 4.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(top: 16.0, left: 16.0),
                            child: Row(
                              children: [
                                SvgPicture.asset(question_icon),
                                SizedBox(width: 8,),
                                setHelceticaBold(controller.details.value.questions![4].question!.toUpperCase(), 12, black_121212, FontWeight.w600, FontStyle.normal, -0.24),
                              ],
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(top: 12.0, left: 16.0, bottom: 12.0),
                            child: Container(child: setHelveticaMedium(controller.details.value.questions![4].answer!, 16, grey_aaaaaa, FontWeight.w500, FontStyle.normal, -0.32, 5)),
                          )
                        ],
                      ),
                    ),
                  ),
                ) : Container(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}