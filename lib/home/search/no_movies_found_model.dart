import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:movie_app/color/color_app.dart';

class NoMoviesFoundModel extends StatelessWidget {
  const NoMoviesFoundModel({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(
          height: 280.h,
        ),
        Image.asset('assets/images/movie_icon.png'),
        Text(
          'No Movies Found',
          style: Theme.of(context).textTheme.titleSmall!.copyWith(
                fontSize: 13.sp,
                color: ColorApp.greyShade4,
              ),
        ),
      ],
    );
  }
}
