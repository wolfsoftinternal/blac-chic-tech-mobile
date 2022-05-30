import 'package:blackchecktech/Screens/Authentication/signup/view/FullInformationStepsView.dart';
import 'package:blackchecktech/Screens/Authentication/signup/view/RegisterInfoView.dart';
import 'package:blackchecktech/Screens/Authentication/signup/view/SignupFormView.dart';
import 'package:blackchecktech/Screens/Authentication/signup/view/SignupInfoView.dart';
import 'package:blackchecktech/Styles/my_colors.dart';
import 'package:blackchecktech/UIScreen/AboutMe.dart';
import 'package:blackchecktech/UIScreen/AdmireGrid.dart';
import 'package:blackchecktech/UIScreen/BcConnect.dart';
import 'package:blackchecktech/UIScreen/Connect12.dart';
import 'package:blackchecktech/UIScreen/CreatEventUploadImage.dart';
import 'package:blackchecktech/UIScreen/CreatPost.dart';
import 'package:blackchecktech/UIScreen/CreateEventDetail.dart';
import 'package:blackchecktech/UIScreen/EditProfile.dart';
import 'package:blackchecktech/UIScreen/EventSearch.dart';
import 'package:blackchecktech/UIScreen/EventTicket.dart';
import 'package:blackchecktech/UIScreen/EventTicketTxnId.dart';
import 'package:blackchecktech/UIScreen/Featured.dart';
import 'package:blackchecktech/UIScreen/FilterTopicList.dart';
import 'package:blackchecktech/UIScreen/FindSpeaker.dart';
import 'package:blackchecktech/UIScreen/ProgressBarStep.dart';
import 'package:blackchecktech/UIScreen/MyPlayList.dart';
import 'package:blackchecktech/UIScreen/MyPurchasedEvent.dart';
import 'package:blackchecktech/UIScreen/PostGalleryPicker.dart';
import 'package:blackchecktech/UIScreen/PostLocation.dart';
import 'package:blackchecktech/UIScreen/ProfileSetting.dart';
import 'package:blackchecktech/UIScreen/RegisteredPeople.dart';
import 'package:blackchecktech/UIScreen/SpeakersVideos.dart';
import 'package:blackchecktech/UIScreen/TagPeople.dart';
import 'package:blackchecktech/UIScreen/Test2.dart';
import 'package:blackchecktech/UIScreen/TransactionsPayoutsTabs.dart';
import 'package:blackchecktech/UIScreen/UploadVideoDetail.dart';
import 'package:blackchecktech/UIScreen/UploadVideos.dart';
import 'package:blackchecktech/UIScreen/VideoComments.dart';
import 'package:blackchecktech/UIScreen/VideoListBct.dart';
import 'package:blackchecktech/UIScreen/VideoSearch.dart';
// import 'package:blackchecktech/UIScreen/OwnProfile.dart';
import 'package:blackchecktech/Utilities/Constant.dart';
import 'package:flutter/material.dart';

import '../Screens/Authentication/login/view/LoginView.dart';
import 'Demo.dart';
import 'EventList2.dart';
import 'PastFeature.dart';
import 'Test.dart';
import '../Welcome.dart';
import 'VideoDetailTab.dart';

