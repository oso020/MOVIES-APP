import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:movie_app/api_service/mohamed_ali/api_manager.dart';
import 'package:movie_app/api_service/mohamed_ali/discover_response.dart';
import 'package:movie_app/color/color_app.dart';
import 'package:movie_app/home/browse/category_discover_argument.dart';
import 'package:movie_app/home/browse/discover/discover_item.dart';

class DiscoverScreen extends StatelessWidget {
  static const String routeName = 'route_name';

  @override
  Widget build(BuildContext context) {
    var args =
        ModalRoute.of(context)!.settings.arguments as CategoryDiscoverArgument;
    return SafeArea(
      child: Column(crossAxisAlignment: CrossAxisAlignment.stretch, children: [
        Container(
            padding: EdgeInsets.all(10),
            margin: EdgeInsets.only(bottom: 10),
            decoration: BoxDecoration(color: ColorApp.backgroundColor),
            child: Text(
              args.genres.name ?? '',
              style: Theme.of(context)
                  .textTheme
                  .titleSmall!
                  .copyWith(fontSize: 30.sp, color: ColorApp.primaryColor),
              textAlign: TextAlign.center,
            )),
        FutureBuilder<DiscoverResponse?>(
          future: ApiManger.getDiscover(args.genres.id.toString()),
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return Center(
                child: CircularProgressIndicator(
                  color: ColorApp.primaryColor,
                ),
              );
            } else if (snapshot.hasError) {
              return Column(
                children: [
                  Text('Error loading the Movies'),
                  ElevatedButton(
                    onPressed: () {
                      ApiManger.getDiscover(args.genres.id.toString());
                    },
                    child: (Text('try again')),
                    style: ElevatedButton.styleFrom(
                        backgroundColor: ColorApp.primaryColor),
                  )
                ],
              );
            }
            var discoverList = snapshot.data!.results!;

            return Expanded(
              child: GridView.builder(
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 3,
                  mainAxisSpacing: 10.h,
                  crossAxisSpacing: 10.h,
                ),
                itemBuilder: (context, index) {
                  return DiscoverItem(results: discoverList[index]);
                },
                itemCount: discoverList.length,
              ),
            );
          },
        ),
      ]),
    );
  }
}
