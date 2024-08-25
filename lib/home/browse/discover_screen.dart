import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:movie_app/color/color_app.dart';
import 'package:movie_app/home/browse/category_discover_argument.dart';
import 'package:movie_app/home/browse/discover/cubit/discover_state.dart';
import 'package:movie_app/home/browse/discover/cubit/discover_view_model.dart';
import 'package:movie_app/home/browse/discover/discover_item.dart';

import '../../model/category.dart';

class DiscoverScreen extends StatefulWidget {
  static const String routeName = 'route_name';
  Genres? genres;

  DiscoverScreen({this.genres});

  @override
  State<DiscoverScreen> createState() => _DiscoverScreenState();
}

class _DiscoverScreenState extends State<DiscoverScreen> {
  DiscoverViewModel viewModel = DiscoverViewModel();


  @override
  Widget build(BuildContext context) {
    var args = ModalRoute.of(context)!.settings.arguments as int;
    viewModel.getResults(args.toString() ?? "");

    return Scaffold(
      appBar: AppBar(
        backgroundColor: ColorApp.backgroundColor ,
        foregroundColor: ColorApp.whiteColor,
        centerTitle: true,
        title: Text(
           widget.genres?.name ?? '',
          style: Theme.of(context)
              .textTheme
              .titleSmall!
              .copyWith(fontSize: 30.sp, color: ColorApp.primaryColor),
          textAlign: TextAlign.center,
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(crossAxisAlignment: CrossAxisAlignment.stretch, children: [
          BlocBuilder<DiscoverViewModel,DiscoverState>(
            bloc: viewModel ,
            builder: (context , state){
              if(state is DiscoverLoadingSate){
                return Expanded(
                  child:  Center(
                    child: CircularProgressIndicator(
                      color: ColorApp.primaryColor,
                    ),
                  ),
                );
              }else if(state is DiscoverErrorSate){
                return Column(
                  children: [
                    const Text('Error loading the Movies'),
                    ElevatedButton(
                      onPressed: () {
                        viewModel.getResults(widget.genres?.id.toString() ?? "");
                        setState(() {});
                      },
                      style: ElevatedButton.styleFrom(
                          backgroundColor: ColorApp.primaryColor),
                      child: (const Text('try again')),
                    )
                  ],
                );
              }else if(state is DiscoverSuccessSate){
                return Expanded(
                  child: GridView.builder(
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 3,
                      mainAxisSpacing: 10.h,
                      crossAxisSpacing: 10.w,
                    ),
                    itemBuilder: (context, index) {
                      return DiscoverItem(results: state.resultsList[index]);
                    },
                    itemCount: state.resultsList.length,
                  ),
                );
              }
              return Container();
            },
          )
        ]),
      ),
    );
  }
}
