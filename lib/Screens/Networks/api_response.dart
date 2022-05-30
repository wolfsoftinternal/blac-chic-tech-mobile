import 'package:http/http.dart' as http;

import '../../Utils/GeneralFunctions.dart';

class Request {
  Map<String, String> headers = {'Content-Type': 'application/json'};

  Map<String, String> headersSecured = {
    "Accept": "application/json",
    'Content-Type': 'application/x-www-form-urlencoded',
  };

  Future<http.StreamedResponse> postAPIwithoutAuth(url, body) async {
    Map<String, String> headers = {
      'Content-Type': 'application/json',
    };

    printData("url", url);
    printData("Body", body.toString());
    printData("Header", headers.toString());

    var request = http.MultipartRequest('POST', Uri.parse(url));
    if (body != null) request.fields.addAll(body);
    request.headers.addAll(headers);
    http.StreamedResponse response = await request.send();

    return response;
  }

  Future<http.StreamedResponse> postAPIWithBearer(url, body, token) async {
    Map<String, String> headersWithBearer = {
      'Content-Type': 'application/json',
      'Authorization': 'Bearer ' + token,
    };
    printData("url", url);
    printData("Body", body.toString());
    printData("Header", headersWithBearer.toString());

    var request = http.MultipartRequest('POST', Uri.parse(url));
    if (body != null) request.fields.addAll(body);
    request.headers.addAll(headersWithBearer);
    http.StreamedResponse response = await request.send();

    return response;
  }

  Future<http.StreamedResponse> postAPIWithMediaBearer(
      url, body, token, String strImg) async {
    Map<String, String> headersWithBearer = {
      'Content-Type': 'application/json',
      'Authorization': 'Bearer ' + token,
    };
    printData("url", url);
    printData("Body", body.toString());
    printData("Header", headersWithBearer.toString());
    printData("strImg", strImg);

    var request = http.MultipartRequest('POST', Uri.parse(url));

    request.fields.addAll(body);

    if (strImg.isNotEmpty) {
      request.files.add(await http.MultipartFile.fromPath('image', strImg));
    }

    request.headers.addAll(headersWithBearer);
    http.StreamedResponse response = await request.send();

    return response;
  }

  Future<http.StreamedResponse> postAPIwithoutBearer(url, body) async {
    Map<String, String> headersWithBearer = {
      'Content-Type': 'application/json',
    };

    printData("url", url);
    printData("Body", body.toString());
    printData("Header", headersWithBearer.toString());

    if (body != null) {
      var request = http.MultipartRequest('POST', Uri.parse(url));

      request.fields.addAll(body);
      request.headers.addAll(headersWithBearer);
      http.StreamedResponse response = await request.send();

      return response;
    } else {
      var request = http.MultipartRequest('POST', Uri.parse(url));

      request.headers.addAll(headersWithBearer);
      http.StreamedResponse response = await request.send();

      return response;
    }
  }

  Future<http.StreamedResponse> postAPIWithMediaWithoutBearer(
      url, body, token, strImg) async {
    Map<String, String> headersWithBearer = {
      'Content-Type': 'application/json',
      'Authorization': token,
    };
    printData("url", url);
    printData("Body", body.toString());
    printData("Header", headersWithBearer.toString());
    printData("strImg", strImg);

    var request = http.MultipartRequest('POST', Uri.parse(url));

    request.fields.addAll(body);
    request.files.add(await http.MultipartFile.fromPath('image', strImg));

    request.headers.addAll(headersWithBearer);
    http.StreamedResponse response = await request.send();

    return response;
  }

    Future<http.StreamedResponse> postAPI(url, body, token) async {
    Map<String, String> headersWithBearer = {
      'Content-Type': 'application/json',
      'Authorization': 'Bearer ' + token,
    };
    printData("url", url);
    printData("Body", body.toString());
    printData("Header", headersWithBearer.toString());

    if (body != null) {
      var request = http.MultipartRequest('POST', Uri.parse(url));

      request.fields.addAll(body);
      request.headers.addAll(headersWithBearer);
      http.StreamedResponse response = await request.send();

      return response;
    } else {
      var request = http.MultipartRequest('POST', Uri.parse(url));

      request.headers.addAll(headersWithBearer);
      http.StreamedResponse response = await request.send();

      return response;
    }
  }
}
