import 'package:flutter/cupertino.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:travel_app/extensions/wigets.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:travel_app/page/details_page.dart';
import 'package:unicons/unicons.dart';
import 'dart:math' as math;

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
        Container(
          decoration: BoxDecoration(
            gradient: LinearGradient(
              colors: [Colors.white, Colors.grey.shade400],
              begin: Alignment.topCenter,
              end: Alignment(0, 4),
            ),
          ),
        ),
        Scaffold(
          backgroundColor: Colors.transparent,
          body: SafeArea(
            child: CustomScrollView(
              slivers: [
                SliverAppBar(
                  centerTitle: false,
                  backgroundColor: Colors.transparent,
                  shadowColor: Colors.transparent,
                  floating: true,
                  title: Text(
                    'Explore',
                    style: Theme.of(context).textTheme.headline1,
                  ),
                  actions: <Widget>[
                    Container(
                      height: 36,
                      width: 36,
                      decoration: BoxDecoration(
                        color: Theme.of(context).primaryColor,
                        shape: BoxShape.circle,
                        border: Border.all(
                          color: Theme.of(context).primaryColor,
                          width: 2,
                        ),
                        image: DecorationImage(
                          fit: BoxFit.contain,
                          image: AssetImage('assets/avatar.jpg'),
                        ),
                      ),
                    ),
                    SizedBox(
                      width: 16,
                    ),
                  ],
                ),
                SliverPadding(
                  padding: const EdgeInsets.symmetric(vertical: 16),
                  sliver: SliverToBoxAdapter(
                    child: Container(
                      height: 40,
                      child: ListView.builder(
                        scrollDirection: Axis.horizontal,
                        itemCount: _tabs.length,
                        itemBuilder: (context, index) {
                          bool isActiveted = activeIndex == index;
                          return GestureDetector(
                            onTap: () => onTapTableBar(index),
                            child: Container(
                              margin: const EdgeInsets.only(right: 32),
                              child: Column(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceAround,
                                children: [
                                  Text(
                                    _tabs[index],
                                    style: isActiveted
                                        ? Theme.of(context)
                                            .textTheme
                                            .headline4!
                                            .copyWith(
                                                color: Theme.of(context)
                                                    .primaryColor,
                                                fontWeight: FontWeight.w600)
                                        : Theme.of(context)
                                            .textTheme
                                            .headline4!,
                                  ),
                                  isActiveted
                                      ? Container(
                                          height: 8,
                                          width: 8,
                                          decoration: BoxDecoration(
                                            shape: BoxShape.circle,
                                            color:
                                                Theme.of(context).primaryColor,
                                          ),
                                        )
                                      : SizedBox.shrink()
                                ],
                              ),
                            ),
                          );
                        },
                      ),
                    ).paddingHorizontal(16),
                  ),
                ),
                SliverToBoxAdapter(
                  child: Text(
                    '23 sights',
                    style: Theme.of(context).textTheme.headline6,
                  ).paddingHorizontal(16),
                ),
                SliverPadding(
                  padding: const EdgeInsets.symmetric(
                    vertical: 16,
                  ),
                  sliver: SliverToBoxAdapter(
                    child: Container(
                      height: 400,
                      child: ListView.builder(
                        scrollDirection: Axis.horizontal,
                        itemCount: _listPlaces.length,
                        itemBuilder: (context, index) {
                          return GestureDetector(
                            onTap: () => Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (_) => DetailsPage(
                                        place: _listPlaces[index],
                                      )),
                            ),
                            child: Stack(
                              children: [
                                Container(
                                  height: 360,
                                  width: 360 * 0.85,
                                  margin: EdgeInsets.only(
                                      left: index == 0 ? 16 : 8, right: 8),
                                  decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(40),
                                      image: DecorationImage(
                                        image: AssetImage(
                                            _listPlaces[index]['image']),
                                        fit: BoxFit.cover,
                                        colorFilter: ColorFilter.mode(
                                          Colors.red.withOpacity(0.15),
                                          BlendMode.lighten,
                                        ),
                                      ),
                                      boxShadow: [
                                        BoxShadow(
                                            color: Theme.of(context)
                                                .primaryColor
                                                .withOpacity(0.2),
                                            blurRadius: 20,
                                            spreadRadius: 2,
                                            offset: Offset(10, 10))
                                      ]),
                                ),
                                Positioned(
                                  width: 200,
                                  child: Wrap(
                                    children: [
                                      Text(
                                        _listPlaces[index]['name'],
                                        style: TextStyle(
                                          color: Colors.white,
                                          fontSize: 30,
                                          fontFamily: 'Mulish',
                                          fontWeight: FontWeight.w600,
                                          shadows: [
                                            BoxShadow(
                                              color: Colors.black,
                                              blurRadius: 20,
                                              spreadRadius: 2,
                                              offset: Offset(00, 0),
                                            )
                                          ],
                                        ),
                                      )
                                    ],
                                  ),
                                  bottom: 24.0 + 40,
                                  left: 24.0 + 16,
                                ),
                                Positioned(
                                  bottom: 100.0 + 40,
                                  left: 24.0 + 16,
                                  child: Row(
                                    crossAxisAlignment: CrossAxisAlignment.end,
                                    children: [
                                      RatingBarIndicator(
                                        rating: _listPlaces[index]['rating'],
                                        itemBuilder: (context, index) => Icon(
                                          Icons.star,
                                          color: Colors.yellow,
                                        ),
                                        itemCount: 5,
                                        itemSize: 24.0,
                                        unratedColor:
                                            Colors.yellow.withOpacity(0.3),
                                        direction: Axis.horizontal,
                                      ),
                                      Text(
                                        '${_listPlaces[index]['rating']}',
                                        style: TextStyle(
                                          color: Colors.white,
                                          fontWeight: FontWeight.w700,
                                          fontSize: 18,
                                          shadows: [
                                            BoxShadow(
                                              color: Colors.black,
                                              blurRadius: 20,
                                              spreadRadius: 2,
                                              offset: Offset(00, 0),
                                            )
                                          ],
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                                Positioned(
                                  top: 16,
                                  right: 16.0 + 16.0,
                                  child: GestureDetector(
                                    onTap: () => onTapSavedLocal(index),
                                    child: Container(
                                      height: 40,
                                      width: 40,
                                      decoration: BoxDecoration(
                                        color: Colors.white,
                                        shape: BoxShape.circle,
                                        boxShadow: [
                                          BoxShadow(
                                            color:
                                                Colors.black.withOpacity(0.3),
                                            blurRadius: 3,
                                            spreadRadius: 0,
                                            offset: Offset(0, 0),
                                          )
                                        ],
                                      ),
                                      child: Icon(
                                        Icons.bookmark,
                                        color: _listPlaces[index]['isSaved']
                                            ? Theme.of(context).primaryColor
                                            : Colors.grey.shade400,
                                      ),
                                    ),
                                  ),
                                )
                              ],
                            ),
                          );
                        },
                      ),
                    ),
                  ),
                ),
                SliverPadding(
                  padding: const EdgeInsets.symmetric(vertical: 16),
                  sliver: SliverToBoxAdapter(
                    child: Text(
                      'Popular',
                      style: Theme.of(context).textTheme.headline2,
                    ).paddingHorizontal(16),
                  ),
                ),
                SliverPadding(
                  padding: const EdgeInsets.symmetric(vertical: 16),
                  sliver: SliverList(
                    delegate: SliverChildBuilderDelegate(
                      (context, index) {
                        return Card(
                          elevation: 0,
                          shape: RoundedRectangleBorder(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(16))),
                          child: Padding(
                            padding: const EdgeInsets.all(16.0),
                            child: Row(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Container(
                                  height: 60,
                                  width: 60,
                                  decoration: BoxDecoration(
                                    borderRadius:
                                        BorderRadius.all(Radius.circular(8)),
                                    image: DecorationImage(
                                        image: AssetImage('assets/europe.jpg'),
                                        fit: BoxFit.cover),
                                  ),
                                ),
                                SizedBox(
                                  width: 16,
                                ),
                                Column(
                                  mainAxisSize: MainAxisSize.max,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  children: [
                                    Text(
                                      'European Tour',
                                      style:
                                          Theme.of(context).textTheme.headline2,
                                    ),
                                    SizedBox(
                                      height: 8,
                                    ),
                                    Text(
                                      '14 april - 25 april 2021',
                                      style:
                                          Theme.of(context).textTheme.bodyText2,
                                    )
                                  ],
                                ),
                              ],
                            ),
                          ),
                        ).paddingHorizontal(16);
                      },
                      childCount: 1,
                    ),
                  ),
                ),
              ],
            ),
          ),
          bottomNavigationBar: Container(
              padding: const EdgeInsets.symmetric(vertical: 24),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(32),
                  topRight: Radius.circular(32),
                ),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Icon(
                    UniconsLine.estate,
                  ),
                  Container(
                    height: 40,
                    width: 40,
                    decoration: BoxDecoration(
                        gradient: LinearGradient(
                          colors: [
                            Theme.of(context).primaryColor,
                            Theme.of(context).primaryColor.withOpacity(0.6),
                          ],
                          begin: Alignment.topLeft,
                          end: Alignment.bottomRight,
                        ),
                        shape: BoxShape.circle),
                    child: Icon(
                      UniconsLine.search,
                      color: Colors.white,
                    ),
                  ),
                  Icon(
                    UniconsLine.bookmark_full,
                  ),
                  Transform.rotate(
                    angle: math.pi / 2,
                    child: Icon(
                      UniconsLine.polygon,
                    ),
                  ),
                ],
              )),
        ),
      ],
    );
  }

  void onTapTableBar(index) {
    setState(() {
      activeIndex = index;
    });
  }

  void onTapSavedLocal(index) {
    setState(() {
      _listPlaces[index] = {
        ..._listPlaces[index],
        'isSaved': _listPlaces[index]['isSaved'] ? false : true,
      };
    });
  }
}
