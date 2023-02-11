import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:task_app/Controller/home_controller.dart';
import 'package:task_app/const/app_icon.dart';

import 'package:video_player/video_player.dart';

class CustomVideo extends StatefulWidget {
  CustomVideo({super.key, required this.videoUrl});
  late final String videoUrl;

  @override
  State<CustomVideo> createState() => _CustomVideoState();
}

class _CustomVideoState extends State<CustomVideo> {
  final home_contorller = Get.put(HomeController());

  @override
  void initState() {
    home_contorller.fetchVideo(widget.videoUrl);

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Column(children: [
      home_contorller.videoPlayerController.value.isInitialized
          ? Stack(children: [
              Center(
                  child: AspectRatio(
                aspectRatio:
                    home_contorller.videoPlayerController.value.aspectRatio,
                child: VideoPlayer(home_contorller.videoPlayerController),
              )),
              Positioned(
                  bottom: 100.h,
                  left: 270.w,
                  child: CircleAvatar(
                    radius: 30.r,
                    backgroundColor: const Color(0xFFFFFFFF),
                    child: IconButton(
                        onPressed: () {
                          home_contorller.videoPlayerController.value.isPlaying
                              ? home_contorller.videoPlayerController.pause()
                              : home_contorller.videoPlayerController.play();
                        },
                        icon: Icon(
                          home_contorller.videoPlayerController.value.isPlaying
                              ? Icons.pause
                              : Icons.play_arrow,
                          size: 35.sp,
                        )),
                  )),
              Positioned(
                  right: 10.w,
                  child: IconButton(
                      onPressed: () {
                        home_contorller.videoPlayerController.value.isPlaying
                            ? home_contorller.videoPlayerController.pause()
                            : home_contorller.videoPlayerController.play();
                      },
                      icon:
                          home_contorller.videoPlayerController.value.isPlaying
                              ? Image.asset(AppIcon.max)
                              : Image.asset(AppIcon.mute))),
              Positioned(
                  bottom: 15.w,
                  child: ListTile(
                    title: Row(
                      children: [
                        Row(
                          children: [
                            Image.asset(AppIcon.chat),
                            SizedBox(
                              width: 6.w,
                            ),
                            Text(
                              '10',
                              style: TextStyle(
                                fontSize: 25.sp,
                                fontWeight: FontWeight.w600,
                                color: const Color(0xFFFFFFFF),
                              ),
                            )
                          ],
                        ),
                        SizedBox(
                          width: 10.w,
                        ),
                        Row(
                          children: [
                            Image.asset(AppIcon.favorite),
                            SizedBox(
                              width: 6.w,
                            ),
                            Text(
                              '122',
                              style: TextStyle(
                                fontSize: 25.sp,
                                fontWeight: FontWeight.w600,
                                color: const Color(0xFFFFFFFF),
                              ),
                            )
                          ],
                        ),
                      ],
                    ),
                    trailing: Row(
                      children: [
                        Image.asset(AppIcon.send),
                        SizedBox(
                          width: 5.w,
                        ),
                        Image.asset(AppIcon.save)
                      ],
                    ),
                  ))
            ])
          : const Center(child: CircularProgressIndicator()),
    ]);
  }
}
