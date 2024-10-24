part of 'home_imports.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: BlocBuilder<HomeBloc, HomeState>(
            bloc: getIt<HomeBloc>()..add(FetchMoviesEvent()),
            builder: (context, state) {
              if (state is HomeLoadingState) {
                return const Center(
                  child: CircularProgressIndicator.adaptive(),
                );
              } else if (state is HomeLoadedState) {
                return Column(
                  children: [
                    const Expanded(
                      child: FractionallySizedBox(
                        heightFactor: 0.35,
                        widthFactor: 1,
                        child: FittedBox(
                          alignment: Alignment.centerLeft,
                          child: _Header(),
                        ),
                      ),
                    ),
                    const Expanded(
                      flex: 2,
                      child: _Banner(),
                    ),
                    const Expanded(child: _TextTrending()),
                    Expanded(
                      flex: 4,
                      child: _Carouse(
                        movies: state.movies,
                      ),
                    )
                  ],
                );
              }
              return const Center(
                child: Text('No data available'),
              );
            }),
      ),
    );
  }
}

class _Carouse extends StatelessWidget {
  const _Carouse({required this.movies});

  final List<MovieModel> movies;

  @override
  Widget build(BuildContext context) {
    return CarouselSlider.builder(
      options: CarouselOptions(
        aspectRatio: 2.0,
        // autoPlay: true,
        enlargeCenterPage: false,
        viewportFraction: 0.85,
        height: double.infinity,
      ),
      itemCount: movies.length,
      itemBuilder: (context, index, realIdx) {
        final movie = movies[index];
        final imageUrl =
            "https://ophim16.cc/_next/image?url=http%3A%2F%2Fimg.ophim1.com%2Fuploads%2Fmovies%2F${movie.posterUrl}&w=384&q=100";
        return Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24),
          child: Stack(
            children: [
              Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                ),
                child: FractionallySizedBox(
                  heightFactor: 1,
                  child: LayoutBuilder(builder: (context, constraints) {
                    return ClipRRect(
                      borderRadius: BorderRadius.circular(20),
                      child: CachedImageWidget(
                        imgUrl: imageUrl,
                        imgHeight: constraints.maxHeight,
                      ),
                    );
                  }),
                ),
              ),
              Align(
                alignment: const Alignment(0.0, 0.85),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(20),
                  clipBehavior: Clip.hardEdge,
                  child: BackdropFilter(
                    filter: ImageFilter.blur(
                      sigmaX: 2,
                      sigmaY: 2,
                    ),
                    child: Container(
                      margin: const EdgeInsets.symmetric(horizontal: 16),
                      width: 226,
                      height: 76,
                      alignment: Alignment.center,
                      decoration: BoxDecoration(
                        color: kWhiteBlur.withOpacity(.3),
                        borderRadius: BorderRadius.circular(30),
                      ),
                      child: FractionallySizedBox(
                        widthFactor: 0.85,
                        child: Align(
                          child: Text(
                            textAlign: TextAlign.center,
                            movie.originName!,
                            maxLines: 2,
                            style: PrimaryFont.regular(18).copyWith(
                              color: Colors.white,
                              overflow: TextOverflow.ellipsis,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
              ),
              Align(
                alignment: const Alignment(0.85, -0.85),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(15),
                  child: BackdropFilter(
                    filter: ImageFilter.blur(
                      sigmaX: 2,
                      sigmaY: 2,
                    ),
                    child: Container(
                      width: 77,
                      height: 46,
                      decoration: BoxDecoration(
                        color: kWhiteBlur.withOpacity(.3),
                        borderRadius: BorderRadius.circular(15),
                      ),
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Expanded(
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Flexible(
                                  child: Row(
                                    children: [
                                      Expanded(
                                        child: FractionallySizedBox(
                                          widthFactor: 0.85,
                                          alignment: Alignment.centerRight,
                                          child: Align(
                                            // alignment: Alignment.centerRight,
                                            child: Text(
                                              'IMDb',
                                              style: PrimaryFont.regular(9)
                                                  .copyWith(
                                                color: Colors.white,
                                              ),
                                            ),
                                          ),
                                        ),
                                      ),
                                      const Spacer(),
                                    ],
                                  ),
                                ),
                                Flexible(
                                  flex: 2,
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Expanded(
                                          child: FractionallySizedBox(
                                        widthFactor: 0.85,
                                        alignment: Alignment.centerRight,
                                        child: SvgPicture.asset(
                                            'assets/images/star.svg'),
                                      )),
                                      Expanded(
                                        child: Text(
                                          movie.tmdb!.voteAverage!.toString(),
                                          style:
                                              PrimaryFont.regular(16).copyWith(
                                            color: Colors.white,
                                          ),
                                        ),
                                      )
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              )
            ],
          ),
        );
      },
    );
  }
}

class _TextTrending extends StatelessWidget {
  const _TextTrending();

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 24.0),
      child: FractionallySizedBox(
        heightFactor: 0.4,
        widthFactor: 1,
        alignment: Alignment.center,
        child: FittedBox(
          alignment: Alignment.centerLeft,
          child: Text(
            'Trending',
            style: PrimaryFont.regular(24).copyWith(color: Colors.white),
          ),
        ),
      ),
    );
  }
}

class _Banner extends StatelessWidget {
  const _Banner();

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 24.0),
      child: Stack(
        children: [
          FractionallySizedBox(
            widthFactor: 1,
            child: LayoutBuilder(builder: (context, constraint) {
              return ClipRRect(
                borderRadius: BorderRadius.circular(30),
                child: Image.asset(
                  'assets/images/banner.png',
                  fit: BoxFit.cover,
                  width: constraint.maxWidth,
                ),
              );
            }),
          ),
          Align(
            alignment: const Alignment(-0.75, 0.85),
            child: Container(
              height: 62,
              width: 211,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
                color: kWhiteBlur.withOpacity(.3),
              ),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  const Expanded(
                    flex: 1,
                    child: Icon(
                      Icons.play_circle_fill_outlined,
                      size: 32,
                      color: kPrimaryRedColor,
                    ),
                  ),
                  Expanded(
                    flex: 2,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Flexible(
                          child: FractionallySizedBox(
                            widthFactor: 0.75,
                            alignment: Alignment.centerLeft,
                            child: FittedBox(
                              child: Text(
                                'Continue Watching',
                                style: PrimaryFont.regular(12).copyWith(
                                  color: kWhiteGreyColor,
                                ),
                              ),
                            ),
                          ),
                        ),
                        Flexible(
                          child: FractionallySizedBox(
                            widthFactor: 0.85,
                            alignment: Alignment.centerLeft,
                            child: FittedBox(
                              child: Text(
                                'Ready Player one',
                                style: PrimaryFont.regular(16).copyWith(
                                  color: Colors.white,
                                ),
                              ),
                            ),
                          ),
                        )
                      ],
                    ),
                  ),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}

class _Header extends StatelessWidget {
  const _Header();

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 24),
      child: RichText(
        text: TextSpan(
          text: 'Stream ',
          style: PrimaryFont.regular(24).copyWith(
            color: kPrimaryRedColor,
          ),
          children: [
            TextSpan(
              text: 'Everywhere',
              style: PrimaryFont.regular(24).copyWith(
                color: Colors.white,
              ),
            )
          ],
        ),
      ),
    );
  }
}
