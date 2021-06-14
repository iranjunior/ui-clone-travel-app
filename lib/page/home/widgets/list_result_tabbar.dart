import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:travel_app/page/pages.dart';

class ListResultTabBarHomePage extends StatefulWidget {
  final List<Map<String, dynamic>> listPlaces;
  ListResultTabBarHomePage({Key? key, required this.listPlaces}) : super(key: key);

  @override
  _ListResultTabBarHomePageState createState() => _ListResultTabBarHomePageState();
}

class _ListResultTabBarHomePageState extends State<ListResultTabBarHomePage> {
  int activeIndex = 0;
  @override
  Widget build(BuildContext context) {
    return SliverPadding(
      padding: const EdgeInsets.symmetric(
        vertical: 16,
      ),
      sliver: SliverToBoxAdapter(
        child: Container(
          height: 400,
          child: ListView.builder(
            scrollDirection: Axis.horizontal,
            itemCount: widget.listPlaces.length,
            itemBuilder: (context, index) {
              return GestureDetector(
                onTap: () => Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (_) => DetailsPage(
                            place: widget.listPlaces[index],
                          )),
                ),
                child: Stack(
                  children: [
                    Hero(
                      tag: 'photo-${widget.listPlaces[index]['image']}',
                      child: Container(
                        height: 360,
                        width: 360 * 0.85,
                        margin: EdgeInsets.only(
                            left: index == 0 ? 16 : 8, right: 8),
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(40),
                            image: DecorationImage(
                              image:
                                  AssetImage(widget.listPlaces[index]['image']),
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
                    ),
                    Positioned(
                      width: 200,
                      child: Wrap(
                        children: [
                          Text(
                            widget.listPlaces[index]['name'],
                            style: Theme.of(context).textTheme.subtitle1,
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
                            rating: widget.listPlaces[index]['rating'],
                            itemBuilder: (context, index) => Icon(
                              Icons.star,
                              color: Colors.yellow,
                            ),
                            itemCount: 5,
                            itemSize: 24.0,
                            unratedColor: Colors.yellow.withOpacity(0.3),
                            direction: Axis.horizontal,
                          ),
                          Text(
                            '${widget.listPlaces[index]['rating']}',
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
                                color: Colors.black.withOpacity(0.3),
                                blurRadius: 3,
                                spreadRadius: 0,
                                offset: Offset(0, 0),
                              )
                            ],
                          ),
                          child: Icon(
                            Icons.bookmark,
                            color: widget.listPlaces[index]['isSaved']
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
    );
  }

  void onTapSavedLocal(index) {
    setState(() {
      widget.listPlaces[index] = {
        ...widget.listPlaces[index],
        'isSaved': widget.listPlaces[index]['isSaved'] ? false : true,
      };
    });
  }
}
