import 'package:blackchecktech/Layout/ToolbarLocation.dart';
import 'package:blackchecktech/Screens/Authentication/signup/model/TagPeopleModel.dart';
import 'package:blackchecktech/Screens/Home/CreateEvent/controller/EventController.dart';
import 'package:blackchecktech/Screens/Home/CreatePost/controller/PostController.dart';
import 'package:blackchecktech/Styles/my_colors.dart';
import 'package:blackchecktech/Styles/my_strings.dart';
import 'package:blackchecktech/Utilities/Constant.dart';
import 'package:blackchecktech/Widget/search_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/src/size_extension.dart';
import 'package:get/get.dart';
import 'package:google_place/google_place.dart';

class PostLocation extends StatefulWidget {
  const PostLocation({Key? key}) : super(key: key);

  @override
  _PostLocationState createState() => _PostLocationState();
}

class _PostLocationState extends State<PostLocation> {
  PostController controller = Get.put(PostController());
  GooglePlace? googlePlace;
  List<AutocompletePrediction> predictions = [];
  List name = [];

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    googlePlace = GooglePlace(api_key);
  }

  autoCompleteSearch(String value) async {
    var result = await googlePlace!.autocomplete.get(value);
    if (result != null && result.predictions != null && mounted) {
      setState(() {
        predictions = result.predictions!;
        name.clear();
        getDetils();
      });
    }
  }

  void getDetils() async {
    for (var item in predictions) {
      var result = await googlePlace!.details.get(item.placeId!);
      if (result != null && result.result != null && mounted) {
        setState(() {
          name.add(result.result!.name!);
        });
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
              height: 60.r,
            ),
            ToolbarLocation(
                context, "LOCATIONS", "assets/images/location_icon.png"),
            Padding(
              padding: EdgeInsets.only(
                  left: 24.w, right: 24.w, top: 5.h, bottom: 24.h),
              child: SearchBarTag(
                  placeholder: "Search locations",
                  autoFocus: true,
                  onSubmit: (value) {
                    if (value.isNotEmpty) {
                      controller.searchLocationController.value.text = value;
                      autoCompleteSearch(value);
                    } else {
                      if (predictions.length > 0 && mounted) {
                        setState(() {
                          predictions = [];
                        });
                      }
                    }
                  }),
            ),
            Padding(
              padding: EdgeInsets.only(
                  left: 24.w, right: 24.w, top: 5.h),
              child: ListView.builder(
                primary: false,
                shrinkWrap: true,
                padding: const EdgeInsets.all(0),
                itemCount: name.isEmpty ? 0 : predictions.length,
                itemBuilder: (context, i) => InkWell(
                  onTap: () {
                    debugPrint(predictions[i].description);
                    controller.location.add(name[i]);
                    controller.address.value = predictions[i].description!;
                    print(controller.address.value);
                    Get.back();
                  },
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(name[i],
                          style: TextStyle(
                              color: black_121212,

                              fontFamily: helvetica_neu_bold,
                              fontStyle: FontStyle.normal,
                              fontSize: 14.sp),
                          textAlign: TextAlign.left),
                      SizedBox(height: 2.h,),
                      Text(predictions[i].description!,
                          style: TextStyle(
                              color: grey_aaaaaa,
                              fontFamily: helveticaNeueNeue_medium,
                              fontStyle: FontStyle.normal,
                              fontSize: 14.sp),
                          textAlign: TextAlign.left),
                      SizedBox(
                        height: 16.h,
                      )
                    ],
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
