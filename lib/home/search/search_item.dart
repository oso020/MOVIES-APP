import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class SearchItem extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          child: Row(
            children: [
              SizedBox(
                width: 10.w,
              ),
              ClipRRect(
                borderRadius: BorderRadius.circular(10),
                child: Image.asset('assets/images/category_image.png',
                width: 160.w,
                height: 100.h,
                fit: BoxFit.fill,),
              ),
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
                        .copyWith(fontSize: 13.sp),
                  ),
                  Text(
                    'Actors',
                    style: Theme.of(context)
                        .textTheme
                        .titleSmall!
                        .copyWith(fontSize: 13.sp,),
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
