part of 'general_imports.dart';

class General extends StatefulWidget {
  const General({super.key});

  @override
  State<General> createState() => _GeneralState();
}

class _GeneralState extends State<General> {
  int visit = 0;

  List<TabItem> items = [
    const TabItem(
      icon: Icons.home_filled,
    ),
    const TabItem(
      icon: Icons.play_arrow_sharp,
    ),
    const TabItem(
      icon: Icons.person,
    ),
  ];

  List<Widget> pages = [
    const HomeScreen(),
    const SearchScreen(),
    const ProfileScreen(),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: IndexedStack(
        index: visit,
        children: pages,
      ),
      bottomNavigationBar: BottomBarCreative(
        items: items,
        iconSize: 34,
        backgroundColor: kPrimaryBackgroundColor,
        color: Colors.white,
        colorSelected: kPrimaryRedColor,
        indexSelected: visit,
        onTap: (int index) => setState(() {
          visit = index;
        }),
      ),
    );
  }
}
