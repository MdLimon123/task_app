import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:task_app/Controller/home_controller.dart';

import 'package:task_app/const/app_image.dart';

import 'Component/custome_video.dart';

class HomeScreen extends StatelessWidget {
  HomeScreen({
    super.key,
  });

  final _homeController = Get.put(HomeController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Obx(
        () => _homeController.isLoader.value
            ? const Center(child: CircularProgressIndicator())
            : ListView(
                padding: EdgeInsets.only(left: 15.w, right: 15.w, top: 60.h),
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      CircleAvatar(
                        backgroundColor: const Color(0xFFE6EEFA),
                        radius: 50.r,
                        child: Image.asset(AppImage.camera),
                      ),
                      Text(
                        'Explore',
                        style: TextStyle(
                            fontSize: 35.sp,
                            color: const Color(0xFF000000),
                            fontWeight: FontWeight.w600),
                      ),
                      CircleAvatar(
                        backgroundColor: const Color(0xFFE6EEFA),
                        radius: 50.r,
                        child: Image.asset(AppImage.notification),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 8.h,
                  ),
                  ListView.separated(
                    shrinkWrap: true,
                    itemCount: _homeController.videoModel.data!.length,
                    physics: const NeverScrollableScrollPhysics(),
                    itemBuilder: (context, index) {
                      var result = _homeController.videoModel.data![index];

                      return Container(
                        height: 372.h,
                        width: 370.w,
                        decoration: BoxDecoration(
                            color: const Color(0xFFDBFFEE),
                            borderRadius: BorderRadius.circular(40.r)),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Padding(
                              padding: EdgeInsets.all(14.0.h),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    result.caption!,
                                    style: TextStyle(
                                        color: const Color(0xFF000000),
                                        fontSize: 28.sp,
                                        fontWeight: FontWeight.w400),
                                  ),
                                  SizedBox(
                                    height: 8.h,
                                  ),
                                  Text(result.createdAt!.toString(),
                                      style: TextStyle(
                                          color: const Color(0xFF6C7A9C),
                                          fontSize: 28.sp,
                                          fontWeight: FontWeight.w400)),
                                  SizedBox(
                                    height: 10.h,
                                  ),
                                  CustomVideo(videoUrl: result.videoUrl!),
                                ],
                              ),
                            ),
                          ],
                        ),
                      );
                    },
                    separatorBuilder: (BuildContext context, int index) {
                      return SizedBox(
                        height: 10.h,
                      );
                    },
                  ),
                ],
              ),
      ),
    );
  }
}
