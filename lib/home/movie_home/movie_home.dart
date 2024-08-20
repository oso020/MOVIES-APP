
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:movie_app/color/color_app.dart';
import 'package:movie_app/home/movie_home/new_release%20_list_view_and_text.dart';
import 'package:movie_app/home/movie_home/recomended%20_list_view_and_text.dart';
import 'package:movie_app/home/movie_home/slider_list.dart';

import 'show_image_with_icon_widget.dart';

class MovieHome extends StatelessWidget {
  const MovieHome({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          SliderList(),



          SizedBox(
            height: 20.h,
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
