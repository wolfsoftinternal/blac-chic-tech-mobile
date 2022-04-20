import 'package:blackchecktech/Layout/BlackNextButton.dart';
import 'package:blackchecktech/Styles/my_colors.dart';
import 'package:blackchecktech/Styles/my_icons.dart';
import 'package:blackchecktech/Utilities/Constant.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../Layout/InputTextLayout.dart';
import '../Styles/my_height.dart';
import '../Styles/my_strings.dart';
import '../Utilities/TextfieldUtility.dart';
import '../Widget/EditTextDecoration.dart';

class PersonalInformation extends StatefulWidget {
  const PersonalInformation({Key? key}) : super(key: key);

  @override
  _PersonalInformationState createState() => _PersonalInformationState();
}



class _PersonalInformationState extends State<PersonalInformation> {

  /*Spinner Code is here*/

  List<DropdownMenuItem<String>> get dropdownItems{
    List<DropdownMenuItem<String>> menuItems = [
      DropdownMenuItem(child: Text("USA",style: TextStyle(
        fontSize: 14,fontFamily: helveticaNeueNeue_medium,color: black_121212)),value: "USA"),
      DropdownMenuItem(child: Text("Canada",style: TextStyle(
          fontSize: 14,fontFamily: helveticaNeueNeue_medium,color: black_121212)),value: "Canada"),
      DropdownMenuItem(child: Text("Brazil",style: TextStyle(
          fontSize: 14,fontFamily: helveticaNeueNeue_medium,color: black_121212)),value: "Brazil"),
      DropdownMenuItem(child: Text("England",style: TextStyle(
          fontSize: 14,fontFamily: helveticaNeueNeue_medium,color: black_121212)),value: "England"),
    ];
    return menuItems;
  }

  String? selectedValue = null;
  final _dropdownFormKey = GlobalKey<FormState>();

