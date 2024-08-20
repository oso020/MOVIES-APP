import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:movie_app/color/color_app.dart';

class SearchItem extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          child: Row(
            children: [
              Image.asset('assets/images/category_image.png'),
              SizedBox(width: 10.w,),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Title',
                    style: Theme.of(context).textTheme.titleSmall,
                  ),
                  Text(
                    'Date',
                    style: Theme.of(context)
                        .textTheme
                        .titleSmall!
                        .copyWith(fontSize: 13),
                  ),
                  Text(
                    'Actors',
                    style: Theme.of(context)
                        .textTheme
                        .titleSmall!
                        .copyWith(fontSize: 13,),
                  ),
                ],
              )
            ],
          ),
        ),
        SizedBox(
          height: 10.h,
        ),
        Divider(
          height: 4,
        )
      ],
    );
  }
}
