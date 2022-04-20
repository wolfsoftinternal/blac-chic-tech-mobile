// import 'dart:convert';

// import 'package:groceryboouser/Screens/Authentication/SignIn/model/SigninModel.dart';
// import 'package:groceryboouser/Screens/Networks/api_endpoint.dart';
// import 'package:groceryboouser/Screens/Networks/model/TokenUpdateModel.dart';
// import 'package:groceryboouser/Utils/preference_utils.dart';
// import 'package:groceryboouser/Utils/share_predata.dart';
// import 'package:http/http.dart' as http;

// class TokenUpdateRequest {
//   SigninModel myModel;

//   String url = urlBase + urlAutoLogin;
//   var preferences = MySharedPref();

//   Future<http.Response> post() async {
//     myModel =
//         await preferences.getSignInModel(SharePreData.key_SaveSignInModel);

//     dynamic body = jsonEncode({
//       'user_id': myModel.data.id,
//     });

//     Map<String, String> headers = {
//       'Content-Type': 'application/json'
//     };

//     print(url);
//     print(body);
//     print(headers);
//     return http
//         .post(Uri.parse(url), headers: headers, body: body)
//         .timeout(Duration(minutes: 5));
//   }

//   Future<String> updateToken(){
//     return post().then((value) async {
//       Map data = json.decode(value.body);
//       final datas = json.decode(value.body);

//       if(data!=null){
//         TokenUpdateModel model = TokenUpdateModel.fromJson(datas);
//         if (model.data.token != null) {
//           print("My data" + model.data.token);

//           myModel.data.token = model.data.token;
//           await preferences.setSignInModel(
//               myModel, SharePreData.key_SaveSignInModel);

//           return model.data.token;
//         }else{
//           return null;
//         }
//       }
//       else{
//         return null;
//       }
//       return null;
//     });

//   }

// }
