import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:movie_app/color/color_app.dart';
import 'package:movie_app/home/browes/category/category_Item_List.dart';
import 'package:movie_app/home/browes/category/category_item.dart';

class BrowesScreen extends StatelessWidget {
  var categoriesList = Categoryitemlist.getCategories();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('Browse Category',
            style: Theme.of(context).textTheme.titleSmall!.copyWith(
              fontSize: 22.sp,
              color: ColorApp.whiteColor
            ),),
            SizedBox(
              height: 12.h,
            ),
            Expanded(
              child: GridView.builder(
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  crossAxisSpacing: 20,
                  mainAxisSpacing: 10
                ),
                itemBuilder: (context , index){
                  return CategoryItem(category: categoriesList[index]);
                },
                itemCount: 12),
            )
          ],
        ),
      ),
    );
  }
}
