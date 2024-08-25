
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:movie_app/home/movie_home/new_release%20_list_view_and_text.dart';
import 'package:movie_app/home/movie_home/recomended%20_list_view_and_text.dart';
import 'package:movie_app/home/movie_home/slider_list.dart';
class MovieHome extends StatefulWidget {
  const MovieHome({super.key});

  @override
  State<MovieHome> createState() => _MovieHomeState();
}

class _MovieHomeState extends State<MovieHome> {
  @override
  Widget build(BuildContext context) {

    return SingleChildScrollView(
      child: Column(
        children: [
          SliderList(),

          SizedBox(
            height: 10.h,
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
