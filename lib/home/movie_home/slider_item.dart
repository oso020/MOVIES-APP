
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:movie_app/color/color_app.dart';
import 'package:movie_app/component_widgets/network_image_custom.dart';
import 'package:movie_app/home/movie_home/show_image_with_icon_widget.dart';
import 'package:movie_app/model/Popular.dart';

class SliderItem extends StatelessWidget {
  final ResultsPopular results;
  const SliderItem({super.key, required this.results});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding:  EdgeInsets.only(top: 10.h),
      child: Stack(
        clipBehavior: Clip.none,
        children: [
          /// this is the desgin for top of screen
          NetworkImageCustom(
            image: results.backdropPath!,
            width: double.infinity,
            height: 220.h,
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

          Positioned(top: 100.h, left: 20.w, child: ShowImage(
            results: results,
          )),

          Positioned(
              top: 230.h,
              left: 160.w,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    results.originalTitle!,
                    style: Theme.of(context)
                        .textTheme
                        .titleMedium!
                        .copyWith(fontSize: 14.sp),
                  ),
                  SizedBox(
                    height: 5.h,
                  ),
                  Text(
                    results.releaseDate!,
                    style:
                    Theme.of(context).textTheme.titleMedium!.copyWith(
                      fontSize: 11.sp,
                      color: ColorApp.greyShade3,
                    ),
                  ),
                ],
              )),

        ],
      ),
    );
  }
}
