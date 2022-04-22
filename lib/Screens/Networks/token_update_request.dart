import 'dart:convert';
import 'package:blackchecktech/Screens/Authentication/signup/model/SignupModel.dart';
import 'package:blackchecktech/Screens/Networks/api_endpoint.dart';
import 'package:blackchecktech/Utils/preference_utils.dart';
import 'package:blackchecktech/Utils/share_predata.dart';
import 'package:http/http.dart' as http;

class TokenUpdateRequest {
  SignupModel? myModel;

  String url = urlBase + urlAutoLogin;
  var preferences = MySharedPref();

  Future<http.Response> post() async {
    myModel =
        await preferences.getSignupModel(SharePreData.keySignupModel);

    dynamic body = jsonEncode({
      'user_id': myModel!.data!.id,
    });

    Map<String, String> headers = {
      'Content-Type': 'application/json'
    };

    print(url);
    print(body);
    print(headers);
    return http
        .post(Uri.parse(url), headers: headers, body: body)
        .timeout(Duration(minutes: 5));
  }

  Future<String> updateToken(){
    return post().then((value) async {
      Map data = json.decode(value.body);
      final datas = json.decode(value.body);

      var model;
      // TokenUpdateModel model = TokenUpdateModel.fromJson(datas);
      print("My data" + model.data.token);

      myModel!.data!.token = model.data.token;
      await preferences.setSignupModel(
          myModel!, SharePreData.keySignupModel);

      return model.data.token;
    });
  }
}
