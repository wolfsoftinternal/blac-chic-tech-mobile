import 'package:blackchecktech/Styles/my_colors.dart';
import 'package:blackchecktech/Styles/my_icons.dart';
import 'package:blackchecktech/Utilities/Constant.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../Styles/my_strings.dart';

class SearchBar extends StatefulWidget {

  SearchBar(
      {
      this.controller, this.onSubmit});

  final Function(String)? onSubmit;
  final TextEditingController? controller;

  @override
  _SearchBarState createState() => _SearchBarState();
}

class _SearchBarState extends State<SearchBar> {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 54,
      decoration: BoxDecoration(
          borderRadius: const BorderRadius.all(Radius.circular(15)),
          border: Border.all(color: grey_aaaaaa, width: 1),
          color: white_ffffff),
      child: Row(
        children: [
          const SizedBox(
            width: 10,
          ),
            SvgPicture.asset(
              search,
              color: black_121212,
              width: 20,
              height: 20,
            ),
          const SizedBox(
            width: 7.7,
          ),
          Expanded(
            flex: 1,
            child: Padding(
              padding: const EdgeInsets.all(5),
              child: TextField(
                // searchInput,
                controller: widget.controller,
                onSubmitted: widget.onSubmit,
                style: const TextStyle(
                    color: black_121212,
                    fontFamily: helveticaNeueNeue_medium,
                    fontStyle: FontStyle.normal,
                    fontSize: 16),
                decoration: InputDecoration(
                  isDense: true,
                  contentPadding:
                      const EdgeInsets.symmetric(horizontal: 0, vertical: 10),
                  hintText: 'Search',
                  hintStyle: const TextStyle(
                      color: grey_aaaaaa,
                      // fontWeight: FontWeight.w500,
                      fontFamily: helveticaNeueNeue_medium,
                      fontSize: 16),
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