class ListScreen extends StatelessWidget {
  const ListScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
          backgroundColor: white_ffffff,
          body: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                GestureDetector(
                  onTap: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const Test2(),
                        ));
                  },
                  child: const Padding(
                    padding: EdgeInsets.all(12.0),
                    child: Text(
                      "Test2 Screen",
                      style: TextStyle(
                          color: Colors.black87,
                          fontFamily: helveticaNeueNeue_medium,
                          fontSize: 16),
                    ),
                  ),
                ),
                GestureDetector(
                  onTap: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => ProgressBarStep(),
                        ));
                  },
                  child: const Padding(
                    padding: EdgeInsets.all(12.0),
                    child: Text(
                      "FoureStep Screen",
                      style: TextStyle(
                          color: Colors.black87,
                          fontFamily: helveticaNeueNeue_medium,
                          fontSize: 16),
                    ),
                  ),
                ),
                GestureDetector(
                  onTap: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const VideoDetailTab(),
                        ));
                  },
                  child: const Padding(
                    padding: EdgeInsets.all(12.0),
                    child: Text(
                      "VideoDetailTab Screen",
                      style: TextStyle(
                          color: Colors.black87,
                          fontFamily: helveticaNeueNeue_medium,
                          fontSize: 16),
                    ),
                  ),
                ),
                GestureDetector(
                  onTap: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const FilterTopicList(),
                        ));
                  },
                  child: const Padding(
                    padding: EdgeInsets.all(12.0),
                    child: Text(
                      "FilterTopicList Screen",
                      style: TextStyle(
                          color: Colors.black87,
                          fontFamily: helveticaNeueNeue_medium,
                          fontSize: 16),
                    ),
                  ),
                ),
                GestureDetector(
                  onTap: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const Demo(),
                        ));
                  },
                  child: const Padding(
                    padding: EdgeInsets.all(12.0),
                    child: Text(
                      "Demo Screen",
                      style: TextStyle(
                          color: Colors.black87,
                          fontFamily: helveticaNeueNeue_medium,
                          fontSize: 16),
                    ),
                  ),
                ),
                GestureDetector(
                  onTap: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const Test(),
                        ));
                  },
                  child: const Padding(
                    padding: EdgeInsets.all(12.0),
                    child: Text(
                      "Test Screen",
                      style: TextStyle(
                          color: Colors.black87,
                          fontFamily: helveticaNeueNeue_medium,
                          fontSize: 16),
                    ),
                  ),
                ),
                GestureDetector(
                  onTap: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const PastFeature(),
                        ));
                  },
                  child: const Padding(
                    padding: EdgeInsets.all(12.0),
                    child: Text(
                      "PastFeature Screen",
                      style: TextStyle(
                          color: Colors.black87,
                          fontFamily: helveticaNeueNeue_medium,
                          fontSize: 16),
                    ),
                  ),
                ),
                GestureDetector(
                  onTap: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => EventList2(),
                        ));
                  },
                  child: const Padding(
                    padding: EdgeInsets.all(12.0),
                    child: Text(
                      "EventList2 Screen",
                      style: TextStyle(
                          color: Colors.black87,
                          fontFamily: helveticaNeueNeue_medium,
                          fontSize: 16),
                    ),
                  ),
                ),

                GestureDetector(
                  onTap: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const TransactionsPayoutsTabs(),
                        ));
                  },
                  child: const Padding(
                    padding: EdgeInsets.all(12.0),
                    child: Text(
                      "TransactionsPayoutsTabs Screen",
                      style: TextStyle(
                          color: Colors.black87,
                          fontFamily: helveticaNeueNeue_medium,
                          fontSize: 16),
                    ),
                  ),
                ),
                GestureDetector(
                  onTap: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const MyPurchasedEvent(),
                        ));
                  },
                  child: const Padding(
                    padding: EdgeInsets.all(12.0),
                    child: Text(
                      "MyPurchasedEvent Screen",
                      style: TextStyle(
                          color: Colors.black87,
                          fontFamily: helveticaNeueNeue_medium,
                          fontSize: 16),
                    ),
                  ),
                ),
                GestureDetector(
                  onTap: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const MyPlayList(),
                        ));
                  },
                  child: const Padding(
                    padding: EdgeInsets.all(12.0),
                    child: Text(
                      "MyPlayList Screen",
                      style: TextStyle(
                          color: Colors.black87,
                          fontFamily: helveticaNeueNeue_medium,
                          fontSize: 16),
                    ),
                  ),
                ),
                GestureDetector(
                  onTap: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const VideoComments(),
                        ));
                  },
                  child: const Padding(
                    padding: EdgeInsets.all(12.0),
                    child: Text(
                      "VideoComments Screen",
                      style: TextStyle(
                          color: Colors.black87,
                          fontFamily: helveticaNeueNeue_medium,
                          fontSize: 16),
                    ),
                  ),
                ),
                GestureDetector(
                  onTap: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const VideoSearch(),
                        ));
                  },
                  child: const Padding(
                    padding: EdgeInsets.all(12.0),
                    child: Text(
                      "VideoSearch Screen",
                      style: TextStyle(
                          color: Colors.black87,
                          fontFamily: helveticaNeueNeue_medium,
                          fontSize: 16),
                    ),
                  ),
                ),
                GestureDetector(
                  onTap: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const SpeakersVideos(),
                        ));
                  },
                  child: const Padding(
                    padding: EdgeInsets.all(12.0),
                    child: Text(
                      "SpeakersVideos Screen",
                      style: TextStyle(
                          color: Colors.black87,
                          fontFamily: helveticaNeueNeue_medium,
                          fontSize: 16),
                    ),
                  ),
                ),
                GestureDetector(
                  onTap: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const FindSpeaker(),
                        ));
                  },
                  child: const Padding(
                    padding: EdgeInsets.all(12.0),
                    child: Text(
                      "FindSpeaker Screen",
                      style: TextStyle(
                          color: Colors.black87,
                          fontFamily: helveticaNeueNeue_medium,
                          fontSize: 16),
                    ),
                  ),
                ),
                GestureDetector(
                  onTap: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const EventSearch(),
                        ));
                  },
                  child: const Padding(
                    padding: EdgeInsets.all(12.0),
                    child: Text(
                      "EventSearch Screen",
                      style: TextStyle(
                          color: Colors.black87,
                          fontFamily: helveticaNeueNeue_medium,
                          fontSize: 16),
                    ),
                  ),
                ),
                GestureDetector(
                  onTap: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const VideoListBct(),
                        ));
                  },
                  child: const Padding(
                    padding: EdgeInsets.all(12.0),
                    child: Text(
                      "VideoListBct Screen",
                      style: TextStyle(
                          color: Colors.black87,
                          fontFamily: helveticaNeueNeue_medium,
                          fontSize: 16),
                    ),
                  ),
                ),
                GestureDetector(
                  onTap: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const Featured(),
                        ));
                  },
                  child: const Padding(
                    padding: EdgeInsets.all(12.0),
                    child: Text(
                      "Featured Screen",
                      style: TextStyle(
                          color: Colors.black87,
                          fontFamily: helveticaNeueNeue_medium,
                          fontSize: 16),
                    ),
                  ),
                ),
                GestureDetector(
                  onTap: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const EventTicketTxnId(),
                        ));
                  },
                  child: const Padding(
                    padding: EdgeInsets.all(12.0),
                    child: Text(
                      "EventTicketTxnId Screen",
                      style: TextStyle(
                          color: Colors.black87,
                          fontFamily: helveticaNeueNeue_medium,
                          fontSize: 16),
                    ),
                  ),
                ),
                GestureDetector(
                  onTap: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const EventTicket(),
                        ));
                  },
                  child: const Padding(
                    padding: EdgeInsets.all(12.0),
                    child: Text(
                      "EventTicket Screen",
                      style: TextStyle(
                          color: Colors.black87,
                          fontFamily: helveticaNeueNeue_medium,
                          fontSize: 16),
                    ),
                  ),
                ),
                GestureDetector(
                  onTap: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const AboutMe(),
                        ));
                  },
                  child: const Padding(
                    padding: EdgeInsets.all(12.0),
                    child: Text(
                      "AboutMe Screen",
                      style: TextStyle(
                          color: Colors.black87,
                          fontFamily: helveticaNeueNeue_medium,
                          fontSize: 16),
                    ),
                  ),
                ),
                GestureDetector(
                  onTap: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const AdmireGrid(),
                        ));
                  },
                  child: const Padding(
                    padding: EdgeInsets.all(12.0),
                    child: Text(
                      "AdmireGrid Screen",
                      style: TextStyle(
                          color: Colors.black87,
                          fontFamily: helveticaNeueNeue_medium,
                          fontSize: 16),
                    ),
                  ),
                ),
                GestureDetector(
                  onTap: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const EditProfile(),
                        ));
                  },
                  child: const Padding(
                    padding: EdgeInsets.all(12.0),
                    child: Text(
                      "EditProfile Screen",
                      style: TextStyle(
                          color: Colors.black87,
                          fontFamily: helveticaNeueNeue_medium,
                          fontSize: 16),
                    ),
                  ),
                ),
                GestureDetector(
                  onTap: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const ProfileSetting(),
                        ));
                  },
                  child: const Padding(
                    padding: EdgeInsets.all(12.0),
                    child: Text(
                      "ProfileSetting Screen",
                      style: TextStyle(
                          color: Colors.black87,
                          fontFamily: helveticaNeueNeue_medium,
                          fontSize: 16),
                    ),
                  ),
                ),
                GestureDetector(
                  onTap: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const Connect12(),
                        ));
                  },
                  child: const Padding(
                    padding: EdgeInsets.all(12.0),
                    child: Text(
                      "Connect12 Screen",
                      style: TextStyle(
                          color: Colors.black87,
                          fontFamily: helveticaNeueNeue_medium,
                          fontSize: 16),
                    ),
                  ),
                ),
                GestureDetector(
                  onTap: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const BcConnect(),
                        ));
                  },
                  child: const Padding(
                    padding: EdgeInsets.all(12.0),
                    child: Text(
                      "BcConnect Screen",
                      style: TextStyle(
                          color: Colors.black87,
                          fontFamily: helveticaNeueNeue_medium,
                          fontSize: 16),
                    ),
                  ),
                ),
                GestureDetector(
                  onTap: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const PostGalleryPicker(),
                        ));
                  },
                  child: const Padding(
                    padding: EdgeInsets.all(12.0),
                    child: Text(
                      "PostGalleryPicker Screen",
                      style: TextStyle(
                          color: Colors.black87,
                          fontFamily: helveticaNeueNeue_medium,
                          fontSize: 16),
                    ),
                  ),
                ),
                GestureDetector(
                  onTap: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const CreateEventDetail(),
                        ));
                  },
                  child: const Padding(
                    padding: EdgeInsets.all(12.0),
                    child: Text(
                      "CreateEventDetail Screen",
                      style: TextStyle(
                          color: Colors.black87,
                          fontFamily: helveticaNeueNeue_medium,
                          fontSize: 16),
                    ),
                  ),
                ),
                GestureDetector(
                  onTap: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const RegisteredPeople(),
                        ));
                  },
                  child: const Padding(
                    padding: EdgeInsets.all(12.0),
                    child: Text(
                      "RegisteredPeople Screen",
                      style: TextStyle(
                          color: Colors.black87,
                          fontFamily: helveticaNeueNeue_medium,
                          fontSize: 16),
                    ),
                  ),
                ),
                GestureDetector(
                  onTap: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const CreatEventUploadImage(),
                        ));
                  },
                  child: const Padding(
                    padding: EdgeInsets.all(12.0),
                    child: Text(
                      "CreatEventUploadImage Screen",
                      style: TextStyle(
                          color: Colors.black87,
                          fontFamily: helveticaNeueNeue_medium,
                          fontSize: 16),
                    ),
                  ),
                ),
                GestureDetector(
                  onTap: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const UploadVideoDetail(),
                        ));
                  },
                  child: const Padding(
                    padding: EdgeInsets.all(12.0),
                    child: Text(
                      "UploadVideoDetail Screen",
                      style: TextStyle(
                          color: Colors.black87,
                          fontFamily: helveticaNeueNeue_medium,
                          fontSize: 16),
                    ),
                  ),
                ),
                GestureDetector(
                  onTap: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const UploadVideos(),
                        ));
                  },
                  child: const Padding(
                    padding: EdgeInsets.all(12.0),
                    child: Text(
                      "UploadVideos Screen",
                      style: TextStyle(
                          color: Colors.black87,
                          fontFamily: helveticaNeueNeue_medium,
                          fontSize: 16),
                    ),
                  ),
                ),
                GestureDetector(
                  onTap: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const PostLocation(),
                        ));
                  },
                  child: const Padding(
                    padding: EdgeInsets.all(12.0),
                    child: Text(
                      "PostLocation Screen",
                      style: TextStyle(
                          color: Colors.black87,
                          fontFamily: helveticaNeueNeue_medium,
                          fontSize: 16),
                    ),
                  ),
                ),
                GestureDetector(
                  onTap: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const TagPeople(),
                        ));
                  },
                  child: const Padding(
                    padding: EdgeInsets.all(12.0),
                    child: Text(
                      "TagPeople Screen",
                      style: TextStyle(
                          color: Colors.black87,
                          fontFamily: helveticaNeueNeue_medium,
                          fontSize: 16),
                    ),
                  ),
                ),
                GestureDetector(
                  onTap: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const CreatPost(),
                        ));
                  },
                  child: const Padding(
                    padding: EdgeInsets.all(12.0),
                    child: Text(
                      "CreatPost Screen",
                      style: TextStyle(
                          color: Colors.black87,
                          fontFamily: helveticaNeueNeue_medium,
                          fontSize: 16),
                    ),
                  ),
                ),
                GestureDetector(
                  onTap: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const Welcome(),
                        ));
                  },
                  child: const Padding(
                    padding: EdgeInsets.all(12.0),
                    child: Text(
                      "Welcome Screen",
                      style: TextStyle(
                          color: Colors.black87,
                          fontFamily: helveticaNeueNeue_medium,
                          fontSize: 16),
                    ),
                  ),
                ),
                GestureDetector(
                  onTap: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const RegisterInfoView(),
                        ));
                  },
                  child: const Padding(
                    padding: EdgeInsets.all(12.0),
                    child: Text(
                      "Register Screen",
                      style: TextStyle(
                          color: Colors.black87,
                          fontFamily: helveticaNeueNeue_medium,
                          fontSize: 16),
                    ),
                  ),
                ),
                GestureDetector(
                  onTap: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const SignupInfoView(),
                        ));
                  },
                  child: const Padding(
                    padding: EdgeInsets.all(12.0),
                    child: Text(
                      "Signup Screen",
                      style: TextStyle(
                          color: Colors.black87,
                          fontFamily: helveticaNeueNeue_medium,
                          fontSize: 16),
                    ),
                  ),
                ),
                GestureDetector(
                  onTap: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const SignupFormView(),
                        ));
                  },
                  child: const Padding(
                    padding: EdgeInsets.all(12.0),
                    child: Text(
                      "SignupDetail Screen",
                      style: TextStyle(
                          color: Colors.black87,
                          fontFamily: helveticaNeueNeue_medium,
                          fontSize: 16),
                    ),
                  ),
                ),
                GestureDetector(
                  onTap: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const FullInformationStepsView(),
                        ));
                  },
                  child: const Padding(
                    padding: EdgeInsets.all(12.0),
                    child: Text(
                      "FullInformationSteps Screen",
                      style: TextStyle(
                          color: Colors.black87,
                          fontFamily: helveticaNeueNeue_medium,
                          fontSize: 16),
                    ),
                  ),
                ),
                GestureDetector(
                  onTap: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const LoginView(),
                        ));
                  },
                  child: const Padding(
                    padding: EdgeInsets.all(12.0),
                    child: Text(
                      "Login Screen",
                      style: TextStyle(
                          color: Colors.black87,
                          fontFamily: helveticaNeueNeue_medium,
                          fontSize: 16),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ));
  }
}