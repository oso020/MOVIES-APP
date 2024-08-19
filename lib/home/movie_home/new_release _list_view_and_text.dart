
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:movie_app/color/color_app.dart';

import 'movie_item_new_release.dart';

class NewReleaseListViewAndText extends StatelessWidget {
  const NewReleaseListViewAndText({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(12),
      width: double.infinity,
      height: 215.h,

      color: ColorApp.backgroundListViewColorGrey,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "New Releases ",
            style: Theme.of(context)
                .textTheme
                .titleMedium!
                .copyWith(fontSize: 18.sp),
          ),
          SizedBox(height: 10.h,),
          Expanded(
            child: ListView.separated(
              itemCount: 100,
              separatorBuilder: (context, index) => SizedBox(width: 13.w,),
              scrollDirection: Axis.horizontal,
              itemBuilder: (context, index) {
              return MovieItemNewRelease();
            },),
          )
        ],
      ),
    );
  }
}
