import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:movie_app/color/color_app.dart';
import 'package:movie_app/home/movie_home/new_release%20_list_view_and_text.dart';
import 'package:movie_app/home/movie_home/recomended%20_list_view_and_text.dart';

import 'show_image_with_icon_widget.dart';

class MovieHome extends StatelessWidget {
  const MovieHome({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          Stack(
            clipBehavior: Clip.none,
            children: [
              /// this is the desgin for top of screen
              Image.asset(
                "assets/images/test.jpg",
                width: 500.w,
                height: 220.h,
                fit: BoxFit.fill,
              ),
              Positioned(
                left: 170.w,
                height: 200.h,
                fit: BoxFit.fill,
              ),
              Positioned(
                left: 160.w,
                top: 70.h,
                child: IconButton(
                    onPressed: () {},
                    icon: Icon(Icons.play_circle,
                      color: ColorApp.whiteColor,
                      size: 70.w,
      
                    ),),
              ),
      
              Positioned(top: 100.h, left: 20.w, child: ShowImage()),
              Positioned(
                  top: 230.h,

                    ),),
              ),

              Positioned(top: 120.h, left: 20.w, child: ShowImage()),
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
                            .copyWith(fontSize: 15.sp),
                            .copyWith(fontSize: 12.sp),
                      ),
                      SizedBox(
                        height: 5.h,
                      ),
                      Text(
                        "2019  PG-13  2h 7m",
                        style: Theme.of(context).textTheme.titleMedium!.copyWith(
                              fontSize: 10.sp,
                              color: ColorApp.lightGreyColor,
                            ),
                      ),
                    ],
                  )),
              /// center listView
      
      
      



            ],
          ),
          SizedBox(
            height: 110.h,
          ),
          NewReleaseListViewAndText(),
      
          SizedBox(
            height: 30.h,
          ),
          RecomendedListViewAndText(),
        ],
      ),
    );
  }
}
