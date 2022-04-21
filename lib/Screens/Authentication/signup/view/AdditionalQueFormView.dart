import 'package:blackchecktech/Layout/BlackNextButton.dart';
import 'package:blackchecktech/Styles/my_colors.dart';
import 'package:blackchecktech/Styles/my_icons.dart';
import 'package:blackchecktech/Utilities/Constant.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../../../Layout/BlackButtonDialog.dart';
import '../../../../Layout/InputTextLayout.dart';
import '../../../../Styles/my_height.dart';
import '../../../../Styles/my_strings.dart';
import '../../../../Utilities/TextfieldUtility.dart';
import '../../../../Widget/EditTextDecoration.dart';

class AdditionalQueFormView extends StatefulWidget {
  const AdditionalQueFormView({Key? key}) : super(key: key);

  @override
  _AdditionalQueState createState() => _AdditionalQueState();
}

class _AdditionalQueState extends State<AdditionalQueFormView> {
  var _birhtdayController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      backgroundColor: white_ffffff,
      body: Column(
        children: [
          Expanded(
            flex: 1,
            child: SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.only(left: 24, right: 24, top: 20),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // Personal Information
                    Center(
                      child: Text(str_Additional_Questions,
                          style: TextStyle(
                              color: black_121212,
                              fontWeight: FontWeight.w900,
                              fontFamily: helvetica_neu_bold,
                              fontStyle: FontStyle.normal,
                              fontSize: 24.0),
                          textAlign: TextAlign.center),
                    ),
                    SizedBox(
                      height: 16,
                    ),
                    // Lorem ipsum dolor sit amet, consectetur adipiscing elit. Massa nulla.
                    Center(
                      child: Text(str_personal_info_lorem,
                          style: TextStyle(
                              color: grey_aaaaaa,
                              fontWeight: FontWeight.w500,
                              fontFamily: helveticaNeueNeue_medium,
                              fontStyle: FontStyle.normal,
                              fontSize: 14.0,
                              height: 1.5),
                          textAlign: TextAlign.center),
                    ),
                    SizedBox(
                      height: 32,
                    ),

                    GestureDetector(
                      onTap: () => DialogUtils.showDoneDialog(context),
                      child: Container(
                        width: double.infinity,
                        decoration: EditTextDecoration,
                        child: Padding(
                          padding: const EdgeInsets.all(16),
                          child: // What have you done?
                              Text("What have you done?",
                                  style: const TextStyle(
                                      color: grey_aaaaaa,
                                      fontWeight: FontWeight.w500,
                                      fontFamily: helveticaNeueNeue_medium,
                                      fontStyle: FontStyle.normal,
                                      fontSize: 14.0),
                                  textAlign: TextAlign.left),
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 16,
                    ),
                    GestureDetector(
                      onTap: () => DialogUtilsFuture.showFutureDialog(context),
                      child: Container(
                        width: double.infinity,
                        decoration: EditTextDecoration,
                        child: Padding(
                          padding: const EdgeInsets.all(16),
                          child: // What have you done?
                              Text("What will you be doing in the future ?",
                                  style: const TextStyle(
                                      color: grey_aaaaaa,
                                      fontWeight: FontWeight.w500,
                                      fontFamily: helveticaNeueNeue_medium,
                                      fontStyle: FontStyle.normal,
                                      fontSize: 14.0),
                                  textAlign: TextAlign.left),
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 16,
                    ),
                    GestureDetector(
                      onTap: () => DialogUtilsDie.showFutureDialog(context),
                      child: Container(
                        width: double.infinity,
                        decoration: EditTextDecoration,
                        child: Padding(
                          padding: const EdgeInsets.all(16),
                          child: // What have you done?
                              Text(
                                  "What hill are you 1000% willing to die on ?",
                                  style: const TextStyle(
                                      color: grey_aaaaaa,
                                      fontWeight: FontWeight.w500,
                                      fontFamily: helveticaNeueNeue_medium,
                                      fontStyle: FontStyle.normal,
                                      fontSize: 14.0),
                                  textAlign: TextAlign.left),
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 16,
                    ),
                    GestureDetector(
                      onTap: () => DialogUtilsGood.showFutureDialog(context),
                      child: Container(
                        width: double.infinity,
                        decoration: EditTextDecoration,
                        child: Padding(
                          padding: const EdgeInsets.all(16),
                          child: // What have you done?
                              Text("Come to me for - what are you good at ?",
                                  style: const TextStyle(
                                      color: grey_aaaaaa,
                                      fontWeight: FontWeight.w500,
                                      fontFamily: helveticaNeueNeue_medium,
                                      fontStyle: FontStyle.normal,
                                      fontSize: 14.0),
                                  textAlign: TextAlign.left),
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 16,
                    ),
                    GestureDetector(
                      onTap: () => DialogUtilsNow.showFutureDialog(context),
                      child: Container(
                        width: double.infinity,
                        decoration: EditTextDecoration,
                        child: Padding(
                          padding: const EdgeInsets.all(16),
                          child: // What have you done?
                              Text("What are you working on right now ?",
                                  style: const TextStyle(
                                      color: grey_aaaaaa,
                                      fontWeight: FontWeight.w500,
                                      fontFamily: helveticaNeueNeue_medium,
                                      fontStyle: FontStyle.normal,
                                      fontSize: 14.0),
                                  textAlign: TextAlign.left),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(24.0),
            child: BlackNextButton(str_continue, black_121212, () {}),
          )
        ],
      ),
    ));
  }
}

class DialogUtils {
  static DialogUtils _instance = new DialogUtils.internal();

  DialogUtils.internal();

  factory DialogUtils() => _instance;

  static void showDoneDialog(
    BuildContext context,
  ) {
    showDialog(
        context: context,
        builder: (BuildContext context) {
          return Dialog(
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(4.0)), //this right here
            child: Container(
              height: 360,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // WHAT HAVE YOU DONE ?
                  Center(
                    child: Padding(
                      padding: const EdgeInsets.only(top: 24, bottom: 16),
                      child: Text("WHAT HAVE YOU DONE ?",
                          style: const TextStyle(
                              color: black_121212,
                              fontWeight: FontWeight.w900,
                              fontFamily: helvetica_neu_bold,
                              fontStyle: FontStyle.normal,
                              fontSize: 14.0),
                          textAlign: TextAlign.left),
                    ),
                  ),

                  Container(
                    height: 0.7,
                    color: Colors.black12,
                  ),

                  Expanded(
                    flex: 1,
                    child: Padding(
                      padding: const EdgeInsets.only(
                          top: 15, bottom: 15, right: 24, left: 24),
                      child: TextFormField(
                        minLines: 2,
                        maxLines: 10,
                        keyboardType: TextInputType.multiline,
                        style: TextStyle(
                            color: black_121212,
                            fontWeight: FontWeight.w500,
                            fontFamily: helveticaNeueNeue_medium,
                            fontStyle: FontStyle.normal,
                            fontSize: 14.0),
                        decoration: InputDecoration(
                          border: InputBorder.none,
                          focusedBorder: InputBorder.none,
                          enabledBorder: InputBorder.none,
                          errorBorder: InputBorder.none,
                          disabledBorder: InputBorder.none,
                          hintText: 'Please type here...',
                          hintStyle: TextStyle(
                              color: grey_aaaaaa,
                              fontWeight: FontWeight.w500,
                              fontFamily: helveticaNeueNeue_medium,
                              fontStyle: FontStyle.normal,
                              fontSize: 14.0),
                        ),
                      ),
                    ),
                  ),

                  Padding(
                    padding: const EdgeInsets.all(24.0),
                    child: BlackButtonDialog("Done", white_ffffff, () {}),
                  )
                ],
              ),
            ),
          );
        });
  }
}

class DialogUtilsFuture {
  static DialogUtilsFuture _instance = new DialogUtilsFuture.internal();

  DialogUtilsFuture.internal();

  factory DialogUtilsFuture() => _instance;

  static void showFutureDialog(
    BuildContext context,
  ) {
    showDialog(
        context: context,
        builder: (BuildContext context) {
          return Dialog(
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(4.0)), //this right here
            child: Container(
              height: 360,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // WHAT HAVE YOU DONE ?
                  Center(
                    child: Padding(
                      padding: const EdgeInsets.only(top: 24, bottom: 16),
                      child: Text("WHAT WILL YOU BE DOING IN THE FUTURE ?",
                          style: const TextStyle(
                              color: black_121212,
                              fontWeight: FontWeight.w900,
                              fontFamily: helvetica_neu_bold,
                              fontStyle: FontStyle.normal,
                              fontSize: 14.0),
                          textAlign: TextAlign.center),
                    ),
                  ),

                  Container(
                    height: 0.7,
                    color: Colors.black12,
                  ),

                  Expanded(
                    flex: 1,
                    child: Padding(
                      padding: const EdgeInsets.only(
                          top: 15, bottom: 15, right: 24, left: 24),
                      child: TextFormField(
                        minLines: 2,
                        maxLines: 10,
                        keyboardType: TextInputType.multiline,
                        style: TextStyle(
                            color: black_121212,
                            fontWeight: FontWeight.w500,
                            fontFamily: helveticaNeueNeue_medium,
                            fontStyle: FontStyle.normal,
                            fontSize: 14.0),
                        decoration: InputDecoration(
                          border: InputBorder.none,
                          focusedBorder: InputBorder.none,
                          enabledBorder: InputBorder.none,
                          errorBorder: InputBorder.none,
                          disabledBorder: InputBorder.none,
                          hintText: 'Please type here...',
                          hintStyle: TextStyle(
                              color: grey_aaaaaa,
                              fontWeight: FontWeight.w500,
                              fontFamily: helveticaNeueNeue_medium,
                              fontStyle: FontStyle.normal,
                              fontSize: 14.0),
                        ),
                      ),
                    ),
                  ),

                  Padding(
                    padding: const EdgeInsets.all(24.0),
                    child: BlackButtonDialog("Done", white_ffffff, () {}),
                  )
                ],
              ),
            ),
          );
        });
  }
}

class DialogUtilsDie {
  static DialogUtilsDie _instance = new DialogUtilsDie.internal();

  DialogUtilsDie.internal();

  factory DialogUtilsDie() => _instance;

  static void showFutureDialog(
    BuildContext context,
  ) {
    showDialog(
        context: context,
        builder: (BuildContext context) {
          return Dialog(
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(4.0)), //this right here
            child: Container(
              height: 360,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // WHAT HAVE YOU DONE ?
                  Center(
                    child: Padding(
                      padding: const EdgeInsets.only(
                          top: 24, bottom: 16, left: 16, right: 16),
                      child: Text("WHAT HILL ARE YOU 1000% WILLING TO DIE ON ?",
                          style: const TextStyle(
                              color: black_121212,
                              fontWeight: FontWeight.w900,
                              fontFamily: helvetica_neu_bold,
                              fontStyle: FontStyle.normal,
                              fontSize: 14.0),
                          textAlign: TextAlign.center),
                    ),
                  ),

                  Container(
                    height: 0.7,
                    color: Colors.black12,
                  ),

                  Expanded(
                    flex: 1,
                    child: Padding(
                      padding: const EdgeInsets.only(
                          top: 15, bottom: 15, right: 24, left: 24),
                      child: TextFormField(
                        minLines: 2,
                        maxLines: 10,
                        keyboardType: TextInputType.multiline,
                        style: TextStyle(
                            color: black_121212,
                            fontWeight: FontWeight.w500,
                            fontFamily: helveticaNeueNeue_medium,
                            fontStyle: FontStyle.normal,
                            fontSize: 14.0),
                        decoration: InputDecoration(
                          border: InputBorder.none,
                          focusedBorder: InputBorder.none,
                          enabledBorder: InputBorder.none,
                          errorBorder: InputBorder.none,
                          disabledBorder: InputBorder.none,
                          hintText: 'Please type here...',
                          hintStyle: TextStyle(
                              color: grey_aaaaaa,
                              fontWeight: FontWeight.w500,
                              fontFamily: helveticaNeueNeue_medium,
                              fontStyle: FontStyle.normal,
                              fontSize: 14.0),
                        ),
                      ),
                    ),
                  ),

                  Padding(
                    padding: const EdgeInsets.all(24.0),
                    child: BlackButtonDialog("Done", white_ffffff, () {}),
                  )
                ],
              ),
            ),
          );
        });
  }
}

