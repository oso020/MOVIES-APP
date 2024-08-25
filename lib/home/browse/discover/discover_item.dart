import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:movie_app/component_widgets/network_image_custom.dart';
import 'package:movie_app/movie_details/movie_details_screen.dart';

import '../../../model/discover.dart';
import '../../../color/color_app.dart';

class DiscoverItem extends StatelessWidget {

  Results results;
  DiscoverItem({required this.results});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: (){
        Navigator.pushNamed(context, MovieDetailsScreen.routeName,arguments: results.id);
      },
      child:NetworkImageCustom(
        height: 100.h,
        width: 150.w,
        image: results.posterPath ?? "",
      )
    );
  }
}
