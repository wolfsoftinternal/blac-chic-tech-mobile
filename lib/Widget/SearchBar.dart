import 'package:blackchecktech/Utils/SizeConfig.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import '../Styles/my_colors.dart';
import '../Styles/my_icons.dart';
import '../Utilities/Constant.dart';

class SearchBar extends StatefulWidget {
  final hint;
  VoidCallback? onCustomButtonPressed;

  SearchBar({this.hint, onCustomButtonPressed, Key? key}) : super(key: key);

  @override
  _SearchBarState createState() => _SearchBarState();
}

class _SearchBarState extends State<SearchBar> {
  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return Container(
      margin: EdgeInsets.only(bottom: SizeConfig.blockSizeVertical!),
      decoration: BoxDecoration(
          borderRadius:
          BorderRadius.all(Radius.circular(6.7)),
          color: grey_aaaaaa),
      child: Row(
        children: [
          SizedBox(
            width: 10,
          ),
          SvgPicture.asset(
            search,
            color: grey_aaaaaa,
            width: 15,
            height: 15,
          ),
          SizedBox(
            width: 7.7,
          ),
          Expanded(
            flex: 1,
            child: Padding(
              padding: const EdgeInsets.all(5),
              child: TextField(
                style: TextStyle(
                    color: black_121212,
                    fontFamily: helveticaNeueNeue_medium,
                    fontStyle: FontStyle.normal,
                    fontSize: 12),
                decoration: new InputDecoration(
                  isDense: true,
                  contentPadding: EdgeInsets.symmetric(
                      horizontal: 0, vertical: 10),
                  hintText: widget.hint,
                  hintStyle: TextStyle(
                      color: grey_aaaaaa,
                      fontFamily: helveticaNeueNeue_medium,
                      fontStyle: FontStyle.normal,
                      fontSize: 12),
                  border: InputBorder.none,
                ),
                keyboardType: TextInputType.text,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