  var _birhtdayController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
          backgroundColor: white_ffffff,
          body: SingleChildScrollView(

            child: Padding(
              padding: const EdgeInsets.only(left: 24,right: 24,top: 20),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Personal Information
                  Center(
                    child: Text(
                        str_personal_info,
                        style:  TextStyle(
                            color:  black_121212,
                            fontWeight: FontWeight.w900,
                            fontFamily: helvetica_neu_bold,
                            fontStyle:  FontStyle.normal,
                            fontSize: 24.0
                        ),
                        textAlign: TextAlign.center
                    ),
                  ),
                  SizedBox(height: 16,),
                  // Lorem ipsum dolor sit amet, consectetur adipiscing elit. Massa nulla.
                  Center(
                    child: Text(
                        str_personal_info_lorem,
                        style:  TextStyle(
                            color: grey_aaaaaa,
                            fontWeight: FontWeight.w500,
                            fontFamily: helveticaNeueNeue_medium,
                            fontStyle:  FontStyle.normal,
                            fontSize: 14.0,
                          height: 1.5
                        ),
                        textAlign: TextAlign.center
                    ),
                  ),
                  SizedBox(height: 32,),
                  // Rectangle 1407
                  Row(
                    children: [
                      Container(
                          width: 72,
                          height: 72,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.all(
                                  Radius.circular(4)
                              ),
                              color: light_grey_f2f2f2
                          ),
                        child: Padding(
                          padding: const EdgeInsets.all(24.0),
                          child: SvgPicture.asset(icon_upload_img,),
                        ),

                      ),
                      SizedBox(width: 16,),
                      // UPLOAD PHOTO
                      Text(
                          "UPLOAD PHOTO",
                          style:  TextStyle(
                              color:  black_121212,
                              fontWeight: FontWeight.w900,
                              fontFamily: helvetica_neu_bold,
                              fontStyle:  FontStyle.normal,
                              fontSize: 12.0
                          ),
                          textAlign: TextAlign.left
                      )
                    ],
                  ),

                  SizedBox(height: 23.3,),

                  Row(
                    children: [
                      Expanded(
                        flex: 1,
                        child: Container(
                          height: HeightData.fifty_seven,
                          decoration: EditTextDecoration,
                          child: DropdownButtonHideUnderline(
                            child: Padding(
                              padding:  EdgeInsets.only(left: 10,right: 10),
                              child: DropdownButton(
                                //  validator: (value) => value == null ? "Select a country" : null,
                                  dropdownColor: Colors.white,
                                  value: selectedValue,
                                  icon: SvgPicture.asset(icon_down_arrow_spinner,width: 12,height: 12,),
                                  onChanged: (String? newValue) {
                                    setState(() {
                                      selectedValue = newValue!;
                                    });
                                  },
                                  items: dropdownItems),
                            ),
                          ),
                        ),
                      ),
                      SizedBox(width: 16,),
                      Expanded(
                        flex: 1,
                        child: Container(
                          height: HeightData.fifty_seven,
                          decoration:EditTextDecoration,
                          child: DropdownButtonHideUnderline(
                            child: Padding(
                              padding:  EdgeInsets.only(left: 10,right: 10),
                              child: DropdownButton(

                                //  validator: (value) => value == null ? "Select a country" : null,
                                  dropdownColor: Colors.white,
                                  value: selectedValue,
                                  icon: SvgPicture.asset(icon_down_arrow_spinner,width: 12,height: 12,),
                                  onChanged: (String? newValue) {
                                    setState(() {
                                      selectedValue = newValue!;
                                    });
                                  },
                                  items: dropdownItems),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),

                  SizedBox(height: 16,),
                  // InputTextLayout(
                  //     "Date of birth",
                  //     _birhtdayController,
                  //     false,
                  //     TextInputAction.next,
                  //     TextInputType.emailAddress),

                  Container(
                    height: HeightData.fifty_seven,
                    decoration: EditTextDecoration,
                    child: Padding(
                      padding: const EdgeInsets.only(
                        left: 12, right: 12, ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [


                          Expanded(
                            flex: 1,
                            child: Padding(
                              padding: const EdgeInsets.all(5),
                              child: setTextFieldNext(
                                _birhtdayController,
                                "Date of Birth",
                                false,
                                TextInputType.emailAddress,
                                false,
                                "",
                                TextInputAction.next,
                                    () => {
                                  // on Chnages
                                },
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),

                  SizedBox(height: 24,),
                  Row(
                    children: [

                      Expanded(
                        flex: 1,
                        child: Container(

                          height: 0.7,
                          color: Colors.black12,
                        ),
                      ),
                      // Social Media Account
                      Text(
                          "Social Media Account",
                          style:  TextStyle(
                              color:  Colors.black,
                              fontWeight: FontWeight.w500,
                              fontFamily: "NeueHelvetica",
                              fontStyle:  FontStyle.normal,
                              fontSize: 14.0
                          ),
                          textAlign: TextAlign.left
                      ),


                      Expanded(
                        flex: 1,
                        child: Container(

                          height: 0.7,
                          color: Colors.black12,
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 24,),
                  Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(4),
                      border: Border.all(width: 1,
                      color: light_grey_f2f2f2)
                    ),
                    child: Padding(
                      padding: const EdgeInsets.only(left: 17.5,right: 17.5,top: 13.5,bottom: 13.5),
                      child: Row(
                        children: [
                          SvgPicture.asset(icon_linkedin,width: 21,height: 21,),
                          SizedBox(width: 17.5,),
                          // www.linkedin.com/elmira
                          Text(
                              "www.linkedin.com/elmira",
                              style:  TextStyle(
                                  color:  black_121212,
                                  fontWeight: FontWeight.w500,
                                  fontFamily: helveticaNeueNeue_medium,
                                  fontStyle:  FontStyle.normal,
                                  fontSize: 14.0
                              ),
                              textAlign: TextAlign.left
                          )
                        ],
                      ),
                    ),
                  ),
                  SizedBox(height: 16,),
                  Container(
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(4),
                        border: Border.all(width: 1,
                            color: light_grey_f2f2f2)
                    ),
                    child: Padding(
                      padding: const EdgeInsets.only(left: 17.5,right: 17.5,top: 13.5,bottom: 13.5),
                      child: Row(
                        children: [
                          SvgPicture.asset(icon_linkedin,width: 21,height: 21,),
                          SizedBox(width: 17.5,),
                          // www.linkedin.com/elmira
                          Text(
                              "Twitter Account",
                              style:  TextStyle(
                                  color:  black_121212,
                                  fontWeight: FontWeight.w500,
                                  fontFamily: helveticaNeueNeue_medium,
                                  fontStyle:  FontStyle.normal,
                                  fontSize: 14.0
                              ),
                              textAlign: TextAlign.left
                          )
                        ],
                      ),
                    ),
                  ),
                  SizedBox(height: 16,),
                  Container(
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(4),
                        border: Border.all(width: 1,
                            color: light_grey_f2f2f2)
                    ),
                    child: Padding(
                      padding: const EdgeInsets.only(left: 17.5,right: 17.5,top: 13.5,bottom: 13.5),
                      child: Row(
                        children: [
                          SvgPicture.asset(icon_instagram,width: 21,height: 21,),
                          SizedBox(width: 17.5,),
                          // www.linkedin.com/elmira
                          Text(
                              "Instagram Account",
                              style:  TextStyle(
                                  color:  black_121212,
                                  fontWeight: FontWeight.w500,
                                  fontFamily: helveticaNeueNeue_medium,
                                  fontStyle:  FontStyle.normal,
                                  fontSize: 14.0
                              ),
                              textAlign: TextAlign.left
                          )
                        ],
                      ),
                    ),
                  ),
                  SizedBox(height: 16,),
                  BlackNextButton(str_continue, black_121212, (){})
                ],
              ),
            ),
          ),
        ));
  }


}
