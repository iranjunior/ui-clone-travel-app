import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:travel_app/page/home/widgets/widget.dart';
import 'package:travel_app/widgets/widgets.dart';

class HomePage extends StatefulWidget {
  HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final _tabs = [
    'Sights',
    'Tours',
    'Adventures',
  ];
  int activeIndex = 0;
  List<Map<String, dynamic>> _listPlaces = [
    {
      'image': 'assets/lighthouse.jpg',
      'name': 'Lighthouse excursions',
      'isSaved': true,
      'rating': 4.6,
      'countRate': 313,
      'pricePerPerson': 20,
      'limitPerson': 8
    },
    {
      'image': 'assets/louvre.webp',
      'name': 'Louvre Museum',
      'isSaved': false,
      'rating': 4.8,
      'countRate': 2390,
      'pricePerPerson': 35,
      'limitPerson': 12
    }
  ];
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        BackgroundHomePage(),
        Scaffold(
          backgroundColor: Colors.transparent,
          body: SafeArea(
            child: CustomScrollView(
              slivers: [
                AppBarHomePage(),
                TabsHomePage(tabs: _tabs),
                CountResultTabsHomePage(),
                ListResultTabBarHomePage(listPlaces: _listPlaces),
                TitlePopularListHomePage(),
                ListPopularHomePage(),
              ],
            ),
          ),
          bottomNavigationBar: BottomNavigationApp(),
        ),
      ],
    );
  }
}

