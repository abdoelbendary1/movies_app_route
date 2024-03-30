import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movies_app_route/presentation/browse/view/browesItem.dart';
import 'package:movies_app_route/presentation/browse/view/moviesByGenreScreen.dart';
import 'package:movies_app_route/presentation/browse/viewModel/browseCubit/genreStates.dart';
import 'package:movies_app_route/presentation/browse/viewModel/browseCubit/genreViewModel.dart';
import 'package:movies_app_route/theme/appTheme.dart';

class BrowseView extends StatefulWidget {
  BrowseView({super.key});

  @override
  State<BrowseView> createState() => _BrowseViewState();
}

class _BrowseViewState extends State<BrowseView> {
  GenreViewModel genreViewModel = GenreViewModel();
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    genreViewModel.getGenres();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: Icon(
          Icons.arrow_back,
          color: MyTheme.yellowColor,
          size: 35,
        ),
        backgroundColor: MyTheme.blackColor,
        toolbarHeight: 100,
        title: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Text(
              "Browse Category",
              style: Theme.of(context).textTheme.titleLarge,
            ),
          ],
        ),
      ),
      body: Column(
        children: [
          Expanded(
              child: BlocBuilder<GenreViewModel, GenreStates>(
            bloc: genreViewModel,
            builder: (context, state) {
              if (state is GenreLoading) {
                return const Center(child: CircularProgressIndicator());
              } else if (state is GenreFailure) {
                return const Text(
                  "error",
                  style: TextStyle(color: Colors.amber),
                );
              } else if (state is GenreSuccess) {
                return GridView.builder(
                  itemCount: state.genres.length,
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2,
                      childAspectRatio: 0.5,
                      mainAxisSpacing: 5),
                  itemBuilder: (context, index) {
                    return GestureDetector(
                      onTap: () {
                        Navigator.pushNamed(
                            context, MoviesByGenreScreen.routeName,
                            arguments: state.genres[index]);
                      },
                      child: BrowesItem(
                        genre: state.genres[index],
                      ),
                    );
                  },
                );
              }
              return Container();
            },
          )),
        ],
      ),
    );
  }
}
