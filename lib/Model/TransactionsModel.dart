import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';


class TransactionsModel{
  String tvOrderId,tvDate,tvEventName,tvRate;

  TransactionsModel(this.tvOrderId,this.tvDate,this.tvEventName,this.tvRate);
}

List<TransactionsModel>modelArrayList = [];