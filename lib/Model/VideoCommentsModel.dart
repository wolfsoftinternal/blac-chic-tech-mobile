import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';

class VideoCommentsModel{
  String imgUser,tvTitle,tvSubTitle,tvDays,tvComments;

  VideoCommentsModel(this.imgUser,this.tvTitle,this.tvSubTitle,this.tvDays,this.tvComments);
}

List<VideoCommentsModel>modelArrayList = [];