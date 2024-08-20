import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:movie_app/home/search/search_item.dart';

import '../../color/color_app.dart';

class SearchScreen extends StatelessWidget {
  const SearchScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(10),
      child: Column(
        children: [
          TextField(
            style: Theme.of(context).textTheme.titleSmall!.copyWith(
              fontSize: 14.sp
            ),
            autofocus: false,
            decoration: InputDecoration(
              hintText: 'Search',
              hintStyle: Theme.of(context).textTheme.titleSmall!.copyWith(
                    fontSize: 14.sp,
                    color: ColorApp.greyShade2,
                  ),
              enabledBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: ColorApp.greyShade2),
                  borderRadius: BorderRadius.circular(30)),
              focusedBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: ColorApp.greyShade2),
                  borderRadius: BorderRadius.circular(30)),
              fillColor: ColorApp.greyShade3,
              filled: true,
              prefixIcon: Icon(
                Icons.search,
                color: ColorApp.whiteColor,
              ),
            ),
          ),
          SizedBox(
            height: 20.h,
          ),
          SearchItem(),
          SizedBox(
            height: 150.h,
          ),
          Image.asset('assets/images/movie_icon.png'),
          Text(
            'No Movies Found',
            style: Theme.of(context).textTheme.titleSmall!.copyWith(
                  fontSize: 13,
                  color: ColorApp.greyShade4,
                ),
          ),
        ],
      ),
    );
  }
}
