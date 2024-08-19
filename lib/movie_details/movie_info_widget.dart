import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../color/color_app.dart';
import 'movie_type_container.dart';

class MovieInfoWidget extends StatelessWidget {
  const MovieInfoWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Stack(
          children: [
            Image.asset(
              "assets/images/test.jpg",
              width: 129.w,
              height: 199.h,
              fit: BoxFit.fill,
            ),
            InkWell(
              onTap: () {
                // Change image or handle the bookmark action
              },
              child: Image.asset("assets/images/bookmark.png"),
            ),
          ],
        ),
        SizedBox(width: 16.w),
        Expanded(
          child: Column(
            children: [
              //movie types
              Wrap(
                spacing: 5.0,
                runSpacing: 8.0,
                children: [
                  MovieTypeContainer(type: "Action"),
                  MovieTypeContainer(type: "Action"),
                  MovieTypeContainer(type: "Action"),
                  MovieTypeContainer(type: "Action"),
                ],
              ),
              SizedBox(
                height: 20,
              ),
              //movie description
              Text(
                "Having spent most of her life exploring the jungle, nothing could prepare Dora for her most dangerous adventure yet — high school. ",
                maxLines: 4,
                style: Theme.of(context).textTheme.titleSmall!.copyWith(
                      color: ColorApp.greyShade2,
                      fontSize: 13,
                    ),
              ),
              SizedBox(
                height: 5,
              ),
              //movie rate
              Row(
                children: [
                  Image.asset("assets/images/star.png"),
                  SizedBox(width: 15.w),
                  Text(
                    "7.7",
                    style: Theme.of(context).textTheme.titleMedium!.copyWith(
                          fontSize: 19,
                          color: Colors.white,
                        ),
                  ),
                ],
              )
            ],
          ),
        ),
      ],
    );
  }
}
