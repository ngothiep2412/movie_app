part of 'home_imports.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            Expanded(
              child: FractionallySizedBox(
                heightFactor: 0.35,
                widthFactor: 1,
                child: FittedBox(
                  alignment: Alignment.centerLeft,
                  child: _Header(),
                ),
              ),
            ),
            Expanded(
              flex: 2,
              child: _Banner(),
            ),
            Expanded(child: _TextTrending()),
            Expanded(
              flex: 4,
              child: _Carouse(),
            )
          ],
        ),
      ),
    );
  }
}

class _Carouse extends StatelessWidget {
  const _Carouse();

  @override
  Widget build(BuildContext context) {
    return CarouselSlider.builder(
      options: CarouselOptions(
        aspectRatio: 2.0,
        enlargeCenterPage: false,
        viewportFraction: 0.75,
        height: double.infinity,
      ),
      itemCount: (3).round(),
      itemBuilder: (context, index, realIdx) {
        return Container(
          // heightFactor: 1,
          width: context.sizeScreen.width * 0.7,
          margin: const EdgeInsets.symmetric(horizontal: 16),
          child: Stack(
            children: [
              FractionallySizedBox(
                heightFactor: 1,
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(
                    30,
                  ),
                  child: Image.asset(
                    'assets/images/banner.png',
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              Align(
                alignment: const Alignment(0.0, 0.85),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(20),
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
                        borderRadius: BorderRadius.circular(20),
                      ),
                      child: FractionallySizedBox(
                        widthFactor: 0.85,
                        child: FittedBox(
                          child: Text(
                            textAlign: TextAlign.center,
                            'Star Wars: The Last Jedi',
                            style: PrimaryFont.regular(18).copyWith(
                              color: Colors.white,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
              ),
              Align(
                alignment: const Alignment(0.8, -0.85),
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
                                          style: PrimaryFont.medium(9).copyWith(
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
                                      '8.0',
                                      style: PrimaryFont.medium(16).copyWith(
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
        heightFactor: 0.35,
        widthFactor: 1,
        alignment: Alignment.center,
        child: FittedBox(
          alignment: Alignment.bottomLeft,
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
                                style: PrimaryFont.medium(16).copyWith(
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
