import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:movie_app/component_widgets/network_image_custom.dart';
import 'package:movie_app/model/search.dart';
import 'package:movie_app/color/color_app.dart';

import '../../movie_details/movie_details_screen.dart';

class SearchItem extends StatelessWidget {
  Results results;

  SearchItem({required this.results});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        GestureDetector(
          onTap: (){
            Navigator.pushNamed(context, MovieDetailsScreen.routeName,arguments: results.id);

          },
          child: Container(
            margin: EdgeInsets.all(10),
            child: Row(
              children: [
                SizedBox(
                  width: 10.w,
                ),
                ClipRRect(
                    borderRadius: BorderRadius.circular(10),
                    child:NetworkImageCustom(
                      width: 150.w,
                      height: 100.h,
                      image: results.posterPath ?? "",
                    )
                ),
                SizedBox(
                  width: 10.w,
                ),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(results.title ?? '',
                          style: Theme.of(context).textTheme.titleSmall,
                        overflow: TextOverflow.ellipsis,
                        maxLines: 2,
                      ),
                      Text(
                        results.releaseDate ?? '',
                        style: Theme.of(context)
                            .textTheme
                            .titleSmall!
                            .copyWith(fontSize: 13.sp, color: ColorApp.greyShade3),
                      ),
                      Text(
                        results.voteCount.toString() ?? '',
                        style: Theme.of(context)
                            .textTheme
                            .titleSmall!
                            .copyWith(fontSize: 13.sp, color: ColorApp.greyShade3),
                      ),
                    ],
                  ),
                )
              ],
            ),
          ),
        ),
        Divider(
          height: 4.h,
        )
      ],
    );
  }
}
