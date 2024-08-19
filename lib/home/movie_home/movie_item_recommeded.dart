import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

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
            width: 100.w,
            height: 170.h,
            fit: BoxFit.fill,
          ),
        ),
        Positioned(
          left: 2.w,
          child: GestureDetector(
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
        )
      ],
    );
  }
}
