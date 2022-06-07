import 'package:blackchecktech/Utilities/TextUtilities.dart';
import 'package:flutter/material.dart';
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
                    ToolbarWithHeaderCenterTitle(add_bank_account),
                    Divider(
                      height: 1,
                      color: grey_E9ECEC,
                      thickness: 1,
                    ),
                    SizedBox(height: 20,),
                    Expanded(
                      child: SingleChildScrollView(
                        child: Padding(
                          padding: const EdgeInsets.only(left: 24,right: 24,bottom: 24),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              // WalletBalanceWidget(
                              //     amount:
                              //         SharePreData.strDollar + "${controller.walletAmount.value}"), // Wallet Balance Widget
                              // SizedBox(
                              //   height: 35,
                              // ),
                              //
                              // // set amount lable
                              // setHelceticaBold(set_amount, 16.0, Colors.black,
                              //     FontWeight.w600, FontStyle.normal),
                              //
                              // SizedBox(
                              //   height: 22,
                              // ),
                              //
                              // // set Amount widget
                              // Container(
                              //     height: 56,
                              //     decoration: BoxDecoration(
                              //       color: grey_e9ecec,
                              //       borderRadius: BorderRadius.circular(10),
                              //     ),
                              //     // padding: EdgeInsets.all(20),
                              //     child: Row(
                              //       children: [
                              //         Container(
                              //           width: 50,
                              //           height: double.infinity,
                              //           decoration: BoxDecoration(
                              //             color: grey_A0B0AD.withOpacity(0.4),
                              //             borderRadius: BorderRadius.only(
                              //               topLeft: Radius.circular(10),
                              //               bottomLeft: Radius.circular(10),
                              //             ),
                              //           ),
                              //           child: Center(
                              //             child: setHelveticaRegular(
                              //                 SharePreData.strDollar,
                              //                 16.0,
                              //                 black,
                              //                 FontWeight.w700,
                              //                 FontStyle.normal),
                              //           ),
                              //         ),
                              //         Expanded(
                              //             child: TextFormField(
                              //               style: TextStyle(
                              //                   fontFamily: helvetica_neu_bold,
                              //                   fontSize: 16.0,
                              //                   fontWeight: FontWeight.w500,
                              //                   color: black),
                              //           controller: controller.setAmount.value,
                              //           keyboardType: TextInputType.number,
                              //           decoration: InputDecoration(
                              //               contentPadding: EdgeInsets.all(10),
                              //               hintText: set_amount,
                              //               border: InputBorder.none,
                              //               hintStyle: TextStyle(
                              //                   fontFamily: helveticaNeueNeue_medium,
                              //                   fontSize: 14.0,
                              //                   color: grey_96a6a3)),
                              //               textInputAction: TextInputAction.next,
                              //         )),
                              //         // Column(
                              //         //     mainAxisAlignment:
                              //         //         MainAxisAlignment.center,
                              //         //     children: [
                              //         //       GestureDetector(
                              //         //           child: Icon(Icons.arrow_drop_up)),
                              //         //       GestureDetector(
                              //         //           child: Icon(Icons.arrow_drop_down))
                              //         //     ]),
                              //       ],
                              //     )),
                              // SizedBox(
                              //   height: 28,
                              // ),
                              //
                              // // Withdraw to lable
                              // setHelveticaMedium(withdraw_to, 16.0, Colors.black,
                              //     FontWeight.w100, FontStyle.normal),
                              //
                              // SizedBox(
                              //   height: 22,
                              // ),


                              Text(acc_name.toUpperCase(), style: TextStyle(fontFamily: helveticaNeueNeue_medium,
                                  fontSize: 13.0,
                                  color: grey_96a6a3),),
                              SizedBox(height: 5,),
                              Container(
                                  height: HeightData.fifty_three,
                                  decoration: BoxDecoration(
                                    color: white,
                                    borderRadius: BorderRadius.circular(10),
                                  ),
                                  child: Center(
                                    child: TextFormField(
                                      controller: controller.accName.value,
                                      textInputAction: TextInputAction.next,
                                      style: TextStyle(
                                          fontFamily: helveticaNeueNeue_medium,
                                          fontSize: 14.0,
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
                                  )
                              ),
                              SizedBox(height: 20,),

                              Text(bank_name.toUpperCase(), style: TextStyle(fontFamily: helveticaNeueNeue_medium,
                                  fontSize: 13.0,
                                  color: grey_96a6a3),),
                              SizedBox(height: 5,),
                              Container(
                                  height: HeightData.fifty_three,
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

                              SizedBox(height: 20,),

                              Text(account_number.toUpperCase(), style: TextStyle(fontFamily: helveticaNeueNeue_medium,
                                  fontSize: 13.0,
                                  color: grey_96a6a3),),
                              SizedBox(height: 5,),
                              Container(
                                  height: HeightData.fifty_three,
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


                              SizedBox(height: 20,),
                              Text(routing_numder.toUpperCase(), style: TextStyle(fontFamily: helveticaNeueNeue_medium,
                                  fontSize: 13.0,
                                  color: grey_96a6a3),),
                              SizedBox(height: 5,),
                              Container(
                                  height: HeightData.fifty_three,
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


                              SizedBox(height: 20,),
                              Text(bank_address.toUpperCase(), style: TextStyle(fontFamily: helveticaNeueNeue_medium,
                                  fontSize: 13.0,
                                  color: grey_96a6a3),),
                              SizedBox(height: 5,),
                              Container(
                                  height: HeightData.fifty_three,
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
                              SizedBox(height: 30),

                              // Withdraw to lable
                              setHelceticaBold(save_as, 16.0, Colors.black,
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

                              SizedBox(height: 15),
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
                    setHelveticaMedium(accountType, 12.0, black,
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
