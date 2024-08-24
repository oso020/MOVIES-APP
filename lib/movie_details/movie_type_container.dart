import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../color/color_app.dart';

class MovieTypeContainer extends StatelessWidget {
  String type;

  MovieTypeContainer({required this.type});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 65.w,
      height: 30.h,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(3),
        border: Border.all(color: ColorApp.greyShade3, width: 1),
      ),
      child: Center(
        child: Padding(
          padding: EdgeInsets.all(2),
          child: Text(
            type,
            style: Theme.of(context)
                .textTheme
                .titleSmall!
                .copyWith(fontSize: 8, color: Color(0xff514F4F)),
          ),
        ),
      ),
    );
  }
}
