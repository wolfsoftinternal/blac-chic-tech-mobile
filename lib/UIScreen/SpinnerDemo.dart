import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';

import '../Styles/my_colors.dart';
import '../Styles/my_icons.dart';

class SpinnerDemo extends StatefulWidget {
  const SpinnerDemo({Key? key}) : super(key: key);

  @override
  State<SpinnerDemo> createState() => _SpinnerDemoState();
}

class _SpinnerDemoState extends State<SpinnerDemo> {

  final List<String> items = [
    'Item1',
    'Item2',
    'Item3',
    'Item4',
  ];
  String? selectedValue;

  List<DropdownMenuItem<String>> _addDividersAfterItems(List<String> items) {
    List<DropdownMenuItem<String>> _menuItems = [];
    for (var item in items) {
      _menuItems.addAll(
        [
          DropdownMenuItem<String>(
            value: item,
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8.0),
              child: Text(
                item,
                style: const TextStyle(
                  fontSize: 14,
                ),
              ),
            ),
          ),
          //If it's last item, we will not add Divider after it.
          if (item != items.last)
            const DropdownMenuItem<String>(
              enabled: false,
              child: Divider(),
            ),
        ],
      );
    }
    return _menuItems;
  }

  List<int> _getDividersIndexes() {
    List<int> _dividersIndexes = [];
    for (var i = 0; i < (items.length * 2) - 1; i++) {
      //Dividers indexes will be the odd indexes
      if (i.isOdd) {
        _dividersIndexes.add(i);
      }
    }
    return _dividersIndexes;
  }


  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
          body: Column(
            children: [
           //   Expanded(child: Column(children: [],)),

              Padding(
                padding: const EdgeInsets.all(20.0),
                child: Center(
                  child: DropdownButtonHideUnderline(
                    child: DropdownButton2(
                      isExpanded: true,
                      hint: Text(
                        'Select Item',
                        style: TextStyle(
                          fontSize: 14,
                          color: Theme
                              .of(context)
                              .hintColor,
                        ),
                      ),
                      items: _addDividersAfterItems(items),
                      customItemsIndexes: _getDividersIndexes(),
                      customItemsHeight: 4,
                      icon: SvgPicture.asset(
                        icon_down_arrow_spinner,
                        width: 12.r,
                        height: 12.r,
                      ),
                      value: selectedValue,
                      onChanged: (value) {
                        setState(() {
                          selectedValue = value as String;
                        });
                      },
                      iconEnabledColor: black_121212,
                      iconDisabledColor: Colors.grey,
                      buttonHeight: 60,
                      buttonWidth: double.infinity,
                      buttonPadding: const EdgeInsets.only(left: 14, right: 14),
                      buttonDecoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(4),
                        border: Border.all(
                          color: grey_e8e8e8,
                        ),
                        color: white,
                      ),
                      itemPadding: const EdgeInsets.symmetric(horizontal: 8.0),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ));
  }
}
