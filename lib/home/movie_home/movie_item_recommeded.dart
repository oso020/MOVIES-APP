import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:movie_app/color/color_app.dart';
import 'package:movie_app/component_widgets/network_image_custom.dart';

import '../../model/Recomended.dart';

class MovieItemRecommeded extends StatefulWidget {
  final ResultsRecomended resultsRecomended;
  const MovieItemRecommeded({super.key, required this.resultsRecomended});

  @override
  State<MovieItemRecommeded> createState() => _MovieItemRecommededState();
}

class _MovieItemRecommededState extends State<MovieItemRecommeded> {
  bool isBooked = false;
  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(5),
      child: Stack(
        children: [
          NetworkImageCustom(
            image: widget.resultsRecomended.posterPath!,
            width: 90.w,
            height: 200.h,
          ),
          GestureDetector(
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
          Positioned(
            top: 90.h,
            child: Container(
              height: 90.h,
              padding: const EdgeInsets.all(7),
              decoration: const BoxDecoration(
                boxShadow: [],
                color: Color(0xff514F4F),
                borderRadius: BorderRadius.only(
                    bottomRight: Radius.circular(5),
                    bottomLeft: Radius.circular(5)),
              ),
              width: 90.w,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      Image.asset(
                        "assets/images/star-2.png",
                        width: 15.w,
                        height: 15.h,
                        fit: BoxFit.fill,
                      ),
                      SizedBox(
                        width: 3.w,
                      ),
                      Text(
                        widget.resultsRecomended.voteAverage.toString(),
                        style: Theme.of(context).textTheme.titleMedium,
                      )
                    ],
                  ),
                  Text(
                    widget.resultsRecomended.originalTitle!,
                    maxLines: 3,
                    style: Theme.of(context).textTheme.titleMedium!.copyWith(
                      fontSize: 9.sp
                    ),
                  ),
                  Text(
                    widget.resultsRecomended.releaseDate!,
                    style: Theme.of(context).textTheme.titleMedium!.copyWith(
                          fontSize: 9.sp,
                          color: ColorApp.greyShade2,
                        ),
                  ),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
