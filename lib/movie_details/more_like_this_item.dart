import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../color/color_app.dart';

class MoreLikeThisItem extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: const EdgeInsets.symmetric(horizontal: 5.0),
        child: Container(
          clipBehavior: Clip.antiAlias,
          decoration: BoxDecoration(
            color: Color(0xff514F4F),
            borderRadius: BorderRadius.circular(5),
            boxShadow: [
              BoxShadow(
                color: Colors.black.withOpacity(0.3), // Shadow color
                spreadRadius: 1, // Spread radius
                blurRadius: 5, // Blur radius for soft shadow
                offset: Offset(0, 3), // Position of the shadow (x, y)
              ),
            ],
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              //container of the image
              Container(
                width: 97.w,
                height: 123.h,
                child: Stack(
                  children: [
                    Image.asset(
                      "assets/images/test.jpg",
                      width: double.infinity,
                      height: double.infinity,
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
              ),

              //container of movie info
              Container(
                padding: EdgeInsets.all(5),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    //rating row
                    Row(
                      children: [
                        Image.asset(
                          "assets/images/star.png",
                          width: 10.w,
                          height: 10.h,
                        ),
                        SizedBox(
                          width: 5.w,
                        ),
                        Text("7.7",
                            style: Theme.of(context)
                                .textTheme
                                .titleMedium!
                                .copyWith(
                                    fontSize: 10, color: ColorApp.whiteColor))
                      ],
                    ),
                    // movie name
                    Text(
                      "Deadpool2",
                      style: Theme.of(context)
                          .textTheme
                          .titleMedium!
                          .copyWith(fontSize: 10, color: ColorApp.whiteColor),
                    ),
                    // movie time
                    Text(
                      "2019 R 1h 59m",
                      style: Theme.of(context)
                          .textTheme
                          .titleSmall!
                          .copyWith(fontSize: 8, color: ColorApp.greyShade2),
                    )
                  ],
                ),
              )
            ],
          ),
        ));
  }
}
