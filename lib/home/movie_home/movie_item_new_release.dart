
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class MovieItemNewRelease extends StatefulWidget {
  const MovieItemNewRelease({super.key});

  @override
  State<MovieItemNewRelease> createState() => _MovieItemNewReleaseState();
}

class _MovieItemNewReleaseState extends State<MovieItemNewRelease> {

  bool isBooked=false;
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        ClipRRect(
          borderRadius: BorderRadius.circular(5),
          child: Image.asset(
            "assets/images/test.jpg",
            width: 100.w,
            height: 140.h,
            fit: BoxFit.fill,
          ),
        ),

        GestureDetector(
          onTap: (){
            isBooked =!isBooked;
            setState(() {

            });
          },
          child:
        isBooked==true?
          Image.asset(
            "assets/images/bookmark_saved.png",
            width: 30.w,
            height: 40.h,
            fit: BoxFit.fill,
          )
          :
          Image.asset(
            "assets/images/bookmark.png",
            width: 30.w,
            height: 40.h,
            fit: BoxFit.fill,
          ),
        ),
      ],
    );
  }
}
