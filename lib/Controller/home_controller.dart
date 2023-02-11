import 'package:flutter/foundation.dart';
import 'package:get/get.dart';

import 'package:task_app/Model/video_model.dart';
import 'package:video_player/video_player.dart';

import '../Services/api_service.dart';

class HomeController extends GetxController {
  var isLoader = false.obs;
  late VideoPlayerController videoPlayerController;
  late VideoModel videoModel;

  @override
  void onInit() {
    super.onInit();

    getVideo();
  }

  @override
  void dispose() {
    videoPlayerController.dispose();
    super.dispose();
  }

  getVideo() async {
    isLoader(true);
    try {
      var result = await ApiService.fetchData();

      if (result.runtimeType == int) {
        if (kDebugMode) {
          print('Error: $result');
        }
      } else {
        videoModel = result;
        print(videoModel);
      }
    } on Exception catch (e) {
      if (kDebugMode) {
        print('Fetch Error: ${e.toString()}');
      }
    } finally {
      isLoader(false);
    }
  }

  fetchVideo(String videoUrl) {
    videoPlayerController = VideoPlayerController.network(videoUrl)
      ..addListener(() {})
      ..setLooping(true)
      ..initialize().then((value) => videoPlayerController.play());
  }
}
