import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class MovieTypeContainer extends StatelessWidget {
  String type;

  MovieTypeContainer({required this.type});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 65.w,
      height: 25.h,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(3),
        border: Border.all(color: Color(0xff514F4F), width: 1),
      ),
      child: Center(
        child: Text(
          type,
          style: Theme.of(context)
              .textTheme
              .titleSmall!
              .copyWith(fontSize: 10, color: Color(0xff514F4F)),
        ),
      ),
      // color: Color(0xff514F4F)
    );
  }
}
