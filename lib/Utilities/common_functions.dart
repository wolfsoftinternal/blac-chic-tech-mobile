import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

String calculateTimeDifference(
    {required DateTime start, required DateTime end}) {
  DateTime startDate = DateFormat("yyyy-MM-dd").parse(start.toString());
  DateTime endDate = DateFormat("yyyy-MM-dd").parse(end.toString());

  String rawDate = "";
  // int diff = endDate.compareTo(startDate);
  int diff = endDate.difference(startDate).inDays;
  print("$startDate $endDate diff $diff");
  if (diff == 0) {
    rawDate = formatDatehhmm(start);
  } else if (diff == 1) {
    rawDate = "Yesterday";
  } else {
    rawDate = formatDateddmmyyyy(startDate);
  }
  return rawDate;
}

String formatDatehhmm(DateTime date) {
  // DateTime tempDate = DateFormat("yyyy-MM-dd hh:mm:ss").parse(date);

  final dateFormat = DateFormat("hh:mm aa");
  String returndate = dateFormat.format(date);
  print("date $date returndate $returndate");
  return returndate;
}

String formatDateddmmyyyy(DateTime date) {
  // DateTime tempDate = DateFormat("yyyy-MM-dd hh:mm:ss").parse(date);

  final dateFormat = DateFormat("dd MM yyyy");
  return dateFormat.format(date);
}

String formatDateddmmmmyyy(String date) {
  DateTime tempDate = DateFormat("yyyy-MM-dd hh:mm:ss").parse(date);

  final dateFormat = DateFormat("d MMMM yyyy");
  return dateFormat.format(tempDate);
}

String formatDateddmmhhm(DateTime date) {
  // DateTime tempDate = DateFormat("yyyy-MM-dd hh:mm:ss").parse(date);

  final dateFormat = DateFormat("dd MMM  hh:mm aa");
  return dateFormat.format(date);
}
