import 'package:blackchecktech/Screens/Home/Profile/controller/AdmireProfileController.dart';
import 'package:blackchecktech/Styles/my_colors.dart';
import 'package:blackchecktech/Styles/my_icons.dart';
import 'package:blackchecktech/Utilities/TextUtilities.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';

Widget AdmiresGridView(_crossAxisCount) {
  AdmireProfileController controller = Get.put(AdmireProfileController());

  return GridView.builder(
    primary: false,
    shrinkWrap: true,
    padding: EdgeInsets.all(0),
    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
      crossAxisCount: _crossAxisCount,
      childAspectRatio: _crossAxisCount == 3 ? 0.85
                      : _crossAxisCount == 4 ? 0.6
                      : _crossAxisCount == 5 ? 0.75 : 0.9,
      mainAxisSpacing: 10.0,
      crossAxisSpacing: 12.0,
    ),
    itemCount: controller.admireList.length,
    itemBuilder: (context, index) {
      return Column(
        children: [
          Stack(
            children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(50),
                child: controller.admireList[index].admireDetails!.image == null
                    ? SvgPicture.asset(
                        placeholder,
                        height: 70,
                        width: 70,
                      )
                    : CachedNetworkImage(
                        imageUrl:
                            controller.admireList[index].admireDetails!.image!,
                        height: 70,
                        width: 70,
                        fit: BoxFit.cover,
                        progressIndicatorBuilder:
                            (context, url, downloadProgress) =>
                                SvgPicture.asset(
                          placeholder,
                          height: 70,
                          width: 70,
                        ),
                        errorWidget: (context, url, error) => SvgPicture.asset(
                          placeholder,
                          height: 70,
                          width: 70,
                        ),
                      ),
              ),
              Positioned(
                right: 3,
                top: 2,
                child: GestureDetector(
                  onTap: () {
                    controller.admireDeleteAPI(
                        context, controller.admireList[index].admireId);
                  },
                  child: Container(
                      height: 18,
                      width: 18,
                      decoration: BoxDecoration(
                        color: grey_aaaaaa,
                        borderRadius: BorderRadius.circular(50.0),
                      ),
                      child: Icon(
                        Icons.close,
                        color: white_ffffff,
                        size: 12,
                      )),
                ),
              )
            ],
          ),
          SizedBox(
            height: 5,
          ),
          setHelceticaBold(
              controller.admireList[index].admireDetails!.firstName ?? "",
              12,
              black_121212,
              FontWeight.w500,
              FontStyle.normal,
              -0.1),
          SizedBox(
            height: 2,
          ),
          setHelveticaMedium(
              controller.admireList[index].admireDetails!.currentJobs != null
                  ? controller.admireList[index].admireDetails!.currentJobs!
                      .companyName!
                  : "",
              10,
              grey_aaaaaa,
              FontWeight.w500,
              FontStyle.normal,
              -0.1),
        ],
      );
    },
  );
}
