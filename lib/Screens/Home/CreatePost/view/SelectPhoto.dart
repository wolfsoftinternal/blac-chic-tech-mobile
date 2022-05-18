import 'dart:typed_data';

import 'package:flutter/material.dart';

class SelectPhoto extends StatefulWidget {
  final ScrollController? scrollCtr;

  const SelectPhoto({
    Key? key,
    this.scrollCtr,
  }) : super(key: key);


  @override
  State<SelectPhoto> createState() => _SelectPhotoState();
}

class _SelectPhotoState extends State<SelectPhoto> {


  @override
  Widget build(BuildContext context) {
    return Container();
  }
}