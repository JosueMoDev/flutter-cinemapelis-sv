import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:movies_app/presentation/providers/providers.dart';
import 'package:movies_app/presentation/widgets/widgets.dart';

class HomeScreen extends StatelessWidget {
  static const name = 'home-screen';
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: _HomoView(),
      bottomNavigationBar: CustomNavigationBar(),
    );
  }
}

class _HomoView extends ConsumerStatefulWidget {
  const _HomoView();

  @override
  _HomoViewState createState() => _HomoViewState();
}

class _HomoViewState extends ConsumerState<_HomoView> {
  @override
  void initState(){
    super.initState();
    ref.read(nowPlayingMoviesProvider.notifier).loadNextPage();
  }
  @override
  Widget build(BuildContext context) {
    final nowPlayingSlideShowMovies = ref.watch(moviesSlideShowProvider);
    final movies = ref.watch(nowPlayingMoviesProvider);
    return Column(
      children: [
        const CustomAppBar(),
        MoviesSlideshow(movies: nowPlayingSlideShowMovies),
        MovieHorizontalListView(
          movies: movies,
          title: 'On Cinema',
          subTitle: 'Monday 2th',
          loadNextPage: () => ref.read(nowPlayingMoviesProvider.notifier).loadNextPage(),
        )       
      ]
    );
  }
}