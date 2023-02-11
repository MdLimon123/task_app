import 'package:flutter/foundation.dart';
import 'package:http/http.dart' as http;
import 'package:task_app/Model/video_model.dart';

class ApiService {
  static var client = http.Client();

  static dynamic fetchData() async {
    try {
      var response = await client.get(Uri.parse(
          'https://hajjmanagment.online/api/external/atab/m360ict/get/video/app/test'));

      if (response.statusCode == 200) {
        return videoModelFromMap(response.body);
      } else {
        return response.statusCode;
      }
    } on Exception catch (e) {
      if (kDebugMode) {
        return print("Data fetch Error. Reason ${e.toString()}");
      }
      return 0;
    }
  }
}
