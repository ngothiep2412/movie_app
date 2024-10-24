part of 'detail_imports.dart';

class DetailScreen extends StatelessWidget {
  const DetailScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Expanded(
            flex: 2,
            // width: double.infinity,
            // height: 400,
            child: Stack(
              children: [
                const FractionallySizedBox(
                  widthFactor: 1,
                  child: CachedImageWidget(
                    imgUrl:
                        "https://img.ophim.live/uploads/movies/them-mot-lan-nua-thumb.jpg",
                    // fit: BoxFit.cover,
                    // alignment: Alignment.center,
                    // ),
                  ),
                ),
                Align(
                  alignment: const Alignment(-0.8, -0.5),
                  child: IconButton(
                      onPressed: () {
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
            ),
          ),
          Expanded(
            flex: 3,
            child: Padding(
              padding: const EdgeInsets.symmetric(
                vertical: 16,
                horizontal: 16,
              ),
              child: SingleChildScrollView(
                // physics: AlwaysScrollableScrollPhysics(),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    Row(
                      children: [
                        Align(
                          alignment: Alignment.centerLeft,
                          child: Container(
                            padding: const EdgeInsets.all(6),
                            decoration: BoxDecoration(
                              color: Colors.red,
                              borderRadius: BorderRadius.circular(
                                12,
                              ),
                            ),
                            child: Text(
                              'Vietsub',
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
                            padding: const EdgeInsets.all(6),
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
                              'Hàn Quốc',
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
                            child: FittedBox(
                              alignment: Alignment.centerLeft,
                              child: Text(
                                "Star Wars: The Last Jedi",
                                style: PrimaryFont.regular(24).copyWith(
                                  color: Colors.white,
                                ),
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
                                'HD',
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
                          '30 phút/tập',
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
                          '7.0 (IMDb)',
                          style: PrimaryFont.regular(14).copyWith(
                            color: Colors.white,
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    ElevatedButton(
                      onPressed: () {},
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
                    RichText(
                      text: TextSpan(
                        text:
                            'Rey (Daisy Ridley) finally manages to find the legendary Jedi knight, Luke Skywalker (Mark Hamill) on an island with a magical aura. The heroes of The Force Awakens including Leia, Finn...',
                        style: PrimaryFont.regular(14).copyWith(
                          color: Colors.white,
                        ),
                        children: [
                          TextSpan(
                            text: 'Read more',
                            style: PrimaryFont.bold(14).copyWith(
                              color: Colors.white,
                            ),
                            recognizer: TapGestureRecognizer()
                              ..onTap = () {
                                // TO DO
                              },
                          )
                        ],
                      ),
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
                      child: ListView.separated(
                        separatorBuilder: (context, index) {
                          return const SizedBox(
                            width: 20,
                          );
                        },
                        scrollDirection: Axis.horizontal,
                        itemCount: 10,
                        itemBuilder: (context, index) {
                          return Container(
                            // height: 200,
                            width: 200,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(20),
                            ),
                            child: FractionallySizedBox(
                              heightFactor: 1,
                              child: LayoutBuilder(
                                  builder: (context, constraints) {
                                return ClipRRect(
                                  borderRadius: BorderRadius.circular(20),
                                  child: Stack(
                                    children: [
                                      CachedImageWidget(
                                        imgUrl:
                                            "https://img.ophim.live/uploads/movies/them-mot-lan-nua-thumb.jpg",
                                        imgHeight: constraints.maxHeight,
                                      ),
                                      Center(
                                        child: IconButton(
                                          onPressed: () {},
                                          icon: const Icon(
                                            Icons.play_circle,
                                            color: Colors.white,
                                            size: 46,
                                          ),
                                        ),
                                      ),
                                      Align(
                                        alignment: const Alignment(-0.8, 0.8),
                                        child: Text(
                                          'Tập ${index + 1}',
                                          style: PrimaryFont.bold(18).copyWith(
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
                    // const Divider(
                    //   height: 30,
                    //   thickness: BorderSide.strokeAlignCenter,
                    //   color: Colors.white,
                    // ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
