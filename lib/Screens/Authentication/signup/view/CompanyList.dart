import 'package:blackchecktech/Layout/ToolbarWithHeaderAction.dart';
import 'package:blackchecktech/Screens/Authentication/signup/controller/StepsController.dart';
import 'package:blackchecktech/Styles/my_colors.dart';
import 'package:blackchecktech/Widget/SearchBar.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CompanyList extends StatefulWidget {
  const CompanyList({Key? key}) : super(key: key);

  @override
  _CompanyListState createState() => _CompanyListState();
}

class _CompanyListState extends State<CompanyList> {
  StepsController controller = Get.put(StepsController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: white_ffffff,
      body: Obx(
        () => Column(
          children: [
            const SizedBox(
              height: 60,
            ),
            ToolbarWithHeaderAction(
              'Select Your Company',
              '',
              (){
                //Dialog
              },
            ),
            SearchBar(hint: 'Search',),
            Expanded(
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    ListView.builder(
                      itemCount: controller.companyList.length,
                      itemBuilder: (context, index){
                        return InkWell(
                          onTap: (){},
                          child: Row(
                            children: [
                              Image.network(controller.companyList[index].image),
                              Text(controller.companyList[index].name),
                            ],
                          ),
                        );
                      }
                    )
                  ],
                ),
              )
            )
          ],
        ),
      ),
    );
  }
}
