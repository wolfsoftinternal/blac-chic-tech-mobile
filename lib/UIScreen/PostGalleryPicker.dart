import 'package:blackchecktech/Layout/BlackButton.dart';
import 'package:blackchecktech/Layout/BlackNextButton.dart';
import 'package:blackchecktech/Layout/ToolbarCreatePost.dart';
import 'package:blackchecktech/Layout/ToolbarLocation.dart';
import 'package:blackchecktech/Screens/Authentication/signup/model/TagPeopleModel.dart';
import 'package:blackchecktech/Styles/my_colors.dart';
import 'package:blackchecktech/Styles/my_icons.dart';
import 'package:blackchecktech/Utilities/Constant.dart';
import 'package:blackchecktech/Widget/AddLocationView.dart';
import 'package:blackchecktech/Widget/EditTextDecoration.dart';
import 'package:blackchecktech/Widget/EditTextDecorationBorder.dart';
import 'package:blackchecktech/Widget/search_bar.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/src/size_extension.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:wechat_assets_picker/wechat_assets_picker.dart';

import '../Utils/picker_method.dart';
import 'multi_assets_page.dart';



class PostGalleryPicker extends StatefulWidget {
  const PostGalleryPicker({Key? key}) : super(key: key);

  @override
  _PostGalleryPickerState createState() => _PostGalleryPickerState();
}

class _PostGalleryPickerState extends State<PostGalleryPicker> {

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
          backgroundColor: Colors.white,
          body: Column(
            children: [

              Container(
                height: 150,
                  child: MultiAssetsPage()),

            ],
          ),
        ));
  }



}