class DialogUtilsGood {
  static DialogUtilsGood _instance = new DialogUtilsGood.internal();

  DialogUtilsGood.internal();

  factory DialogUtilsGood() => _instance;

  static void showFutureDialog(
    BuildContext context,
  ) {
    showDialog(
        context: context,
        builder: (BuildContext context) {
          return Dialog(
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(4.0)), //this right here
            child: Container(
              height: 360,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // WHAT HAVE YOU DONE ?
                  Center(
                    child: Padding(
                      padding: const EdgeInsets.only(
                          top: 24, bottom: 16, left: 16, right: 16),
                      child: Text("COME TO ME FOR - WHAT ARE YOU GOOD AT ?",
                          style: const TextStyle(
                              color: black_121212,
                              fontWeight: FontWeight.w900,
                              fontFamily: helvetica_neu_bold,
                              fontStyle: FontStyle.normal,
                              fontSize: 14.0),
                          textAlign: TextAlign.center),
                    ),
                  ),

                  Container(
                    height: 0.7,
                    color: Colors.black12,
                  ),

                  Expanded(
                    flex: 1,
                    child: Padding(
                      padding: const EdgeInsets.only(
                          top: 15, bottom: 15, right: 24, left: 24),
                      child: TextFormField(
                        minLines: 2,
                        maxLines: 10,
                        keyboardType: TextInputType.multiline,
                        style: TextStyle(
                            color: black_121212,
                            fontWeight: FontWeight.w500,
                            fontFamily: helveticaNeueNeue_medium,
                            fontStyle: FontStyle.normal,
                            fontSize: 14.0),
                        decoration: InputDecoration(
                          border: InputBorder.none,
                          focusedBorder: InputBorder.none,
                          enabledBorder: InputBorder.none,
                          errorBorder: InputBorder.none,
                          disabledBorder: InputBorder.none,
                          hintText: 'Please type here...',
                          hintStyle: TextStyle(
                              color: grey_aaaaaa,
                              fontWeight: FontWeight.w500,
                              fontFamily: helveticaNeueNeue_medium,
                              fontStyle: FontStyle.normal,
                              fontSize: 14.0),
                        ),
                      ),
                    ),
                  ),

                  Padding(
                    padding: const EdgeInsets.all(24.0),
                    child: BlackButtonDialog("Done", white_ffffff, () {}),
                  )
                ],
              ),
            ),
          );
        });
  }
}

