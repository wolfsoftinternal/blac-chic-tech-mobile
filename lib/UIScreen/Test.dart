import 'package:flutter/material.dart';

import '../Widget/Indicator.dart';

class Test extends StatefulWidget {
  const Test({Key? key}) : super(key: key);

  @override
  _TestState createState() => _TestState();
}



class _TestState extends State<Test> {

  final PageController controller = PageController(initialPage: 200);

  void _pageChanged(int index) {
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        SizedBox(
            height: 150.0,
            child: Container(
              color: Colors.grey,
              child: PageView.builder(
                onPageChanged: _pageChanged,
                controller: controller,
                itemBuilder: (context, index) {
                  return new Center(
                    child: new Text('page ${index}'),
                  );
                },
              ),
            )),
        Indicator(
          controller: controller,
          itemCount: 5,
        ),
      ],
    );
  }


}






