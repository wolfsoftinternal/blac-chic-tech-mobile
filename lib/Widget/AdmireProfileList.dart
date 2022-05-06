import 'package:blackchecktech/Layout/ToolbarBackOnly.dart';
import 'package:blackchecktech/Screens/Authentication/login/model/SignupModel.dart';
import 'package:blackchecktech/Screens/Home/Profile/controller/AdmireProfileController.dart';
import 'package:blackchecktech/Screens/Home/Profile/model/AdmireListModel.dart';
import 'package:blackchecktech/Screens/Home/Profile/view/Profile.dart';
import 'package:blackchecktech/Styles/my_colors.dart';
import 'package:blackchecktech/Styles/my_icons.dart';
import 'package:blackchecktech/Utilities/Constant.dart';
import 'package:blackchecktech/Utilities/TextUtilities.dart';
import 'package:blackchecktech/Utils/preference_utils.dart';
import 'package:blackchecktech/Utils/share_predata.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';

class AdmireProfileList extends StatefulWidget {
  final AdmireList admireList;
  const AdmireProfileList({ Key? key, required this.admireList }) : super(key: key);

  @override
  State<AdmireProfileList> createState() => _AdmireProfileListState();
}

class _AdmireProfileListState extends State<AdmireProfileList> {
  AdmireProfileController controller = Get.put(AdmireProfileController());

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        widget.admireList.admireDetails!.image == null 
        ? SvgPicture.asset(placeholder, height: MediaQuery.of(context).size.height * .83, width: double.infinity, fit: BoxFit.cover,)
        : CachedNetworkImage(
          imageUrl: widget.admireList.admireDetails!.image!,
          height: MediaQuery.of(context).size.height * .83, width: double.infinity,
          fit: BoxFit.cover,
          progressIndicatorBuilder: (context, url, downloadProgress) => SvgPicture.asset(placeholder, height: MediaQuery.of(context).size.height * .83, width: double.infinity, fit: BoxFit.cover,),
          errorWidget: (context, url, error) => SvgPicture.asset(placeholder, height: MediaQuery.of(context).size.height * .83, width: double.infinity, fit: BoxFit.cover,),
        ),
        GestureDetector(
          onTap: () async {
            var preferences = MySharedPref();
            SignupModel? modelM = await preferences.getSignupModel(SharePreData.keySignupModel);

            if(modelM!.data!.id == widget.admireList.admireId){
              controller.userProfileAPI(context);
            }else{
              controller.admireProfileAPI(context, widget.admireList.admireDetails!.id);
            }
          },
          child: Container(color: Colors.black.withOpacity(0.3), height: MediaQuery.of(context).size.height * .83,)
        ),      
        Padding(
          padding: const EdgeInsets.only(top: 60.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                width: MediaQuery.of(context).size.width * 0.50,
                height: MediaQuery.of(context).size.width * 0.068,
                child: FittedBox(
                  child: setHelceticaBold(
                    widget.admireList.admireDetails!.userName ?? "",
                    20,
                    white_ffffff,
                    FontWeight.w600,
                    FontStyle.normal,
                    -0.8
                  ),
                ),
              ),
            ],
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(left: 24.0, right: 24.0),
          child: Column(
            children: [
              SizedBox(height: MediaQuery.of(context).size.height * .55),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    width: MediaQuery.of(context).size.width * 0.80,
                    height: MediaQuery.of(context).size.width * 0.10,
                    child: FittedBox(
                      child: setHelceticaBold(
                        widget.admireList.admireDetails!.fullName != null
                            ? widget.admireList.admireDetails!.fullName!.toUpperCase()
                            : "",
                        40,
                        white_ffffff,
                        FontWeight.w600,
                        FontStyle.normal,
                        -1.6
                      ),
                    ),
                  ),
                ],
              ),
              SizedBox(height: 24,),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Expanded(
                    child: Text(
                       widget.admireList.admireDetails!.currentJobs != null
                        ? widget.admireList.admireDetails!.currentJobs!.title!.toUpperCase() + ' - ' + widget.admireList.admireDetails!.currentJobs!.companyName!.toUpperCase()
                        : "",
                      softWrap: true,
                      textAlign: TextAlign.center,
                      style: const TextStyle(
                        fontSize: 16,
                        fontFamily: helveticaNeueNeue_medium,
                        fontWeight:  FontWeight.w600,
                        color: Colors.white70,
                        fontStyle: FontStyle.normal,
                        letterSpacing: 6.4,
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(left: 24.0, right: 24.0),
          child: Column(
            children: [
              SizedBox(height: MediaQuery.of(context).size.height * .76,),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  widget.admireList.admireDetails!.cityDetails != null
                  ? Icon(Icons.location_on, color: orange_ff881a,)
                  : Container(),
                  setHelveticaMedium(
                    widget.admireList.admireDetails!.cityDetails != null
                        ? widget.admireList.admireDetails!.cityDetails!.name! + ', ' + widget.admireList.admireDetails!.stateDetails!.name! + ', ' + widget.admireList.admireDetails!.countryDetails!.name!
                        : "",
                    10,
                    Colors.white70,
                    FontWeight.w600,
                    FontStyle.normal,
                  ),
                ],
              )
            ],
          ),
        ),
      ],
    );
  }
}