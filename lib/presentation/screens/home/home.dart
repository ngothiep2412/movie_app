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
                heightFactor: 0.3,
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
              flex: 3,
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
        viewportFraction: 0.65,
        height: double.infinity,
      ),
      itemCount: (3).round(),
      itemBuilder: (context, index, realIdx) {
        return Container(
          // heightFactor: 1,
          width: context.sizeScreen.width * 0.65,
          margin: const EdgeInsets.symmetric(horizontal: 10),
          child: ClipRRect(
            borderRadius: BorderRadius.circular(
              30,
            ),
            child: Image.asset(
              'assets/images/banner.png',
              fit: BoxFit.cover,
            ),
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
            alignment: const Alignment(-0.75, 0.9),
            child: Container(
              height: 62,
              width: 211,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
                color: const Color(0xFFDADADA).withOpacity(.3),
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
                          child: Text(
                            'Continue Watching',
                            style: PrimaryFont.regular(12).copyWith(
                              color: kWhiteGreyColor,
                            ),
                          ),
                        ),
                        Flexible(
                          child: FractionallySizedBox(
                            widthFactor: 0.9,
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
