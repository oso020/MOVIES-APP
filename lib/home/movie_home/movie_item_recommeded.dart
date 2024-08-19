import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:movie_app/color/color_app.dart';

class MovieItemRecommeded extends StatefulWidget {
  const MovieItemRecommeded({super.key});

  @override
  State<MovieItemRecommeded> createState() => _MovieItemRecommededState();
}

class _MovieItemRecommededState extends State<MovieItemRecommeded> {
  bool isBooked = false;
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        ClipRRect(
          borderRadius: BorderRadius.circular(5),
          child: Image.asset(
            "assets/images/test.jpg",
            width: 90.w,
            height: 180.h,
            fit: BoxFit.fill,
          ),
        ),
        GestureDetector(
          onTap: () {
            isBooked = !isBooked;
            setState(() {});
          },
          child: isBooked == true
              ? Image.asset(
                  "assets/images/bookmark_saved.png",
                  width: 30.w,
                  height: 40.h,
                  fit: BoxFit.fill,
                )
              : Image.asset(
                  "assets/images/bookmark.png",
                  width: 30.w,
                  height: 40.h,
                  fit: BoxFit.fill,
                ),
        ),
        Positioned(
          top: 95.h,
          child: Container(
            padding: EdgeInsets.all(7),
            decoration: BoxDecoration(
                color: Color(0xff514F4F),
                borderRadius: BorderRadius.only(
                    bottomRight: Radius.circular(5),
                    bottomLeft: Radius.circular(5))),
            width: 90.w,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    Image.asset(
                      "assets/images/star-2.png",
                      width: 15.w,
                      height: 15.h,
                      fit: BoxFit.fill,
                    ),
                    SizedBox(
                      width: 3.w,
                    ),
                    Text(
                      "7.7",
                      style: Theme.of(context).textTheme.titleMedium,
                    )
                  ],
                ),
                Text(
                  "Deadpool 2",
                  style: Theme.of(context).textTheme.titleMedium,
                ),
                Text(
                  "2019  PG-13  2h 7m",
                  style: Theme.of(context).textTheme.titleMedium!.copyWith(
                        fontSize: 8.sp,
                        color: ColorApp.lightGreyColor,
                      ),
                ),
              ],
            ),
          ),
        )
      ],
    );
  }
}
