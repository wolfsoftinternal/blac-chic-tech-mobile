import 'package:flutter/material.dart';

void printData(String str, String val) {
  print(str + " :::  " + val);
}

void onLoading(BuildContext context, String msg) {
  showDialog(
    context: context,
    barrierDismissible: false,
    builder: (BuildContext context) {
      // return Image.asset(loader, height: 20, width: 20,);
      return Dialog(
        child: Padding(
          padding: const EdgeInsets.all(15.0),
          child: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              const CircularProgressIndicator(),
              Padding(
                padding: const EdgeInsets.only(left: 20.0),
                child: Text(msg),
              ),
            ],
          ),
        ),
      );
    },
  );
}
