import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:movie_app/api_service/mohamed_ali/search_response.dart';
import 'package:movie_app/color/color_app.dart';

class SearchItem extends StatelessWidget {
  Results results;

  SearchItem({required this.results});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          margin: EdgeInsets.all(10),
          child: Row(
            children: [
              SizedBox(
                width: 10.w,
              ),
              ClipRRect(
                  borderRadius: BorderRadius.circular(10),
                  child: CachedNetworkImage(
                    width: 150.w,
                    height: 100.h,
                    fit: BoxFit.fill,
                    imageUrl:
                        "https://image.tmdb.org/t/p/w500/${results.posterPath ?? ''}",
                    errorWidget: (context, url, error) => Icon(Icons.error,color: ColorApp.primaryColor,),
                  )),
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
        Divider(
          height: 4,
        )
      ],
    );
  }
}
