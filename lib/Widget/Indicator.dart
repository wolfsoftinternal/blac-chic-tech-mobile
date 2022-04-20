import 'package:blackchecktech/Styles/my_colors.dart';
import 'package:flutter/material.dart';


class Indicator extends StatelessWidget {
  Indicator({
     required this.controller,
    this.itemCount: 0,
  }) : assert(controller != null);

  /// PageView Controller
  final PageController controller;

  /// Number of indicators
  final int itemCount;

  /// Ordinary colours
  final Color normalColor = light_grey_f2f2f2;

  /// Selected color
  final Color selectedColor = orange_ff881a;

  /// Size of points
  final double size = 6.0;

  /// Spacing of points
  final double spacing = 4.0;

  /// Point Widget
  Widget _buildIndicator(
      int index, int pageCount, double dotSize, double spacing) {
    // Is the current page selected?
    bool isCurrentPageSelected = index ==
        (controller.page != null ? controller.page!.round() % pageCount : 0);

    return new Container(
      height: size,
      width: 30 + (2 * spacing),
      child: new Center(
        child: new Material(
          borderRadius: BorderRadius.circular(10),
          color: isCurrentPageSelected ? selectedColor : normalColor,
        //  type: MaterialType.circle,
          child: new Container(
            width: 30,
            height: dotSize,
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return new Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: new List<Widget>.generate(itemCount, (int index) {
        return _buildIndicator(index, itemCount, size, spacing);
      }),
    );
  }
}