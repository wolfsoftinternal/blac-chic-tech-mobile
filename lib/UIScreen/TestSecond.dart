import 'package:flutter/material.dart';


class TestSecond extends StatefulWidget {
  const TestSecond({Key? key}) : super(key: key);

  @override
  State<TestSecond> createState() => _TestSecondState();
}

class _TestSecondState extends State<TestSecond>  with TickerProviderStateMixin{
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
              Container(),
              Container()
            ],
          ),
        ),
      ),
    );
  }
}
