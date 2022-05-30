import 'package:flutter/material.dart';

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

              SizedBox(
                height: 150,
                  child: MultiAssetsPage()),

            ],
          ),
        ));
  }



}
