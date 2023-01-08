import 'dart:developer';
import 'package:status_viewer_app/components/connectivity.dart';
import 'package:http/http.dart' as http;

class GetAllStatusApi {
  static Future<dynamic> getAllStatus() async {
    try {
      log("call");
      bool network = await InternetConnectivity.checking();
      log(network.toString());
      if (network) {
        final responce = await http.get(Uri.parse(
            "http://my-json-server.typicode.com/shakeebM/StoriesApi/stories"));
        if (responce.statusCode == 200) {
          return responce;
        } else {
          throw "Something went wrong";
        }
      } else {
        return "";
      }
    } catch (e) {
      return e.toString();
    }
  }
}
