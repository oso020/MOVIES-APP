import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:movie_app/api_service/mohamed_ali/category_response.dart';
import 'package:movie_app/api_service/mohamed_ali/api_manager.dart';
import 'package:movie_app/color/color_app.dart';
import 'package:movie_app/home/browse/category/category_item.dart';
import 'package:movie_app/home/browse/discover_screen.dart';

class BrowesScreen extends StatefulWidget {
  @override
  State<BrowesScreen> createState() => _BrowesScreenState();
}

class _BrowesScreenState extends State<BrowesScreen> {

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(10.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Browse Category',
            style: Theme.of(context)
                .textTheme
                .titleSmall!
                .copyWith(fontSize: 22.sp, color: ColorApp.whiteColor),
          ),
          SizedBox(
            height: 12.h,
          ),
          Container(
            child: FutureBuilder<CategoryResponse?>(
              future: ApiManger.getCategory(),
              builder: (context, snapshot) {
                if (snapshot.connectionState == ConnectionState.waiting) {
                  return const Center(
                    child: CircularProgressIndicator(
                      color: ColorApp.primaryColor,
                    ),
                  );
                } else if (snapshot.hasError) {
                  return Center(
                    child: Column(
                      children: [
                        Text(
                          'Error loading the category list',
                          style: Theme.of(context).textTheme.titleSmall,
                        ),
                        ElevatedButton(
                            onPressed: () {
                              ApiManger.getCategory();
                              setState(() {

                              });
                            },
                            child: Text(
                              'Try again',
                              style: Theme.of(context).textTheme.titleSmall,
                            ),
                          style: ElevatedButton.styleFrom(
                            backgroundColor: ColorApp.primaryColor
                          ),
                        )
                      ],
                    ),
                  );
                }
                //todo success
                var categoryList = snapshot.data!.genres!;
               return Expanded(
                  child: GridView.builder(
                      gridDelegate:
                          const SliverGridDelegateWithFixedCrossAxisCount(
                              crossAxisCount: 2,
                              crossAxisSpacing: 20,
                              mainAxisSpacing: 10),
                      itemBuilder: (context, index) {
                        return CategoryItem(
                          genres: categoryList[index],
                        );
                      },
                      itemCount: categoryList.length),
                );
              },
            ),
          )
        ],
      ),
    );
  }
}
