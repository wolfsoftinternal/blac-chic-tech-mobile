import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

import '../../Authentication/login/model/SignupModel.dart';

class MyDB {
  final userCollection = "users";
  final chatRoomCollection = "chatrooms";
  final chatsCollection = "chat";
  final userRoomCollection = "rooms";

  final _firestore = FirebaseFirestore.instance;

  createCurrentUserDoc(UserDetails  _userObj) async {
    DocumentSnapshot snap = await _firestore
        .collection(userCollection)
        .doc(_userObj.id.toString())
        .get();
    if (snap.data() == null) {
      var data = {
        "image": _userObj.image,
        "name": _userObj.fullName ??
            (_userObj.firstName??"") + " " + (_userObj.lastName??""),
      };
      await _firestore
          .collection(userCollection)
          .doc(_userObj.id.toString())
          .set(data);
      print("Created user doc in firebase");
    }
  }

  Future<DocumentSnapshot> getFriendsList(UserDetails _userObj) async {

    DocumentSnapshot snap = await _firestore
        .collection(userCollection)
        .doc(_userObj.id.toString())
        .get();
    return snap;
  }

  Stream<QuerySnapshot> getFriendsList2(UserDetails? _userObj) {

    print("_userObj.toString() ${_userObj.toString()} kem choo");
    return _firestore
        .collection(userCollection)
        .doc(_userObj?.id.toString())
        .collection(userRoomCollection)
        .snapshots();

    // _firestore
    // .collection(userCollection)
    // .doc(_userObj.data.id.toString())
    // .collection(userRoomCollection).snapshots().li
  }

  Stream<QuerySnapshot> getSearchFriendsList(
      UserDetails _userObj, String searchValue) {
    return _firestore
        .collection(userCollection)
        .doc(_userObj.id.toString())
        .collection(userRoomCollection)
        .where("name", isEqualTo: searchValue)
        .snapshots();
  }

  Future<DocumentSnapshot> getParticularUserData(String id) async {
    return await _firestore.collection(userCollection).doc(id).get();
  }

  Stream<QuerySnapshot> getParticularUserDataStream(
    String receiverId,
  ) {
    return _firestore
        .collection(userCollection)
        .doc(receiverId)
        .collection("rooms")
        .snapshots();
  }

  Stream<QuerySnapshot> getChatStreamByRoomId(String chatRoomID) {
    print("getChatStreamByRoomId -");
    return _firestore
        .collection(chatRoomCollection)
        .doc(chatRoomID)
        .collection(chatsCollection)
        .orderBy("timeStamp", descending: true)
        .snapshots();
  }

  // Stream<QuerySnapshot> getChatStreamByRoomId(String chatRoomID) {
  //   return _firestore
  //       .collection(chatRoomCollection)
  //       .doc(chatRoomID)
  //       .collection(chatsCollection)
  //       .orderBy("timeStamp", descending: true)
  //       .snapshots();
  // }

  deleteMessage(
    roomId,
    chatId,
    receiverId,
      UserDetails userObj,
  ) async {
    await _firestore
        .collection(chatRoomCollection)
        .doc(roomId)
        .collection(chatsCollection)
        .doc(chatId)
        .delete();
  }

