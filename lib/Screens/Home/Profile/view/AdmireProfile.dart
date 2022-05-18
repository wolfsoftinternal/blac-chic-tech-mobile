import 'package:blackchecktech/Screens/Home/Profile/controller/AdmireProfileController.dart';
import 'package:blackchecktech/Screens/Home/Profile/view/SeeAllAdmires.dart';
import 'package:blackchecktech/Styles/my_colors.dart';
import 'package:blackchecktech/Styles/my_icons.dart';
import 'package:blackchecktech/Utilities/TextUtilities.dart';
import 'package:blackchecktech/Utils/internet_connection.dart';
import 'package:blackchecktech/Widget/AdmireProfileList.dart';
import 'package:blackchecktech/Widget/CreateBottomSheet.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';

class AdmireProfile extends StatefulWidget {
  AdmireProfile({Key? key}) : super(key: key);

  @override
  State<AdmireProfile> createState() => _AdmireProfileState();
}

class _AdmireProfileState extends State<AdmireProfile> {
  AdmireProfileController controller = Get.put(AdmireProfileController());
  PageController pageController = PageController();
  List<Widget>? list;
  bool hadReachedEnd = false;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    checkNet(context).then((value) => 
      controller.admireListAPI(context),
    );
    controller.addListener(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: white_ffffff,
      body: Obx(
        () => Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Expanded(
              child:  Stack(
                children: [
                  PageView.builder(
                    physics: NeverScrollableScrollPhysics(),
                    controller: pageController,
                    itemCount: controller.admireList.length,
                    onPageChanged: (v){
                      if(v == controller.admireList.length - 1){
                        hadReachedEnd = true;
                      }
                    },
                    itemBuilder: (BuildContext context, int index){
                      return AdmireProfileList(admireList: controller.admireList[index]);
                    }
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 24.0, right: 24.0, top: 50.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        GestureDetector(onTap: (){Get.back();},child: SvgPicture.asset(icon_back_black_arrow,width: 24,height: 24, color: white_ffffff,)),                     
                        Spacer(),
                        GestureDetector(
                          onTap: (){
                            createBottomSheet(context);
                          },
                          child: SvgPicture.asset(add_icon)
                        ),
                        SizedBox(height: 5,),
                        SvgPicture.asset(settings_icon, height: 48, width: 48,),
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 15.0, right: 15.0),
                    child: Center(
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          GestureDetector(
                            onTap: (){
                              pageController.previousPage(
                                duration: Duration(milliseconds: 300),
                                curve: Curves.fastOutSlowIn
                              );
                            },
                            child: Container(
                              height: 80,
                              width: 50,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(5.0),
                                color: white_ffffff,
                              ),
                              child: Icon(Icons.arrow_back, color: grey_aaaaaa, size: 35,),
                            ),
                          ),
                          GestureDetector(
                            onTap: (){
                              if(hadReachedEnd == true){
                                pageController.jumpToPage(0);
                                hadReachedEnd = false;
                              }else{
                                pageController.nextPage(
                                  duration: Duration(milliseconds: 300),
                                  curve: Curves.fastOutSlowIn
                                );
                              }
                            },
                            child: Container(
                              height: 80,
                              width: 50,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(5.0),
                                color: white_ffffff,
                              ),
                              child: Icon(Icons.arrow_forward, color: grey_aaaaaa, size: 35,),
                            ),
                          )
                        ],
                      ),
                    ),
                  )
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 24.0, right: 24.0),
              child: Row(
                children: [
                  setHelceticaBold('Fade Admires', 14, black_121212,
                      FontWeight.w600, FontStyle.normal, -0.28),
                  Spacer(),
                  GestureDetector(
                    onTap: (){
                      Get.to(SeeAllAdmires());
                    },
                    child: setHelveticaMedium(
                      'See More',
                      12,
                      grey_aaaaaa,
                      FontWeight.w600,
                      FontStyle.normal,
                      -0.24
                    ),
                  ),
                  SizedBox(width: 5,),
                  Icon(
                    Icons.arrow_forward,
                    color: grey_aaaaaa,
                    size: 12,
                  )
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 24.0, right: 24.0, top: 15),
              child: Container(
                height: MediaQuery.of(context).size.height * 0.10,
                width: double.infinity,
                child: ListView.builder(
                  primary: false,
                  shrinkWrap: true,
                  scrollDirection: Axis.horizontal,
                  itemCount: controller.admireList.length,
                  itemBuilder: ((context, index) {
                    return Padding(
                      padding: const EdgeInsets.only(right: 12.0),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          ClipRRect(
                            borderRadius: BorderRadius.circular(50),
                            child:
                                controller.admireList[index].admireDetails!.image == null
                                    ? SvgPicture.asset(
                                        placeholder,
                                        height: 48,
                                        width: 48,
                                      )
                                    : CachedNetworkImage(
                                        imageUrl: controller.admireList[index]
                                            .admireDetails!.image!,
                                        height: 48,
                                        width: 48,
                                        fit: BoxFit.cover,
                                        progressIndicatorBuilder:
                                            (context, url, downloadProgress) =>
                                                SvgPicture.asset(
                                          placeholder,
                                          height: 48,
                                          width: 48,
                                        ),
                                        errorWidget: (context, url, error) =>
                                            SvgPicture.asset(
                                          placeholder,
                                          height: 48,
                                          width: 48,
                                        ),
                                      ),
                          ),
                          SizedBox(
                            height: 8,
                          ),
                          setHelveticaMedium(
                              controller.admireList[index].admireDetails!.firstName ?? "",
                              12,
                              black_121212,
                              FontWeight.w500,
                              FontStyle.normal,
                              -0.24),
                        ],
                      ),
                    );
                  }),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}