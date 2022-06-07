import 'package:blackchecktech/Utilities/TextUtilities.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';

import '../../../../Layout/ElevatedGreenButtonSecond.dart';
import '../../../../Layout/ToolbarWithHeaderCenterTitle.dart';
import '../../../../Styles/my_colors.dart';
import '../../../../Styles/my_icons.dart';
import '../../../../Styles/my_strings.dart';
import '../../../../Utilities/Constant.dart';
import '../../../../Utils/CommonWidget.dart';
import '../../../../Utils/SizeConfig.dart';
import '../../../../Utils/internet_connection.dart';
import '../../../../Utils/share_predata.dart';
import '../controller/WithdrawController.dart';
import '../model/RecentWithdrawModel.dart';
import 'AddBankAccountPage.dart';


class WithdrawChooseBankAccount extends StatefulWidget {
  const WithdrawChooseBankAccount({Key? key, required this.walletAmount}) : super(key: key);

  final String walletAmount;

  @override
  _WithdrawChooseBankAccountState createState() =>
      _WithdrawChooseBankAccountState();
}

class _WithdrawChooseBankAccountState extends State<WithdrawChooseBankAccount> {
  WithdrawController controller = Get.put(WithdrawController());
  bool isMoreAmount = false;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    controller.walletAmount.value = widget.walletAmount;

