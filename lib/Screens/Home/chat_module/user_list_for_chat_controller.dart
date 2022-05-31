import 'dart:convert';


import 'package:blackchecktech/Screens/Authentication/login/model/SignupModel.dart';
import 'package:blackchecktech/Screens/Home/chat_module/user_model.dart';
import 'package:blackchecktech/Utils/preference_utils.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import '../../../Model/BaseModel.dart';
import '../../../Utils/share_predata.dart';
import '../../Networks/api_endpoint.dart';
import '../../Networks/api_response.dart';
import '../../Networks/token_update_request.dart';
import '../Profile/model/AdmireListModel.dart';
import 'package:http/http.dart' as http;

class UserLIstForChatController extends GetxController {
  final userCollection = "users";
  final friendsCollection = 'Friends';

  var friendList = <UserModel>[].obs;
  var isUserListGet = false.obs;

  RxList<AdmireList> admireList = <AdmireList>[].obs;
  final _firestore = FirebaseFirestore.instance;

  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
  }

  createCurrentUserDoc(UserDetails _userObj) async {
    DocumentSnapshot snap = await _firestore
        .collection(userCollection)
        .doc(_userObj.id.toString())
        .get();
    if (snap.data() == null) {
      var data = {
        "image": _userObj.image,
        "name": _userObj.fullName ??
            (_userObj.firstName ?? "").toString() +
                " " +
                (_userObj.lastName ?? "").toString(),
      };
      await _firestore
          .collection(userCollection)
          .doc(_userObj.id.toString())
          .set(data);
      print("Created user doc in firebase");
    }
  }

  /// Get user list
  // getAllUsers() async {
  //   var collection = FirebaseFirestore.instance.collection(userCollection);
  //   userList.clear();
  //   QuerySnapshot querySnapshot = await collection.get();
  //   // Get data from docs and convert map to List
  //   final List<dynamic> allData =
  //       querySnapshot.docs.map((doc) => doc.data()).toList();
  //
  //   for (int i = 0; i < allData.length; i++) {
  //     print("id " + querySnapshot.docs[i].id);
  //     print(allData[i]['name']);
  //
  //     var userModel = UserModel();
  //     userModel.id = querySnapshot.docs[i].id;
  //     userModel.userId = querySnapshot.docs[i]['userId'];
  //     userModel.username = querySnapshot.docs[i]['username'];
  //     userModel.userImage = querySnapshot.docs[i]['userImage'];
  //     userModel.email = querySnapshot.docs[i]['email'];
  //     userModel.lastMessage = querySnapshot.docs[i]['lastMessage'];
  //     userModel.lastMessageFrom = querySnapshot.docs[i]['lastMessageFrom'];
  //     userModel.lastMessageDate = querySnapshot.docs[i]['lastMessageDate'];
  //     userModel.lastMessageTime = querySnapshot.docs[i]['lastMessageTime'];
  //     userModel.lastTimeStamp = querySnapshot.docs[i]['lastTimeStamp'];
  //
  //     userList.add(userModel);
  //   }
  //
  //   for (int i = 0; i < admireList.length; i++) {
  //     var isAdded = false;
  //
  //     for (int j = 0; j < userList.length; j++) {
  //       if (admireList[i].admireDetails?.email == userList[j].email) {
  //         isAdded = true;
  //       }
  //     }
  //
  //     if (!isAdded) {
  //       UserModel userModel = UserModel();
  //       userModel.userId = admireList[i].userId!;
  //       userModel.username = admireList[i].admireDetails?.userName;
  //       userModel.userImage = admireList[i].admireDetails?.image;
  //       userModel.email = admireList[i].admireDetails!.email!;
  //
  //       userList.add(userModel);
  //     }
  //   }
  //
  //   isUserListGet.value = true;
  // }

  // Get shayari list
  getMyFriendList(String userId) async {
    friendList.clear();

    var collection = FirebaseFirestore.instance.collection(userCollection);
    var docSnapshot = await collection.doc(userId).get();
    if (docSnapshot.exists) {
      Map<String, dynamic>? data = docSnapshot.data();
      // <-- The value you want to retrieve.
      // shayariList = <dynamic>[];

      if (data?[friendsCollection] != null) {
        friendList = data?[friendsCollection];
      }
    }

    for (int i = 0; i < admireList.length; i++) {
      var isAdded = false;

      for (int j = 0; j < friendList.length; j++) {
        if (admireList[i].admireDetails?.email == friendList[j].email) {
          isAdded = true;
        }
      }

      if (!isAdded) {
        UserModel userModel = UserModel();
        userModel.userId = admireList[i].userId!;
        userModel.username = admireList[i].admireDetails?.userName;
        userModel.userImage = admireList[i].admireDetails?.image;
        userModel.email = admireList[i].admireDetails!.email!;

        friendList.add(userModel);
      }
    }

    isUserListGet.value = true;
  }

  // Create user
  void createUser(String userId, String userName, String userImage) async {
    // await databaseReference.collection("Categories").doc("1").set({
    //   'title': 'Mastering Flutter',
    //   'description': 'Programming Guide for Dart'
    // });

    final databaseReference = FirebaseFirestore.instance;

    var now = DateTime.now();
    var formatterDate = DateFormat('dd/MM/yy');
    var formatterTime = DateFormat('kk:mm:ss');
    String lastMessageDate = formatterDate.format(now);
    String lastMessageTime = formatterTime.format(now);
    int lastTimeStamp = DateTime.now().millisecondsSinceEpoch;

    await databaseReference.collection(userCollection).add({
      'userId': userId,
      'userName': userName,
      'userImage': userImage,
      'lastMessage': '',
      'lastMessageFrom': '',
      'lastMessageDate': lastMessageDate,
      'lastMessageTime': lastMessageTime,
      'lastTimeStamp': lastTimeStamp
    });
  }

  // Update last message, from and time
  void updateLastMessage(String documentId, lastMessage, lastMessageFrom) {
    final databaseReference = FirebaseFirestore.instance;

    var now = DateTime.now();
    var formatterDate = DateFormat('dd/MM/yy');
    var formatterTime = DateFormat('kk:mm:ss');
    String lastMessageDate = formatterDate.format(now);
    String lastMessageTime = formatterTime.format(now);
    int lastTimeStamp = DateTime.now().millisecondsSinceEpoch;

    try {
      databaseReference.collection('Categories').doc(documentId).update({
        'lastMessage': lastMessage,
        'lastMessageFrom': lastMessageFrom,
        'lastMessageDate': lastMessageDate,
        'lastMessageTime': lastMessageTime,
        'lastTimeStamp': lastTimeStamp
      });
    } catch (e) {
      print(e.toString());
    }
  }

  Future<List<AdmireList>> admireListAPI(BuildContext context, body) async {
    var preferences = MySharedPref();
    var token = await preferences.getStringValue(SharePreData.keytoken);

    String url = urlBase + urladmireList;
    final apiReq = Request();
    await apiReq.postAPI(url, body, token.toString()).then((value) {
      http.StreamedResponse res = value;

      if (res.statusCode == 200) {
        res.stream.bytesToString().then((value) async {
          String strData = value;
          Map<String, dynamic> userModel = json.decode(strData);
          BaseModel model = BaseModel.fromJson(userModel);

          if (model.statusCode == 500) {
            final tokenUpdate = TokenUpdateRequest();
            await tokenUpdate.updateToken();

            admireListAPI(context, body);
          } else if (model.statusCode == 200) {
            AdmireListModel detail = AdmireListModel.fromJson(userModel);

            print('admireList length '  + admireList.length.toString());



            admireList.value = detail.data!;

            // for (int i = 0; i < admireList.length; i++) {
            //   if (admireList[i].admireDetails?.email != null) {
            //     print('userId code of admire' + admireList[i].admireId.toString());
            //   }
            // }
            // getMyFriendList(userId);
          }
        });
      } else {
        print(res.reasonPhrase);
      }
    });

    return admireList;
  }
}
