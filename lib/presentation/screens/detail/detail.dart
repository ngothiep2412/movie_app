part of 'detail_imports.dart';

class DetailScreen extends StatelessWidget {
  const DetailScreen({super.key, required this.slugName});

  final String slugName;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocBuilder<DetailBloc, DetailState>(
          bloc: getIt<DetailBloc>()
            ..add(
              FetchMovieAndEpisodeEvent(slugName: slugName),
            ),
          builder: (context, state) {
            if (state is DetailLoadedState && state.isLoading == false) {
              return Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Expanded(
                    flex: 3,
                    child: _Header(state: state),
                  ),
                  Expanded(
                    flex: 3,
                    child: _Body(state: state),
                  ),
                ],
              );
            }

            return const Center(
              child: Text('No data available'),
            );
          }),
    );
  }
}

class _Body extends StatelessWidget {
  const _Body({required this.state});

  final DetailLoadedState state;
  @override
  Widget build(BuildContext context) {
    final sl = getIt<DetailBloc>();
    return Padding(
      padding: const EdgeInsets.symmetric(
        vertical: 16,
        horizontal: 16,
      ),
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Row(
              children: [
                Align(
                  alignment: Alignment.centerLeft,
                  child: Container(
                    padding: const EdgeInsets.symmetric(
                      vertical: 6,
                      horizontal: 6,
                    ),
                    decoration: BoxDecoration(
                      color: Colors.red,
                      borderRadius: BorderRadius.circular(
                        12,
                      ),
                    ),
                    child: Text(
                      state.movie.lang!,
                      style: PrimaryFont.bold(16).copyWith(
                        color: Colors.white,
                      ),
                    ),
                  ),
                ),
                const SizedBox(
                  width: 10,
                ),
                Align(
                  alignment: Alignment.centerLeft,
                  child: Container(
                    padding: const EdgeInsets.symmetric(
                      vertical: 6,
                      horizontal: 16,
                    ),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      border: Border.all(
                        width: 1,
                        strokeAlign: BorderSide.strokeAlignCenter,
                        color: Colors.red,
                      ),
                      borderRadius: BorderRadius.circular(
                        12,
                      ),
                    ),
                    child: Text(
                      state.movie.country![0].name!,
                      style: PrimaryFont.bold(16).copyWith(
                        color: Colors.red,
                      ),
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(
              height: 5,
            ),
            Row(
              children: [
                Expanded(
                  flex: 3,
                  child: FractionallySizedBox(
                    widthFactor: 0.95,
                    alignment: Alignment.centerLeft,
                    child: Text(
                      maxLines: 3,
                      state.movie.name!,
                      style: PrimaryFont.regular(24).copyWith(
                        color: Colors.white,
                        overflow: TextOverflow.ellipsis,
                      ),
                    ),
                  ),
                ),
                Flexible(
                    child: Container(
                  width: 40,
                  height: 30,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: Colors.white,
                  ),
                  child: FractionallySizedBox(
                    heightFactor: 0.8,
                    child: FittedBox(
                      child: Text(
                        textAlign: TextAlign.center,
                        state.movie.quality!,
                        style: PrimaryFont.bold(12).copyWith(
                          color: kDarkColor,
                        ),
                      ),
                    ),
                  ),
                ))
              ],
            ),
            const SizedBox(
              height: 10,
            ),
            Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                const Icon(
                  Icons.timer_sharp,
                  color: Colors.white,
                  size: 20,
                ),
                const SizedBox(
                  width: 10,
                ),
                Text(
                  textAlign: TextAlign.center,
                  state.movie.time!,
                  style: PrimaryFont.regular(14).copyWith(
                    color: Colors.white,
                  ),
                ),
                const SizedBox(
                  width: 20,
                ),
                const Icon(
                  Icons.star,
                  color: Colors.yellow,
                  size: 20,
                ),
                const SizedBox(
                  width: 10,
                ),
                Text(
                  textAlign: TextAlign.center,
                  '${state.movie.tmdb!.voteAverage} (IMDb)',
                  style: PrimaryFont.regular(14).copyWith(
                    color: Colors.white,
                  ),
                ),
              ],
            ),
            const SizedBox(
              height: 10,
            ),
            state.isWatching
                ? SizedBox(
                    height: 250,
                    child: Chewie(
                      controller: state.chewieController!,
                    ),
                  )
                : ElevatedButton(
                    onPressed: () {
                      if (state
                              .movie.episodeList![0].serverData![0].linkEmbed ==
                          "") {
                        DialogUtils.showMyDialog(
                            content: "This video has not available now",
                            title: "Oops",
                            context: context);
                      } else {
                        sl.add(
                          WatchMovieEvent(
                            linkEpisodes: state
                                .movie.episodeList![0].serverData![0].linkM3U8!,
                          ),
                        );
                      }
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.red,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12),
                      ),
                      fixedSize: const Size(
                        double.infinity,
                        56,
                      ),
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const Icon(
                          Icons.play_arrow,
                          color: Colors.white,
                        ),
                        Text(
                          ' Play Video',
                          style: PrimaryFont.bold(16).copyWith(
                            color: Colors.white,
                          ),
                        ),
                      ],
                    ),
                  ),
            const SizedBox(
              height: 10,
            ),
            // RichText(
            //   text: TextSpan(
            //     text: state.isExpanded
            //         ? state.movie.content
            //         : state.movie.content!.substring(0, 100),
            //     style: PrimaryFont.regular(14).copyWith(
            //       color: Colors.white,
            //     ),
            //     children: [
            //       TextSpan(
            //         text: state.isExpanded ? 'Less more' : 'Read more',
            //         style: PrimaryFont.bold(14).copyWith(
            //           color: Colors.white,
            //         ),
            //         recognizer: TapGestureRecognizer()
            //           ..onTap = () {
            //             state.isExpanded
            //                 ? sl.add(
            //                     const ExpandedTextEvent(isExpanded: false),
            //                   )
            //                 : sl.add(
            //                     const ExpandedTextEvent(isExpanded: true),
            //                   );
            //           },
            //       )
            //     ],
            //   ),
            // ),

            Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: state.movie.content!.length < 100
                  ? [
                      Html(
                        data: state.movie.content,
                        style: {
                          "body": Style(
                            fontSize: FontSize(14),
                            color: Colors.white,
                          ),
                        },
                      ),
                    ]
                  : [
                      Html(
                        data: state.isExpanded
                            ? state.movie.content
                            : '${state.movie.content!.substring(0, 100)}...',
                        style: {
                          "body": Style(
                            fontSize: FontSize(14),
                            color: Colors.white,
                          ),
                        },
                      ),
                      Align(
                        alignment: Alignment.centerRight,
                        child: GestureDetector(
                          onTap: () {
                            state.isExpanded
                                ? sl.add(
                                    const ExpandedTextEvent(isExpanded: false),
                                  )
                                : sl.add(
                                    const ExpandedTextEvent(isExpanded: true),
                                  );
                          },
                          child: Text(
                            state.isExpanded ? "Read less" : "Read more",
                            style: PrimaryFont.bold(14).copyWith(
                              color: Colors.white,
                            ),
                          ),
                        ),
                      ),
                    ],
            ),

            const SizedBox(
              height: 20,
            ),
            Align(
              alignment: Alignment.centerLeft,
              child: Text(
                'Episodes',
                style: PrimaryFont.bold(20).copyWith(
                  color: Colors.white,
                ),
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            SizedBox(
              height: 200,
              child: state.movie.episodeList![0].serverData![0].linkEmbed == ""
                  ? Text(
                      'This video has not available now',
                      style: PrimaryFont.regular(16).copyWith(
                        color: Colors.white,
                      ),
                    )
                  : ListView.separated(
                      separatorBuilder: (context, index) {
                        return const SizedBox(
                          width: 20,
                        );
                      },
                      scrollDirection: Axis.horizontal,
                      itemCount: state.movie.episodeList!.length,
                      itemBuilder: (context, index) {
                        return Container(
                          // height: 200,
                          width: 200,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(20),
                          ),
                          child: FractionallySizedBox(
                            heightFactor: 1,
                            child:
                                LayoutBuilder(builder: (context, constraints) {
                              return ClipRRect(
                                borderRadius: BorderRadius.circular(20),
                                child: Stack(
                                  children: [
                                    CachedImageWidget(
                                      imgUrl: state.movie.thumbUrl!,
                                      imgHeight: constraints.maxHeight,
                                    ),
                                    Center(
                                      child: IconButton(
                                        onPressed: () {
                                          sl.add(
                                            WatchMovieEvent(
                                                linkEpisodes: state
                                                    .movie
                                                    .episodeList![0]
                                                    .serverData![index]
                                                    .linkM3U8!),
                                          );
                                        },
                                        icon: const Icon(
                                          Icons.play_circle,
                                          color: Colors.white,
                                          size: 46,
                                        ),
                                      ),
                                    ),
                                    Align(
                                      alignment: const Alignment(-0.8, 0.8),
                                      child:
                                          state.movie.episodeCurrent == 'Full'
                                              ? Text(
                                                  state.movie.episodeCurrent!,
                                                  style: PrimaryFont.bold(18)
                                                      .copyWith(
                                                          color: Colors.white,
                                                          shadows: [
                                                        BoxShadow(
                                                          blurRadius: 5.0,
                                                          color: Colors.black
                                                              .withOpacity(.5),
                                                        )
                                                      ]),
                                                )
                                              : Text(
                                                  'Tập ${index + 1}',
                                                  style: PrimaryFont.bold(18)
                                                      .copyWith(
                                                          color: Colors.white,
                                                          shadows: [
                                                        BoxShadow(
                                                          blurRadius: 5.0,
                                                          color: Colors.black
                                                              .withOpacity(.5),
                                                        )
                                                      ]),
                                                ),
                                    )
                                  ],
                                ),
                              );
                            }),
                          ),
                        );
                      },
                    ),
            ),
            const SizedBox(
              height: 50,
            )
          ],
        ),
      ),
    );
  }
}

class _Header extends StatelessWidget {
  const _Header({required this.state});

  final DetailLoadedState state;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        FractionallySizedBox(
          widthFactor: 1,
          child: CachedImageWidget(
            imgUrl: state.movie.thumbUrl!,
          ),
        ),
        Align(
          alignment: const Alignment(-0.85, -0.5),
          child: IconButton(
              onPressed: () {
                state.chewieController?.dispose();
                Navigator.pop(context);
              },
              alignment: Alignment.center,
              highlightColor: Colors.transparent,
              icon: const Icon(
                Icons.arrow_back_ios,
                color: Colors.white,
                size: 40,
              )),
        )
      ],
    );
  }
}
