part of 'search_imports.dart';

class SearchScreen extends StatelessWidget {
  const SearchScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: BlocBuilder<SearchBloc, SearchState>(
          bloc: getIt<SearchBloc>()..add(FetchMoviesEvent()),
          builder: (context, state) {
            if (state is SearchLoadedState) {
              return Column(
                children: [
                  const Expanded(
                    flex: 1,
                    child: FractionallySizedBox(
                      heightFactor: 0.75,
                      widthFactor: 1,
                      alignment: Alignment.bottomLeft,
                      child: FittedBox(
                        alignment: Alignment.topLeft,
                        child: _Header(),
                      ),
                    ),
                  ),
                  const Expanded(
                    child: _Search(),
                  ),
                  SizedBox(
                    height: 50,
                    child: _Categories(state: state),
                  ),
                  Expanded(
                    flex: 5,
                    child: _MovieGrid(),
                  )
                ],
              );
            }
            return const Center(
              child: Text('No data available'),
            );
          },
        ),
      ),
    );
  }
}

class _Categories extends StatelessWidget {
  const _Categories({required this.state});

  final SearchLoadedState state;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0),
      child: ListView.builder(
        itemCount: state.categories.length,
        scrollDirection: Axis.horizontal,
        itemBuilder: (context, index) {
          final isSelected = state.selectedCategoryIndex == index;

          return Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8.0),
            child: FractionallySizedBox(
              heightFactor: 0.8,
              alignment: Alignment.topCenter,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Flexible(
                    child: FittedBox(
                      child: GestureDetector(
                        onTap: () {
                          context
                              .read<SearchBloc>()
                              .add(SelectCategoryEvent(index: index));
                        },
                        child: Text(
                          state.categories[index],
                          style: PrimaryFont.regular(16).copyWith(
                            color: Colors.white,
                          ),
                        ),
                      ),
                    ),
                  ),
                  Container(
                    height: 3,
                    decoration: BoxDecoration(
                      color: isSelected ? Colors.red : Colors.transparent,
                      borderRadius: BorderRadius.circular(
                        10,
                      ),
                    ),
                    width: 26,
                  )
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}

class _Search extends StatelessWidget {
  const _Search();

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0),
      child: FractionallySizedBox(
        heightFactor: 0.6,
        child: TextField(
          decoration: InputDecoration(
            prefixIcon: const Icon(
              Icons.search_sharp,
              color: Colors.white,
              size: 25,
            ),
            fillColor: kDarkColor,
            filled: true,
            hintText: 'Sherlock Holmes',
            border: OutlineInputBorder(
              borderSide: BorderSide.none,
              borderRadius: BorderRadius.circular(15),
            ),
            hintStyle: PrimaryFont.regular(14).copyWith(
              color: const Color(0XFFBBBBBB),
            ),
          ),
          style: PrimaryFont.regular(14).copyWith(
            color: Colors.white,
          ),
        ),
      ),
    );
  }
}

class _Header extends StatelessWidget {
  const _Header();

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 24.0),
      child: Text(
        'Find Movies, Tv series,\nand more..',
        style: PrimaryFont.regular(24).copyWith(
          color: Colors.white,
        ),
      ),
    );
  }
}

class _MovieGrid extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SearchBloc, SearchState>(
      builder: (context, state) {
        if (state is SearchLoadedState && state.isLoadingMovie == true) {
          return const _SkeletonMovie();
        } else {}

        if (state is SearchLoadedState) {
          return _Movies(
            state: state,
          );
        }

        return const SizedBox.shrink();
      },
    );
  }
}

class _Movies extends StatelessWidget {
  const _Movies({required this.state});

  final SearchLoadedState state;

  @override
  Widget build(BuildContext context) {
    return MasonryGridView.count(
        crossAxisCount: 2,
        crossAxisSpacing: 20,
        mainAxisSpacing: 10,
        reverse: false,
        itemCount: state.movies.length,
        padding: const EdgeInsets.fromLTRB(16, 0, 16, 16),
        itemBuilder: (context, index) {
          final movie = state.movies[index];
          final imageUrl =
              "https://img.ophim.live/uploads/movies/${movie.posterUrl}";

          return GestureDetector(
            onTap: () {
              Navigator.of(context).pushNamed('/movie-detail');
            },
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Container(
                  padding: EdgeInsets.only(top: index % 2 != 0 ? 20 : 0),
                  height: 184,
                  child: LayoutBuilder(builder: (context, constraints) {
                    return ClipRRect(
                      borderRadius: BorderRadius.circular(20),
                      child: CachedNetworkImage(
                        imageUrl: imageUrl,
                        fit: BoxFit.cover,
                      ),
                    );
                  }),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 10),
                  child: RichText(
                    text: TextSpan(
                      text: '${movie.name!} ',
                      style: PrimaryFont.regular(16).copyWith(
                        color: Colors.white,
                      ),
                      children: [
                        TextSpan(
                          text: '(${movie.year})',
                          style: PrimaryFont.regular(16).copyWith(
                            color: const Color(0xFFBCBCBC),
                          ),
                        )
                      ],
                    ),
                  ),
                ),
              ],
            ),
          );
        });
  }
}

class _SkeletonMovie extends StatelessWidget {
  const _SkeletonMovie();

  @override
  Widget build(BuildContext context) {
    return Shimmer.fromColors(
      baseColor: Colors.grey[850]!,
      highlightColor: Colors.grey[700]!,
      child: MasonryGridView.count(
          crossAxisCount: 2,
          crossAxisSpacing: 20,
          mainAxisSpacing: 10,
          reverse: false,
          itemCount: 6,
          padding: const EdgeInsets.fromLTRB(16, 0, 16, 16),
          itemBuilder: (context, index) {
            return Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Container(
                  padding: EdgeInsets.only(top: index % 2 != 0 ? 20 : 0),
                  height: 184,
                  child: LayoutBuilder(builder: (context, constraints) {
                    return ClipRRect(
                        borderRadius: BorderRadius.circular(20),
                        child: Container(
                          color: Colors.white,
                        ));
                  }),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 10),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      // Title skeleton
                      Container(
                        height: 16,
                        width: double.infinity,
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(4),
                        ),
                      ),
                      const SizedBox(height: 4),
                      // Year skeleton
                      Container(
                        height: 16,
                        width: 60,
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(4),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            );
          }),
    );
  }
}