  Future<void> sendMessageToDB(
    roomId,
    type,
    message,
    chatImageUrl,
    mixId,
    receiverId,
      UserDetails userObj,
  ) async {
    print("Sending message to room: $roomId");

    var data = {
      "timeStamp": Timestamp.now(),
      "senderId": userObj.id.toString(),
      "isRead": false,
      "type": type,
      "mixId": mixId,
      "chatImageUrl": chatImageUrl,
      "message": message,
    };

    await _firestore
        .collection(chatRoomCollection)
        .doc(roomId)
        .collection(chatsCollection)
        .doc()
        .set(data);

    // Updating unread count in db too
    QuerySnapshot roomSnap = await _firestore
        .collection(chatRoomCollection)
        .doc(roomId)
        .collection(chatsCollection)
        .where('isRead', isEqualTo: false)
        .where("senderId", isEqualTo: userObj.id.toString())
        .get();

    print("roomSnap --> " + roomSnap.toString());

    await _firestore
        .collection(userCollection)
        .doc(receiverId)
        .collection(userRoomCollection)
        .doc(userObj.id.toString())
        .update({
      "unread_message_count": roomSnap.size,
      "last_message_time": Timestamp.now(), // Storing last message time
      "last_message": message ?? "", //,
      "last_message_type": type, //,
      "is_typing": false
    });

    //Last Seen updates
    await _firestore
        .collection(userCollection)
        .doc(userObj.id.toString())
        .collection(userRoomCollection)
        .doc(receiverId.toString())
        .update({
      "last_seen": Timestamp.now(), // Storing last seen time
      "last_message_time": Timestamp.now(), // Storing last message time
      "last_message": message ?? "",
      "last_message_type": type,
      "is_typing": false
    });

// updating my typing status
    await updateMyTypingStatus(false, receiverId, userObj);
  }

  myTypingStatusInOtherUserCollection(
    isTyping,
    receiverId,
      UserDetails userObj,
  ) async {
    //Last Seen updates
    await _firestore
        .collection(userCollection)
        .doc(receiverId)
        .collection(userRoomCollection)
        .doc(userObj.id.toString())
        .update({
      "is_other_user_typing": isTyping,
    });
  }

  updateMyTypingStatus(
    isTyping,
    receiverId,
      UserDetails userObj,
  ) async {
    //Last Seen updates
    await _firestore
        .collection(userCollection)
        .doc(userObj.id.toString())
        .collection(userRoomCollection)
        .doc(receiverId.toString())
        .update({
      "is_typing": isTyping,
    });
  }

//  Stream<QuerySnapshot> get(String chatRoomID) {
//     return _firestore
//         .collection(chatRoomCollection)
//         .doc(chatRoomID)
//         .collection(chatsCollection)
//         .orderBy("timeStamp", descending: true)
//         .snapshots();
//   }

  updateReadStatusOfMessagesSentToMe(
      String roomId, String receiverId, UserDetails userObj) async {
    print("under updateReadStatusOfMessagesSentToMe");
    var batch = _firestore.batch();

    var myUpdateData = {"isRead": true};
    QuerySnapshot qSnap = await _firestore
        .collection(chatRoomCollection)
        .doc(roomId)
        .collection(chatsCollection)
        .where("isRead", isEqualTo: false)
        .where("senderId", isEqualTo: receiverId.toString())
        .get();

    print(
        "roomId $roomId senderId ${userObj.id} receiverid $receiverId qSnap " +
            qSnap.docs.length.toString());

    for (var doc in qSnap.docs) {
      print("doc --> ${doc.toString()}");
      batch.update(doc.reference, myUpdateData);
    }

    await batch.commit();

    // Update read status in user collection too

    await _firestore
        .collection(userCollection)
        .doc(userObj.id.toString())
        .collection(userRoomCollection)
        .doc(receiverId)
        .update({"unread_message_count": 0});
  }

  Future<String> prepareToSendMessage(Map<String, dynamic> receiverData,
      UserDetails userObj, BuildContext context) async {
    print("receiverId ${receiverData["id"]} userId ${userObj.id}");
    var commonsRoom = await findCommonChatroom(receiverData["id"], userObj);
    print("Common Room: $commonsRoom");

    var roomId = commonsRoom.isEmpty
        ? await createAndSetNewRoom(receiverData, userObj, context)
        : commonsRoom;

    print("Room ID of chat: $roomId");

    return roomId;
  }

  Future<String> createAndSetNewRoom(Map<String, dynamic> receiverData,
      UserDetails userObj, BuildContext context) async {
    // print("Creating new rooms");
    var roomRef = _firestore.collection(chatRoomCollection).doc();
    var roomId = roomRef.id;

    // MessageByUserData recData =
    //     await findReceiverData(receiverId, context, userObj, roomId);

    await setValuesToRoom(userObj, roomId, receiverData);

    return roomId;
  }

