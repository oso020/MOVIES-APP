import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:movie_app/movie_details/movie_details_screen.dart';

import '../../api_service/osman/api_constant.dart';
import '../../color/color_app.dart';
import '../../model/Popular.dart';

class ShowImage extends StatefulWidget {
  final Results results;
  const ShowImage({super.key, required this.results});

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
            borderRadius: BorderRadius.circular(10),
            child:
            CachedNetworkImage(
              imageUrl: "${ApiConstant.imageBaseUrl}${widget.results.posterPath}",
              width: 120.w,
              height: 180.h,
              fit: BoxFit.fill,
              placeholder: (context, url) => Center(child: CircularProgressIndicator(
                color: ColorApp.primaryColor,
              )),
              errorWidget: (context, url, error) => Icon(Icons.error),
            ),

          ),
          Positioned(

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
