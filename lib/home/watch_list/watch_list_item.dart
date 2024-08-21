import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:movie_app/color/color_app.dart';


class WatchListItem extends StatefulWidget {
  const WatchListItem({super.key});

  @override
  State<WatchListItem> createState() => _WatchListItemState();
}

class _WatchListItemState extends State<WatchListItem> {
  bool isWatchList=true;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(height: 20.h,),
        Row(
          children: [
            SizedBox(width: 10.w,),
            Stack(
              children: [
                ClipRRect(
                  borderRadius: BorderRadius.circular(10),
                  child: Image.asset('assets/images/watchlist_test.png',
                    width: 160.w,
                    height: 120.h,
                    fit: BoxFit.fill,
                  ),
                ),
                InkWell(
                  onTap: (){
                    isWatchList =!isWatchList;
                    setState(() {

                    });
                  },
                  child: isWatchList==true ?
                  Image.asset(
                    "assets/images/bookmark_saved.png",
                    width: 30.w,
                    height: 40.h,
                    fit: BoxFit.fill,
                  )
                      :
                      ///will make func delete item from list
                  Image.asset(
                    "assets/images/bookmark.png",
                    width: 30.w,
                    height: 40.h,
                    fit: BoxFit.fill,
                  ),
                ),
              ],
            ),
            SizedBox(width: 10.w,),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Alita Battle Angel",
                    style: Theme.of(context)
                        .textTheme
                        .titleMedium!
                        .copyWith(fontSize: 20.sp),
                  ),
                  Text(
                    "2019",
                    style: Theme.of(context)
                        .textTheme
                        .titleMedium!
                        .copyWith(fontSize: 18.sp, color: ColorApp.greyShade4),
                  ),
                  Text(
                    "Rosa Salazar, Christoph Waltz",
                    style: Theme.of(context)
                        .textTheme
                        .titleMedium!
                        .copyWith(fontSize: 15.sp, color: ColorApp.greyShade4),
                  ),
                  SizedBox(height: 10.h,),
                ],
              ),
            )
          ],
        ),
        SizedBox(
          height: 20.h,
        ),
      ],
    );
  }
}