  Future<void> setValuesToRoom(UserDetails userObj, roomId, receiverData) async {
    String receiverId = receiverData["id"].toString();
    var dataForCurrentUser = {
      "room": roomId,
      "user": int.parse(receiverData["id"]),
    };

    await _firestore
        .collection(userCollection)
        .doc(userObj.id.toString())
        .collection(userRoomCollection)
        .doc(receiverId)
        .set(dataForCurrentUser, SetOptions(merge: true));

    var dataOfReceiver = {
      "image": receiverData["image"] ?? "",
      "name": receiverData["name"] ?? ""
    };

    print("dataOfReceiver $dataOfReceiver");

    await _firestore
        .collection(userCollection)
        .doc(receiverId)
        .set(dataOfReceiver, SetOptions(merge: true));

    var dataForReceiver = {
      "room": roomId,
      "user": userObj.id.toString(),
    };

    await _firestore
        .collection(userCollection)
        .doc(receiverId.toString())
        .collection(userRoomCollection)
        .doc(userObj.id.toString())
        .set(dataForReceiver, SetOptions(merge: true));
  }

  Future<String> findCommonChatroom(person2, UserDetails userObj) async {
    var person1Data = await _firestore
        .collection(userCollection)
        .doc(userObj.id.toString())
        .collection(userRoomCollection)
        .doc(person2)
        .get();
    var commonRoomId = "";
    if (person1Data.exists) {
      var data = person1Data.data();
      if (data != null) {
        commonRoomId = data["room"].toString();
      }
    }
    print(
        "findCommonChatroom commonRoomId $commonRoomId ${commonRoomId.length}");

    return commonRoomId;
  }


}


// class MyDB {
//   final userCollection = "users";
//   final chatRoomCollection = "chatrooms";
//   final chatsCollection = "chat";
//   final userRoomCollection = "rooms";

//   final _firestore = FirebaseFirestore.instance;
//   var currentUserId = userObj.id;

//   createCurrentUserDoc() async {
//     DocumentSnapshot snap =
//         await _firestore.collection(userCollection).doc(userObj.id.toString()).get();
//     if (snap.data() == null) {
//       var data = {
//         "image": userObj.image,
//         "name": userObj.fullName ?? userObj.firstName + " " + userObj.lastName,
//       };
//       await _firestore.collection(userCollection).doc(userObj.id.toString()).set(data);
//       print("Created user doc in firebase");
//     }
//   }

//   Future<DocumentSnapshot> getFriendsList() async {
//     DocumentSnapshot snap =
//         await _firestore.collection(userCollection).doc(userObj.id.toString()).get();
//     return snap;
//   }

//   Stream<QuerySnapshot> getFriendsList2() {
//     return _firestore
//         .collection(userCollection)
//         .doc(userObj.id.toString())
//         .collection(userRoomCollection)
//         .snapshots();
//   }

//   Future<DocumentSnapshot> getParticularUserData(String id) async {
//     return await _firestore.collection(userCollection).doc(id).get();
//   }

//   Stream<QuerySnapshot> getChatStreamByRoomId(String chatRoomID) {
//     return _firestore
//         .collection(chatRoomCollection)
//         .doc(chatRoomID)
//         .collection(chatsCollection)
//         .orderBy("timeStamp", descending: true)
//         .snapshots();
//   }

//   sendMessageToDB(roomId, message, receiverId) async {
//     print("Sending message to room: $roomId");

//     var data = {
//       "timeStamp": Timestamp.now(),
//       "sender": currentUserId,
//       "isRead": false,
//       "mix": "",
//       "message": message,
//     };
//     await _firestore
//         .collection(chatRoomCollection)
//         .doc(roomId)
//         .collection(chatsCollection)
//         .doc()
//         .set(data);

