import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';


class ControlPhotoDetailsPage extends StatefulWidget {
  final Map<String, dynamic> place;

  const ControlPhotoDetailsPage({
    Key? key,
    required this.place,
  }) : super(key: key);

  @override
  _ControlPhotoDetailsPageState createState() =>
      _ControlPhotoDetailsPageState();
}

class _ControlPhotoDetailsPageState extends State<ControlPhotoDetailsPage> {
  double _valueSlide = 0;
  int _quantityPerson = 0;
  double _totalValue = 0;
  @override
  Widget build(BuildContext context) {
    return Positioned(
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
              '$_quantityPerson ${_quantityPerson > 1 ? 'persons' : 'person'}',
              style: Theme.of(context).textTheme.bodyText2,
            ),
            SizedBox(height: 16),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              mainAxisSize: MainAxisSize.max,
              children: [
                Text(
                  'Total: $_totalValue\$',
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
                        style: Theme.of(context).textTheme.headline2!.copyWith(
                              color: Colors.white,
                            ),
                      ),
                    ))
              ],
            )
          ],
        ),
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
