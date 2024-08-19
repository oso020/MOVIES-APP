import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ShowImage extends StatefulWidget {
  const ShowImage({super.key});

  @override
  State<ShowImage> createState() => _ShowImageState();
}

class _ShowImageState extends State<ShowImage> {
  bool isBooked = false;
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        ClipRRect(
          borderRadius: BorderRadius.circular(5),
          child: Image.asset(
            "assets/images/test.jpg",
            width: 130.w,
            height: 200.h,
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