//     // Updating unread count in db too
//     QuerySnapshot roomSnap = await _firestore
//         .collection(chatRoomCollection)
//         .doc(roomId)
//         .collection(chatsCollection)
//         .where('isRead', isEqualTo: false)
//         .where("sender", isEqualTo: currentUserId)
//         .get();

//     await _firestore
//         .collection(userCollection)
//         .doc(receiverId)
//         .collection(userRoomCollection)
//         .doc(currentUserId.toString())
//         .update({"unread_message_count": roomSnap.size});

//     //Last Seen updates
//     await _firestore
//         .collection(userCollection)
//         .doc(currentUserId.toString())
//         .collection(userRoomCollection)
//         .doc(receiverId.toString())
//         .update({"last_seen": Timestamp.now()});
//   }

//   updateReadStatusOfMessagesSentToMe(String roomId, String receiverId) async {
//     var batch = _firestore.batch();

//     var myUpdateData = {"isRead": true};
//     QuerySnapshot qSnap = await _firestore
//         .collection(chatRoomCollection)
//         .doc(roomId)
//         .collection(chatsCollection)
//         .where("isRead", isEqualTo: false)
//         .where("sender", isEqualTo: int.parse(receiverId))
//         .get();

//     for (var doc in qSnap.docs) {
//       batch.update(doc.reference, myUpdateData);
//     }

//     await batch.commit();

//     // Update read status in user collection too

//     await _firestore
//         .collection(userCollection)
//         .doc(currentUserId.toString())
//         .collection(userRoomCollection)
//         .doc(receiverId)
//         .update({"unread_message_count": 0});
//   }

//   Future<String> prepareToSendMessage(String receiverId) async {
//     var commonsRoom = await findCommonChatroom(receiverId);
//     print("Common Room: $commonsRoom");

//     var roomId = commonsRoom.isEmpty ? await createAndSetNewRoom(receiverId) : commonsRoom;

//     print("Room ID of chat: $roomId");

//     return roomId;
//   }

//   Future<String> createAndSetNewRoom(String receiverId) async {
//     // print("Creating new rooms");
//     var roomRef = _firestore.collection(chatRoomCollection).doc();
//     var roomId = roomRef.id;

//     var recData = await findReceiverData(receiverId);

//     var dataForCurrentUser = {
//       "room": roomId,
//       "user": int.parse(receiverId),
//     };

//     var dataOfReceiver = {
//       "image": recData["image"],
//       "name": recData["full_name"],
//     };

//     var dataForReceiver = {
//       "room": roomId,
//       "user": currentUserId,
//     };

//     await _firestore
//         .collection(userCollection)
//         .doc(currentUserId.toString())
//         .collection(userRoomCollection)
//         .doc(receiverId)
//         .set(dataForCurrentUser, SetOptions(merge: true));
//     await _firestore
//         .collection(userCollection)
//         .doc(receiverId)
//         .set(dataOfReceiver, SetOptions(merge: true));
//     await _firestore
//         .collection(userCollection)
//         .doc(receiverId.toString())
//         .collection(userRoomCollection)
//         .doc(currentUserId.toString())
//         .set(dataForReceiver, SetOptions(merge: true));

//     return roomId;
//   }

//   Future<Map<String, dynamic>> findReceiverData(String recId) async {
//     var data = await DioResponse.getFriendsListApi();
//     final friends = data["data"] as List;

//     Map recData =
//         friends.firstWhere((element) => element["id"].toString() == recId) as Map<String, dynamic>;
//     return recData;
//   }

//   Future<String> findCommonChatroom(person2) async {
//     var person1Data = await _firestore
//         .collection(userCollection)
//         .doc(currentUserId.toString())
//         .collection(userRoomCollection)
//         .doc(person2)
//         .get();
//     var commonRoomId = "";
//     if (person1Data.exists) {
//       var data = person1Data.data();
//       if (data != null) {
//         commonRoomId = data["room"].toString();
//       }
//     }

//     return commonRoomId;
//   }
// }