    checkNet(context).then((value) {
      controller.selectAccountApi();
    });
  }

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);

    return Scaffold(
        backgroundColor: Colors.white,
        body: Obx(
          () => SafeArea(
            child: Container(
                width: double.infinity,
                child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      ToolbarWithHeaderCenterTitle("Withdraw"),
                      Divider(
                        height: 1,
                        color: grey_E9ECEC,
                        thickness: 1,
                      ),
                      isMoreAmount == true
                      ? Container(
                        width: double.infinity,
                        height: 40,
                        decoration: BoxDecoration(
                          color: Colors.red,
                        ),
                        child: Center(child: Text(
                          "You can't request more than your available balance.",
                          style: TextStyle(
                            fontSize: 14.0,
                            fontFamily: helveticaNeue,
                            color: white_ccffffff,
                          ),
                        )),
                      ) : Container(),
                      SizedBox(
                        height: 44,
                      ),
                      Expanded(
                        flex: 1,
                        child: Padding(
                          padding: const EdgeInsets.only(left: 30, right: 30),
                          child: SingleChildScrollView(
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Center(
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.center,
                                    children: [
                                      Spacer(),
                                      Flexible(
                                        flex: 2,
                                        child: TextField(
                                          controller:
                                              controller.addAmount.value,
                                          autofocus: true,
                                          style: TextStyle(
                                            fontSize: 40.0,
                                            fontFamily: helvetica_neu_bold,
                                            color: black,
                                            fontStyle: FontStyle.normal,
                                            letterSpacing: 0.5,
                                          ),
                                          decoration: InputDecoration(
                                            prefixText: SharePreData.strDollar,
                                            prefixStyle: TextStyle(
                                              fontSize: 40.0,
                                              fontFamily: helvetica_neu_bold,
                                              color: black,
                                              fontStyle: FontStyle.normal,
                                              letterSpacing: 0.5,
                                            ),
                                            contentPadding: EdgeInsets.all(10),
                                            border: InputBorder.none,
                                          ),
                                          cursorColor: skygreen_24d39e,
                                          keyboardType: TextInputType.number,
                                        ),
                                      ),
                                      Spacer(),
                                    ],
                                  ),
                                ),
                                SizedBox(
                                  height: 14,
                                ),
                                Center(
                                  child: setHelveticaMedium(
                                      "$your_balance \$${controller.walletAmount.value}",
                                      14.0,
                                      grey_96a6a3,
                                      FontWeight.w400,
                                      FontStyle.normal),
                                ),
                                SizedBox(
                                  height: 30,
                                ),
                                Center(
                                  child: setHelveticaRegular(choose_bank_account, 16.0, black,
                                      FontWeight.w600, FontStyle.normal),
                                ),
                                SizedBox(
                                  height: 10,
                                ),
                                Column(
                                  children: [
                                    ListView.builder(
                                      physics: NeverScrollableScrollPhysics(),
                                      shrinkWrap: true,
                                      primary: false,
                                      itemBuilder: _listViewBankItem,
                                      itemCount:
                                          controller.bankAccountList.length,
                                    ),
                                    SizedBox(
                                      height: 6,
                                    ),
                                    GestureDetector(
                                      onTap: () {
                                        Navigator.push(
                                            context,
                                            MaterialPageRoute(
                                                builder: (context) =>
                                                    AddBankAccountPage()));
                                      },
                                      child: Container(
                                        height: 44.0,
                                        margin: EdgeInsets.only(top: 10),
                                        decoration: BoxDecoration(
                                            // color: Colors.grey[300],
                                            borderRadius:
                                                BorderRadius.circular(10),
                                            border: Border.all(color: black)),
                                        child: Center(
                                          child: setHelveticaMedium(
                                              "+ " + add_bank_account,
                                              14,
                                              txt_color,
                                              FontWeight.w500,
                                              FontStyle.normal),
                                        ),
                                      ),
                                    )
                                  ],
                                ),
                                SizedBox(height: 15),
                              ],
                            ),
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(24.0),
                        child: CommonElevatedButtonSecond(request_payout,
                            Colors.white, black, () {
                          if (controller.bankAccountList.toString() != '[]') {
                            if (controller.addAmount.value.text != "") {
                              if(int.parse(controller.addAmount.value.text).isGreaterThan(double.parse(controller.walletAmount.value))){
                                setState(() {
                                  isMoreAmount = true;
                                });
                              }else{
                                checkNet(context).then((value) {

                                  print('bankId '+ controller.bankId.value.toString());

                                  controller.sendWithdrawRequestApi();
                                });
                              }
                            } else {
                              snackBar(context, 'Please Set Amount');
                            }
                          }else{
                            snackBar(context, 'Please Add Bank Account');
                          }
                        }),
                      )
                    ])),
          ),
        ));
  }

  Widget _listViewBankItem(context, index) {
    BankDetails bankAccount = controller.bankAccountList[index];
    return GestureDetector(
      onTap: () {
        setState(() {
          controller.selectedAccountIndex.value = index;
          controller.bankId.value = bankAccount.id??0;
        });
      },
      child: Container(
        margin: EdgeInsets.only(top: 16),
        decoration: BoxDecoration(
          boxShadow: [
            controller.selectedAccountIndex.value == index
              ? BoxShadow(
                color: Color(0x17747796).withOpacity(0.07),
                spreadRadius: 10,
                blurRadius: 10,
                offset: Offset(0, 20), // changes position of shadow
          ) : BoxShadow(),
          ],
          color: controller.selectedAccountIndex.value == index
              ? Colors.white
              : grey_e9ecec,
          border: controller.selectedAccountIndex.value == index
              ? Border.all(color: skygreen_24d39e)
              : Border.all(color: grey_e9ecec),
          borderRadius: BorderRadius.circular(10),
        ),
        padding: EdgeInsets.only(left: 24, top: 22, bottom: 22, right: 30),
        child: Row(
          children: [
            SvgPicture.asset(
              bankAccount.saveAs == 'family_account'
                  ? family_account_icon
                  : bankAccount.saveAs == 'buisness_account'
                      ? business_account_icon
                      : personal_account_icon,
              width: 36,
              height: 36,
            ),
            SizedBox(
              width: 20,
            ),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  setHelveticaMedium(
                      bankAccount.saveAs == "family_account"
                          ? family_account
                          : bankAccount.saveAs == "buisness_account"
                              ? business_account
                              : personal_account,
                      14,
                      black,
                      FontWeight.w500,
                      FontStyle.normal),
                  SizedBox(
                    height: 8,
                  ),
                  setHelveticaMedium(
                      "****-****-${bankAccount.accountNumber?.substring(bankAccount.accountNumber!.length - 4)}",
                      12,
                      grey_96a6a3,
                      FontWeight.w400,
                      FontStyle.normal),
                ],
              ),
            ),
            SizedBox(
              width: 20,
            ),
            SvgPicture.asset(
              controller.selectedAccountIndex.value == index
                  ? orange_circle_check
                  : oval_icon,
              width: 24,
              height: 24,
            ),
          ],
        ),
      ),
    );
  }
}
