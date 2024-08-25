import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:movie_app/color/color_app.dart';
import 'package:movie_app/home/browse/category_discover_argument.dart';
import 'package:movie_app/home/browse/discover_screen.dart';
import '../../../model/category.dart';

class CategoryItem extends StatelessWidget {
  Genres genres;
  CategoryItem({required this.genres});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.of(context).pushNamed(DiscoverScreen.routeName,
            arguments: genres.id);
      },
      child: Stack(
        alignment: Alignment.center,
        children: [
          Container(
              width: 200.w,
              height: 150.h,
              decoration: BoxDecoration(
                  color: ColorApp.greyShade5,
                  borderRadius: BorderRadius.circular(20.r)),
              child: Center(
                child: Text(
                  genres.name ?? '',
                  style: Theme.of(context).textTheme.titleMedium!.copyWith(
                        fontSize: 20.sp,
                        fontWeight: FontWeight.w600,
                      ),
                ),
              )),
        ],
      ),
    );
  }
}
