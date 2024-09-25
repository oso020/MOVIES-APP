import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movie_app/home/search/cubit/search_state.dart';
import 'package:movie_app/home/search/cubit/search_view_model.dart';
import 'package:movie_app/home/search/no_movies_found_model.dart';
import 'package:movie_app/home/search/text_field_widget.dart';
import 'package:movie_app/home/search/search_item.dart';

import '../../color/color_app.dart';

class SearchScreen extends StatefulWidget {
  @override
  State<SearchScreen> createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  SearchViewModel viewModel = SearchViewModel();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    viewModel.getSearch(viewModel.searchText);
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: BlocProvider(
        create: (context) => viewModel..getSearch(viewModel.searchText),
        child: Column(
          children: [
            TextFieldWidget(),
            BlocBuilder<SearchViewModel, SearchState>(
                builder: (context, state) {
              if (viewModel.searchText == '') {
                return NoMoviesFoundModel();
              }
              if (state is SearchLoadingState) {
                return Expanded(
                  flex: 1,
                  child: Center(
                    child: CircularProgressIndicator(
                      color: ColorApp.primaryColor,
                    ),
                  ),
                );
              } else if (state is SearchErrorState) {
                return Column(
                  children: [
                    Text(
                      'Error loading movies',
                      style: Theme.of(context).textTheme.titleSmall,
                    ),
                    ElevatedButton(
                        onPressed: () {
                          viewModel.getSearch(viewModel.searchText);
                        },
                        child: Text('Try again'),
                        style: ElevatedButton.styleFrom(
                          backgroundColor: ColorApp.primaryColor,
                        ))
                  ],
                );
              } else if (state is SearchSuccessState) {
                return Expanded(
                  flex: 1,
                  child: ListView.builder(
                    itemBuilder: (context, index) {
                      return SearchItem(results: state.resultsList[index]);
                    },
                    itemCount: state.resultsList.length,
                  ),
                );
              }
              return Container(
                color: Colors.red,
              );
            })
          ],
        ),
      ),
    );
  }
}
