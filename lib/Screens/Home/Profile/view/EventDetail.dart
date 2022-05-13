import 'package:blackchecktech/Layout/ToolbarBackOnly.dart';
import 'package:blackchecktech/Utilities/Constant.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class EventDetail extends StatefulWidget {
  EventDetail({Key? key}) : super(key: key);

  @override
  State<EventDetail> createState() => _EventDetailState();
}

class _EventDetailState extends State<EventDetail> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          const SizedBox(
            height: 60,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              BackLayout(),
              Padding(
                padding: const EdgeInsets.only(right: 24.0),
                child: Align(
                  alignment: Alignment.topRight,
                  child: PopupMenuButton(
                      // padding: EdgeInsets.only(bottom: 20),
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10)),
                      icon: const Icon(Icons.more_horiz, color: Colors.black),
                      onSelected: (index) {
                        if (index == 1) {
                          
                        } else if (index == 2) {
                          
                        }
                      },
                      itemBuilder: (context) => [
                            const PopupMenuItem(
                              height: 35,
                              child: Text(
                                "Edit",
                                style: TextStyle(
                                    color: Colors.black,
                                    fontFamily: helveticaNeueNeue_medium,
                                    fontSize: 14),
                              ),
                              value: 1,
                            ),
                            const PopupMenuItem(
                              height: 35,
                              child: Text(
                                "Delete",
                                style: TextStyle(
                                    color: Colors.black,
                                    fontFamily: helveticaNeueNeue_medium,
                                    fontSize: 14),
                              ),
                              value: 2,
                            ),
                          ]),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
