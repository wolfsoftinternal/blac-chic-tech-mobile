import 'package:blackchecktech/Utilities/TextUtilities.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';

import '../../../../Layout/ElevatedGreenButtonSecond.dart';
import '../../../../Layout/ToolbarWithHeader.dart';
import '../../../../Layout/ToolbarWithHeaderCenterTitle.dart';
import '../../../../Layout/WalletBalanceWidget.dart';
import '../../../../Styles/my_colors.dart';
import '../../../../Styles/my_height.dart';
import '../../../../Styles/my_icons.dart';
import '../../../../Styles/my_strings.dart';
import '../../../../Utilities/Constant.dart';
import '../../../../Utils/CommonWidget.dart';
import '../../../../Utils/SizeConfig.dart';
import '../../../../Utils/internet_connection.dart';
import '../../../../Utils/share_predata.dart';
import '../controller/WithdrawController.dart';


class AddBankAccountPage extends StatefulWidget {
  const AddBankAccountPage({Key? key}) : super(key: key);

  @override
  _AddBankAccountPageState createState() => _AddBankAccountPageState();
}

class _AddBankAccountPageState extends State<AddBankAccountPage> {
  WithdrawController controller = Get.put(WithdrawController());
  final bankKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);

    return Scaffold(
      backgroundColor: Colors.white,
        body: Obx(
      () => SafeArea(
        child: Container(
            width: double.infinity,
            child: Form(
              key: bankKey,
              child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(height: 15.h,),
                    ToolbarWithHeaderCenterTitle(add_bank_account),
                    SizedBox(height: 20.h,),
                    Expanded(
                      child: SingleChildScrollView(
                        child: Padding(
                          padding:  EdgeInsets.only(left: 24.w,right: 24.w,bottom: 24.h),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [


                              SizedBox(height: 20.h,),

                              Text(acc_name.toUpperCase(),
                                style: TextStyle(fontFamily: roboto_bold,
                                  fontWeight: FontWeight.w800,
                                  fontSize: 12.sp,
                                  color: grey_aaaaaa),),
                              SizedBox(height: 6.h,),
                              Container(
                                  height: 40.h,
                                  decoration: BoxDecoration(
                                    color: white,
                                    borderRadius: BorderRadius.circular(10.r),
                                  ),
                                  child: Center(
                                    child: TextFormField(
                                      controller: controller.accName.value,
                                      textInputAction: TextInputAction.next,
                                      style: TextStyle(
                                          fontFamily: helveticaNeueNeue_medium,
                                          fontSize: 14.sp,
                                          fontWeight: FontWeight.w500,
                                          color: black),
                                      decoration: InputDecoration(
                                          contentPadding: EdgeInsets.all(10),
                                          border: OutlineInputBorder(
                                              borderSide: BorderSide(color: black)
                                          ),
                                          hintStyle: TextStyle(
                                              fontFamily: helveticaNeueNeue_medium,
                                              fontSize: 14.sp,
                                              color: grey_96a6a3)),
                                    ),
                                  )
                              ),
                              SizedBox(height: 16.h,),

                              Text(bank_name.toUpperCase(),
                                style: TextStyle(
                                    fontFamily: roboto_bold,
                                    fontWeight: FontWeight.w800,
                                    fontSize: 12.sp,
                                    color: grey_aaaaaa),),
                              SizedBox(height: 6.h,),
                              Container(
                                  height: 40.h,
                                  decoration: BoxDecoration(
                                    color: white,
                                    borderRadius: BorderRadius.circular(10),
                                  ),
                                  child: Center(
                                    child: TextFormField(
                                      controller: controller.bankName.value,
                                      textInputAction: TextInputAction.next,
                                      style: TextStyle(
                                          fontFamily: helveticaNeueNeue_medium,
                                          fontSize: 13.0,
                                          fontWeight: FontWeight.w500,
                                          color: black),
                                      decoration: InputDecoration(
                                          contentPadding: EdgeInsets.all(10),
                                          border: OutlineInputBorder(
                                              borderSide: BorderSide(color: black)
                                          ),
                                          hintStyle: TextStyle(
                                              fontFamily: helveticaNeueNeue_medium,
                                              fontSize: 14.0,
                                              color: grey_96a6a3)),
                                    ),
                                  )),

                              SizedBox(height: 16.h,),

                              Text(account_number.toUpperCase(),
                                style: TextStyle(
                                    fontFamily: roboto_bold,
                                    fontWeight: FontWeight.w800,
                                    fontSize: 12.sp,
                                    color: grey_aaaaaa),),
                              SizedBox(height: 6.h,),
                              Container(
                                  height: 40.h,
                                  decoration: BoxDecoration(
                                    color: white,
                                    borderRadius: BorderRadius.circular(10),
                                  ),
                                  child: Center(
                                    child: TextFormField(
                                      controller: controller.accountNo.value,
                                      keyboardType: TextInputType.number,
                                      textInputAction: TextInputAction.next,
                                      style: TextStyle(
                                          fontFamily: helveticaNeueNeue_medium,
                                          fontSize: 14.0,
                                          fontWeight: FontWeight.w500,
                                          color: black),
                                      decoration: InputDecoration(
                                          contentPadding: EdgeInsets.all(10),
                                          border:OutlineInputBorder(
                                              borderSide: BorderSide(color: black)
                                          ),
                                          hintStyle: TextStyle(
                                              fontFamily: helveticaNeueNeue_medium,
                                              fontSize: 14.0,
                                              fontWeight: FontWeight.w500,
                                              color: grey_96a6a3)),
                                    ),
                                  )),


                              SizedBox(height: 16.h,),
                              Text(routing_numder.toUpperCase(),
                                style: TextStyle(
                                    fontFamily: roboto_bold,
                                    fontWeight: FontWeight.w800,
                                    fontSize: 12.sp,
                                    color: grey_aaaaaa),),
                              SizedBox(height: 6.h,),
                              Container(
                                  height: 40.h,
                                  decoration: BoxDecoration(
                                    color: white,
                                    borderRadius: BorderRadius.circular(10),
                                  ),
                                  child: Center(
                                    child: TextFormField(
                                      style: TextStyle(
                                          fontFamily: helveticaNeueNeue_medium,
                                          fontSize: 14.0,
                                          fontWeight: FontWeight.w500,
                                          color: black),
                                      controller: controller.routingNo.value,
                                      textInputAction: TextInputAction.next,
                                      keyboardType: TextInputType.number,
                                      decoration: InputDecoration(
                                          contentPadding: EdgeInsets.all(10),
                                          border: OutlineInputBorder(
                                              borderSide: BorderSide(color: black)
                                          ),
                                          hintStyle: TextStyle(
                                              fontFamily: helveticaNeueNeue_medium,
                                              fontSize: 14.0,
                                              fontWeight: FontWeight.w500,
                                              color: grey_96a6a3)),
                                    ),
                                  )),


                              SizedBox(height: 16.h,),
                              Text(bank_address.toUpperCase(),
                                style: TextStyle(
                                    fontFamily: roboto_bold,
                                    fontWeight: FontWeight.w800,
                                    fontSize: 12.sp,
                                    color: grey_aaaaaa),),
                              SizedBox(height: 6.h,),
                              Container(
                                  height: 40.h,
                                  decoration: BoxDecoration(
                                    color: white,
                                    borderRadius: BorderRadius.circular(10),
                                  ),
                                  child: Center(
                                    child: TextFormField(
                                      style: TextStyle(
                                          fontFamily: helveticaNeueNeue_medium,
                                          fontSize: 14.0,
                                          fontWeight: FontWeight.w500,
                                          color: black),
                                      controller: controller.bankAddress.value,
                                      textInputAction: TextInputAction.done,
                                      decoration: InputDecoration(
                                          contentPadding: EdgeInsets.all(10),
                                          border: OutlineInputBorder(
                                              borderSide: BorderSide(color: black)
                                          ),
                                          hintStyle: TextStyle(
                                              fontFamily: helveticaNeueNeue_medium,
                                              fontSize: 14.0,
                                              fontWeight: FontWeight.w500,
                                              color: grey_96a6a3)),
                                    ),
                                  )),
                              SizedBox(height: 30.h),

                              // Withdraw to lable
                              setHelceticaBold(save_as, 16.sp, Colors.black,
                                  FontWeight.w600, FontStyle.normal),

                              Row(
                                children: [
                                  // Personal Account Widget
                                  _accountTypeWidget(
                                      personal_account, personal_account_icon, 1),
                                  SizedBox(
                                    width: 2,
                                  ),
                                  // Business Account Widget

                                  _accountTypeWidget(
                                      business_account, business_account_icon, 2),
                                  SizedBox(
                                    width: 2,
                                  ),
                                  // Family Account Widget

                                  _accountTypeWidget(
                                      family_account, family_account_icon, 3)
                                ],
                              ),

                              SizedBox(height: 15.h),
                              CommonElevatedButtonSecond(
                                  save, Colors.white, black, () {
                                    checkNet(context).then((value) {
                                        if(controller.accName.value.text.isEmpty){
                                          snackBar(context, "Please Enter Account Name");
                                          return;
                                        }
                                        if(controller.bankName.value.text.isEmpty){
                                          snackBar(context, "Please Enter Bank Name");
                                          return;
                                        }
                                        if(validateAccountNumber(controller.accountNo.value.text).isNotEmpty){
                                          snackBar(context,validateAccountNumber(controller.accountNo.value.text));
                                          return;
                                        }
                                        if(controller.routingNo.value.text.isEmpty){
                                          snackBar(context, "Please Enter Routing Number");
                                          return;
                                        }
                                        if(controller.bankAddress.value.text.isEmpty){
                                          snackBar(context, "Please Enter Bank Address");
                                          return;
                                        }
                                        controller.addAccountApi(context);
                                      });
                              })
                            ],
                          ),
                        ),
                      ),
                    ),

                  ]),
            )),
      ),
    ));
  }

  Widget _accountTypeWidget(accountType, iconValue, index) {
    return Expanded(
      child: GestureDetector(
          onTap: () {
            setState(() {
              controller.selectedSaveAsIndex.value = index;
            });
          },
          child: Stack(
            children: [
              Container(
                height: 120,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    SvgPicture.asset(
                      iconValue,
                      width: 36,
                      height: 36,
                    ),
                    SizedBox(
                      height: 12,
                    ),
                    setHelveticaMedium(accountType, 12.sp, Color(0xff1c2535),
                        FontWeight.w400, FontStyle.normal),
                  ],
                ),
              ),

              // setting selected Save as Account Type
              if (controller.selectedSaveAsIndex.value == index)
                Positioned(
                  top: 20,
                  right: 25,
                  child: Container(
                    width: 15,
                    height: 15,
                    child: Icon(
                      Icons.check,
                      size: 10,
                      color: Colors.white,
                    ),
                    decoration: BoxDecoration(
                        shape: BoxShape.circle, color: orange),
                  ),
                )
            ],
          )),
    );
  }
}
