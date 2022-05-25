import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';

class EventSearchModel{
  String tvUserName,tvEventName,tvEventDate,tvEventVenue;

  EventSearchModel(this.tvUserName,this.tvEventName,this.tvEventDate,this.tvEventVenue);
}

List<EventSearchModel>modelArrayList = [];