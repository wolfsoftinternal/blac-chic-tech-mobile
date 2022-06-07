import 'package:blackchecktech/Utilities/TextUtilities.dart';
import 'package:flutter/material.dart';

import '../Styles/my_icons.dart';
import '../Styles/my_strings.dart';
import '../Widget/FeedListDecoration.dart';

class WalletBalanceWidget extends StatefulWidget {
  const WalletBalanceWidget({Key? key, this.amount}) : super(key: key);

  final String? amount;

  @override
  _WalletBalanceWidgetState createState() => _WalletBalanceWidgetState();
}

class _WalletBalanceWidgetState extends State<WalletBalanceWidget> {
  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.center,
      children: [
        Container(
          decoration: boxDecoration,
          child: ClipRRect(
              borderRadius: BorderRadius.all(Radius.circular(8)),
              child: Image.asset(bg_green_wallet_dashboardpng,width: double.infinity,height: 70,fit: BoxFit.cover,)),
        ),
        Container(
          // padding: EdgeInsets.all(25),
          // decoration: BoxDecoration(
          //   borderRadius: BorderRadius.all(Radius.circular(10)),
          //   gradient: LinearGradient(
          //       colors: [
          //         green_15CF7D,
          //         skygreen_24d39e,
          //       ],
          //       begin: const FractionalOffset(0.0, 0.0),
          //       end: const FractionalOffset(1.0, 0.0),
          //       stops: [0.0, 1.0],
          //       tileMode: TileMode.clamp),
          // ),
          child: Padding(
            padding: const EdgeInsets.only(left: 24,right: 24),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
              setHelceticaBold(
                  balance, 14, Colors.white, FontWeight.w600, FontStyle.normal),
              Spacer(),
                  setHelceticaBold("${widget.amount}", 24, Colors.white, FontWeight.w700,
                  FontStyle.normal),
            ]),
          ),
        ),
      ],
    );
  }
}
