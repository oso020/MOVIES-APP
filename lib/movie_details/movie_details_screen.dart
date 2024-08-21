import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:movie_app/color/color_app.dart';
import 'package:movie_app/movie_details/more_like_this_item.dart';
import 'package:movie_app/movie_details/movie_info_widget.dart';

class MovieDetailsScreen extends StatelessWidget {
  static const String routeName = "movie_details_screen";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorApp.backgroundColor,

      appBar: AppBar(
        foregroundColor: ColorApp.whiteColor,
        title: Text(
          "Dora and the Lost City of Gold",
          style: Theme.of(context).textTheme.titleSmall!.copyWith(
                fontWeight: FontWeight.w400,
                fontSize: 18,
                color: ColorApp.whiteColor,
              ),
        ),
        centerTitle: true,

        backgroundColor: ColorApp.backgroundColor,
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Stack(
              children: [
                Image.asset(
                  "assets/images/test.jpg",
                  width: double.infinity,
                  height: 200.h,
                  fit: BoxFit.cover,
                ),
                Positioned(
                  left: 0,
                  right: 0,
                  top: 0,
                  bottom: 0,
                  child: Align(
                    alignment: Alignment.center,
                    child: Icon(
                      Icons.play_circle, // Replace with your desired icon
                      color: Colors.white, // Change the color as needed
                      size: 70.sp, // Adjust the size as needed
                    ),
                  ),
                ),
              ],
            ),
            //container of movie info section:
            Container(
              padding: EdgeInsets.symmetric(vertical: 10, horizontal: 15),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Dora and the Lost City of Gold",
                    style: Theme.of(context).textTheme.titleSmall!.copyWith(
                          fontWeight: FontWeight.w400,
                          fontSize: 18,
                          color: ColorApp.whiteColor,
                        ),
                  ),
                  SizedBox(height: 4.h),
                  Text(
                    "2019 PG-13 2h 7m",
                    style: Theme.of(context).textTheme.titleSmall!.copyWith(
                          fontWeight: FontWeight.w400,
                          fontSize: 10,
                          color: ColorApp.greyShade2,
                        ),
                  ),
                  SizedBox(height: 16.h),
                  MovieInfoWidget(),
                ],
              ),
            ),
            //container of  more like this section:
            Container(
              padding: EdgeInsets.symmetric(vertical: 10, horizontal: 15),
              color: ColorApp.greyShade5,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "More Like This",
                    style: Theme.of(context).textTheme.titleSmall!.copyWith(
                          fontSize: 15,
                          color: Colors.white,
                        ),
                  ),
                  SizedBox(height: 10.h),
                  SizedBox(
                    height: 200.h,
                    // Specify a height to ensure ListView is constrained
                    child: ListView.builder(
                      itemCount: 10,
                      scrollDirection: Axis.horizontal,
                      itemBuilder: (context, index) {
                        return MoreLikeThisItem();
                      },
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
