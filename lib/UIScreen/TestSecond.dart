import 'package:blackchecktech/Layout/ToolbarWithTitle.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../Layout/ToolbarBackOnly.dart';
import '../Styles/my_colors.dart';

class TestSecond extends StatefulWidget {
  const TestSecond({Key? key}) : super(key: key);

  @override
  State<TestSecond> createState() => _TestSecondState();
}

class _TestSecondState extends State<TestSecond> with TickerProviderStateMixin {
  late TabController tabController;

  @override
  void initState() {
    super.initState();
    tabController = TabController(length: 2, vsync: this);
  }

  @override
  void dispose() {
    tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: NestedScrollView(
        headerSliverBuilder: (context, value) {
          return [
            SliverToBoxAdapter(
              child: TabBar(
                controller: tabController,
                labelColor: Colors.redAccent,
                isScrollable: true,
                tabs: [
                  Tab(
                    child: Text(
                      "Tab 1",
                      style: TextStyle(color: Colors.black),
                    ),
                  ),
                  Tab(
                    child: Text(
                      "Tab 1",
                      style: TextStyle(color: Colors.black),
                    ),
                  ),
                ],
              ),
            ),
          ];
        },
        body: Container(
          child: TabBarView(
            controller: tabController,
            children: [
              /// Each content from each tab will have a dynamic height
              Container(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Stack(
                      children: [
                        BackLayout(),
                        // BC-CONNECT
                        Padding(
                          padding: EdgeInsets.only(top: 14.h),
                          child: Center(
                            child: Text("title",
                                style: TextStyle(
                                    color: black_121212,
                                    fontFamily: "NeueHelvetica",
                                    fontSize: 16.sp),
                                textAlign: TextAlign.right),
                          ),
                        )
                      ],
                    ),

                    SizedBox(height: 15.h,),

                    ToolbarWithTitle("_title")
                  ],
                ),
              ),
              Container()
            ],
          ),
        ),
      ),
    );
  }
}