class DialogUtilsNow {
  static DialogUtilsNow _instance = new DialogUtilsNow.internal();

  DialogUtilsNow.internal();

  factory DialogUtilsNow() => _instance;

  static void showFutureDialog(
    BuildContext context,
  ) {
    showDialog(
        context: context,
        builder: (BuildContext context) {
          return Dialog(
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(4.0)), //this right here
            child: Container(
              height: 360,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // WHAT HAVE YOU DONE ?
                  Center(
                    child: Padding(
                      padding: const EdgeInsets.only(
                          top: 24, bottom: 16, left: 16, right: 16),
                      child: Text("WHAT ARE YOU WORKING ON RIGHT NOW ?",
                          style: const TextStyle(
                              color: black_121212,
                              fontWeight: FontWeight.w900,
                              fontFamily: helvetica_neu_bold,
                              fontStyle: FontStyle.normal,
                              fontSize: 14.0),
                          textAlign: TextAlign.center),
                    ),
                  ),

                  Container(
                    height: 0.7,
                    color: Colors.black12,
                  ),

                  Expanded(
                    flex: 1,
                    child: Padding(
                      padding: const EdgeInsets.only(
                          top: 15, bottom: 15, right: 24, left: 24),
                      child: TextFormField(
                        minLines: 2,
                        maxLines: 10,
                        keyboardType: TextInputType.multiline,
                        style: TextStyle(
                            color: black_121212,
                            fontWeight: FontWeight.w500,
                            fontFamily: helveticaNeueNeue_medium,
                            fontStyle: FontStyle.normal,
                            fontSize: 14.0),
                        decoration: InputDecoration(
                          border: InputBorder.none,
                          focusedBorder: InputBorder.none,
                          enabledBorder: InputBorder.none,
                          errorBorder: InputBorder.none,
                          disabledBorder: InputBorder.none,
                          hintText: 'Please type here...',
                          hintStyle: TextStyle(
                              color: grey_aaaaaa,
                              fontWeight: FontWeight.w500,
                              fontFamily: helveticaNeueNeue_medium,
                              fontStyle: FontStyle.normal,
                              fontSize: 14.0),
                        ),
                      ),
                    ),
                  ),

                  Padding(
                    padding: const EdgeInsets.all(24.0),
                    child: BlackButtonDialog("Done", white_ffffff, () {}),
                  )
                ],
              ),
            ),
          );
        });
  }
}
