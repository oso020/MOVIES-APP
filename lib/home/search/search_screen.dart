import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:movie_app/api_service/mohamed_ali/api_manager.dart';
import 'package:movie_app/api_service/mohamed_ali/search_response.dart';
import 'package:movie_app/home/search/no_movies_found_model.dart';
import 'package:movie_app/home/search/search_item.dart';

import '../../color/color_app.dart';

class SearchScreen extends StatefulWidget {
  @override
  State<SearchScreen> createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  String? searchText = '';
  bool isSearching = false;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(10),
      child: Column(
        children: [
          TextField(
            onChanged: (text) {
              searchText = text;
              setState(() {
                isSearching = true;
              });
            },
            style: Theme.of(context)
                .textTheme
                .titleSmall!
                .copyWith(fontSize: 14.sp),
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
          isSearching
              ? Container(
                  child: FutureBuilder<SearchResponse?>(
                      future: ApiManger.getSearch(query: searchText!),
                      builder: (context, snapshot) {
                        if (snapshot.connectionState ==
                            ConnectionState.waiting) {
                          return Expanded(
                            child: Center(
                              child: CircularProgressIndicator(
                                color: ColorApp.primaryColor,
                              ),
                            ),
                          );
                        } else if (snapshot.hasError) {
                          return Column(
                            children: [
                              Text('Error loading movies',
                                style: Theme.of(context).textTheme.titleSmall,
                              ),
                              ElevatedButton(
                                  onPressed: () {
                                    ApiManger.getSearch(query: searchText!);
                                    setState(() {

                                    });
                                  },
                                  child: Text('Try again'),
                                style:ElevatedButton.styleFrom(
                                backgroundColor: ColorApp.primaryColor,)
                              )
                            ],
                          );
                        }
                        //todo Success
                        var moviesList = snapshot.data!.results!;
                        return Expanded(
                          child: ListView.builder(
                            itemBuilder: (context, index) {
                              return SearchItem(results: moviesList[index]);
                            },
                            itemCount: moviesList.length,
                          ),
                        );
                      }),
                )
              : NoMoviesFoundModel()
        ],
      ),
    );
  }
}
