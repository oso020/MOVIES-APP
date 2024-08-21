
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:movie_app/color/color_app.dart';
import 'package:movie_app/home/movie_home/show_image_with_icon_widget.dart';

class SliderItem extends StatelessWidget {
  const SliderItem({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding:  EdgeInsets.only(top: 10.h),
      child: Stack(
        clipBehavior: Clip.none,
        children: [
          /// this is the desgin for top of screen
          Image.asset(
            "assets/images/test.jpg",
            width: 500.w,
            height: 200.h,
            fit: BoxFit.fill,
          ),

          Positioned(
            left: 135.w,
            top: 70.h,
            child: IconButton(
              onPressed: () {},
              icon: Icon(
                Icons.play_circle,
                color: ColorApp.whiteColor,
                size: 70.sp,
              ),
            ),
          ),

          Positioned(top: 100.h, left: 20.w, child: ShowImage()),

          Positioned(
              top: 210.h,
              left: 160.w,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Dora and the lost city of gold",
                    style: Theme.of(context)
                        .textTheme
                        .titleMedium!
                        .copyWith(fontSize: 14.sp),
                  ),
                  SizedBox(
                    height: 5.h,
                  ),
                  Text(
                    "2019  PG-13  2h 7m",
                    style:
                    Theme.of(context).textTheme.titleMedium!.copyWith(
                      fontSize: 11.sp,
                      color: ColorApp.greyShade3,
                    ),
                  ),
                ],
              )),

          /// center listView
        ],
      ),
    );
  }
}
