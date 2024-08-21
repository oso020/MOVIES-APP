import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:movie_app/movie_details/movie_details_screen.dart';

class ShowImage extends StatefulWidget {
  const ShowImage({super.key});

  @override
  State<ShowImage> createState() => _ShowImageState();
}

class _ShowImageState extends State<ShowImage> {
  bool isBooked = false;
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.pushNamed(context, MovieDetailsScreen.routeName);
      },
      child: Stack(
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(5),
            child: Image.asset(
              "assets/images/test.jpg",
              width: 125.w,
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
      ),
    );
  }
}
