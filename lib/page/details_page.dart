import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:travel_app/extensions/wigets.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';

class DetailsPage extends StatefulWidget {
  final Map<String, dynamic> place;
  DetailsPage({Key? key, required this.place}) : super(key: key);

  @override
  _DetailsPageState createState() => _DetailsPageState();
}

class _DetailsPageState extends State<DetailsPage> {
  double _valueSlide = 0;
  int _quantityPerson = 0;
  double _totalValue = 0;
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Stack(
        children: [
          Stack(
            alignment: Alignment.topCenter,
            children: [
              Container(
                height: MediaQuery.of(context).size.height * 0.55 + 32,
                decoration: BoxDecoration(
                  image: DecorationImage(
                    image: AssetImage(widget.place['image']),
                    fit: BoxFit.cover,
                    colorFilter: ColorFilter.mode(
                      Colors.red.withOpacity(0.15),
                      BlendMode.lighten,
                    ),
                  ),
                ),
              ),
              Positioned(
                width: 200,
                child: Wrap(
                  children: [
                    Text(
                      widget.place['name'],
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
                bottom: 24.0 + 30,
                left: 16,
              ),
              Positioned(
                bottom: 100.0 + 40,
                left: 16,
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    RatingBarIndicator(
                      rating: widget.place['rating'],
                      itemBuilder: (context, index) => Icon(
                        Icons.star,
                        color: Colors.yellow,
                      ),
                      itemCount: 5,
                      itemSize: 24.0,
                      unratedColor: Colors.yellow.withOpacity(0.3),
                      direction: Axis.horizontal,
                    ),
                    RichText(
                      text: TextSpan(
                          text: '${widget.place['rating']}',
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
                          children: [
                            TextSpan(
                              text: '(${widget.place['countRate']})',
                              style: Theme.of(context).textTheme.caption!,
                            ),
                          ]),
                    ),
                  ],
                ),
              ),
              Positioned(
                top: 40 + 16,
                width: MediaQuery.of(context).size.width,
                child: Row(
                  mainAxisSize: MainAxisSize.max,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    GestureDetector(
                      onTap: () => Navigator.pop(context),
                      child: Icon(
                        CupertinoIcons.arrow_left,
                        size: 32,
                        color: Colors.white,
                      ),
                    ),
                    Icon(
                      CupertinoIcons.share,
                      size: 32,
                      color: Colors.white,
                    ),
                  ],
                ).paddingHorizontal(16),
              ),
            ],
          ),
          Positioned(
            height: MediaQuery.of(context).size.height * 0.45,
            bottom: 0,
            child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 24),
              width: MediaQuery.of(context).size.width,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(32),
                  topRight: Radius.circular(32),
                ),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Text(
                    'Newhaven Lighthouse\nin Edinburgh, United Kingdom',
                    style: Theme.of(context).textTheme.headline3,
                  ),
                  SizedBox(
                    height: 16,
                  ),
                  Row(
                    mainAxisSize: MainAxisSize.max,
                    children: [
                      Text(
                        'Available: ',
                        style: Theme.of(context).textTheme.bodyText2,
                      ),
                      Text(
                        '10:00 — 18:00',
                        style: Theme.of(context).textTheme.headline3,
                      ),
                      Text(
                        '  •  ',
                        style: Theme.of(context).textTheme.bodyText2,
                      ),
                      Text(
                        'Mon — Sat',
                        style: Theme.of(context).textTheme.headline3,
                      ),
                    ],
                  ),
                  SizedBox(height: 16),
                  Row(
                    mainAxisSize: MainAxisSize.max,
                    children: [
                      Text(
                        'Duration: ',
                        style: Theme.of(context).textTheme.bodyText2,
                      ),
                      Text(
                        '4 hours',
                        style: Theme.of(context).textTheme.headline3,
                      ),
                      SizedBox(width: 24),
                      Text(
                        'Price: ',
                        style: Theme.of(context).textTheme.bodyText2,
                      ),
                      Text(
                        '${widget.place['pricePerPerson']} \$',
                        style: Theme.of(context).textTheme.headline3,
                      ),
                    ],
                  ),
                  SizedBox(height: 16),
                  Material(
                    color: Colors.transparent,
                    child: SliderTheme(
                      data: SliderThemeData(
                          activeTrackColor: Theme.of(context).primaryColor,
                          inactiveTrackColor:
                              Theme.of(context).primaryColor.withOpacity(0.2),
                          showValueIndicator: ShowValueIndicator.never,
                          trackHeight: 2,
                          trackShape: RoundedRectSliderTrackShape(),
                          activeTickMarkColor: Theme.of(context).primaryColor,
                          inactiveTickMarkColor:
                              Theme.of(context).primaryColor.withOpacity(0.2),
                          thumbColor: Colors.white,
                          thumbShape: RoundSliderThumbShape(
                            enabledThumbRadius: 8.0,
                            disabledThumbRadius: 12.0,
                          ),
                          overlayColor: Theme.of(context).primaryColor,
                          overlayShape: RoundSliderOverlayShape(
                            overlayRadius: 16.0,
                          ),
                          tickMarkShape: RoundSliderTickMarkShape()),
                      child: Slider(
                        value: _valueSlide,
                        divisions: widget.place['limitPerson'],
                        onChanged: _onChangeSlide,
                      ),
                    ),
                  ),
                  SizedBox(height: 16),
                  Text(
                    '${_quantityPerson} ${_quantityPerson > 1 ? 'persons' : 'person'}',
                    style: Theme.of(context).textTheme.bodyText2,
                  ),
                  SizedBox(height: 16),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    mainAxisSize: MainAxisSize.max,
                    children: [
                      Text(
                        'Total: ${_totalValue}\$',
                        style: Theme.of(context).textTheme.headline1,
                      ),
                      GestureDetector(
                          onTap: _quantityPerson != 0 ? () => {} : null,
                          child: Container(
                            padding: const EdgeInsets.all(32),
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(60),
                              color: _quantityPerson == 0 ? Colors.grey : null,
                              gradient: _quantityPerson != 0
                                  ? LinearGradient(
                                      colors: [
                                        Theme.of(context).primaryColor,
                                        Theme.of(context)
                                            .primaryColor
                                            .withOpacity(0.75),
                                      ],
                                      begin: Alignment.topLeft,
                                      end: Alignment.bottomRight,
                                    )
                                  : null,
                            ),
                            child: Text(
                              'Book now',
                              style: Theme.of(context)
                                  .textTheme
                                  .headline2!
                                  .copyWith(
                                    color: Colors.white,
                                  ),
                            ),
                          ))
                    ],
                  )
                ],
              ),
            ),
          )
        ],
      ),
    );
  }

  void _onChangeSlide(double value) {
    setState(() {
      _valueSlide = value;
      _quantityPerson = widget.place['limitPerson'] * value ~/ 1;
      _totalValue = widget.place['pricePerPerson'] * _quantityPerson + 0.0;
    });
  }
}
