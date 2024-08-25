import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:movie_app/color/color_app.dart';
import 'package:movie_app/home/browse/category/category_item.dart';
import 'package:movie_app/home/browse/category/cubit/category_state.dart';
import 'package:movie_app/home/browse/category/cubit/category_view_model.dart';

class BrowesScreen extends StatefulWidget {
  const BrowesScreen({super.key});

  @override
  State<BrowesScreen> createState() => _BrowesScreenState();
}

class _BrowesScreenState extends State<BrowesScreen> {

  BrowseScreenViewModel viewModel = BrowseScreenViewModel();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    viewModel.getGenres();
  }

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
              child: BlocBuilder<BrowseScreenViewModel , BrowseState>(
                bloc: viewModel,
                builder: (context , state){
                  if(state is BrowseLoadingState){
                    return Expanded(
                      child:  Center(
                        child: CircularProgressIndicator(
                          color: ColorApp.primaryColor,
                        ),
                      ),
                    );
                  }else if(state is BrowseErrorState){
                    return Center(
                      child: Column(
                        children: [
                          Text(
                            'Error loading the category list',
                            style: Theme.of(context).textTheme.titleSmall,
                          ),
                          ElevatedButton(
                            onPressed: () {
                              viewModel.getGenres();
                              setState(() {});
                            },
                            style: ElevatedButton.styleFrom(
                                backgroundColor: ColorApp.primaryColor
                            ),
                            child: Text(
                              'Try again',
                              style: Theme.of(context).textTheme.titleSmall,
                            ),
                          )
                        ],
                      ),
                    );
                  }else if(state is BrowseSuccessState){
                    return Expanded(
                      child: GridView.builder(
                          gridDelegate:
                           SliverGridDelegateWithFixedCrossAxisCount(
                              crossAxisCount: 2,
                              crossAxisSpacing: 20.w,
                              mainAxisSpacing: 10.h),
                          itemBuilder: (context, index) {
                            return CategoryItem(
                              genres: state.genresList[index],
                            );
                          },
                          itemCount: state.genresList.length),
                    );
                  }
                  return Container();
                },
              )
          )
        ],
      ),
    );
  }
}

