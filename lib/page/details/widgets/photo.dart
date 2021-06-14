import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:travel_app/extensions/wigets.dart';



class PhotoDetailsPage extends StatelessWidget {
  final Map<String, dynamic> place;

  const PhotoDetailsPage({
    Key? key,
    required this.place,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.topCenter,
      children: [
        Hero(
          tag: 'photo-${this.place['image']}',
          child: Container(
            height: MediaQuery.of(context).size.height * 0.55 + 32,
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage(this.place['image']),
                fit: BoxFit.cover,
                colorFilter: ColorFilter.mode(
                  Colors.red.withOpacity(0.15),
                  BlendMode.lighten,
                ),
              ),
            ),
          ),
        ),
        Positioned(
          width: 200,
          child: Wrap(
            children: [
              Text(
                this.place['name'],
                style: Theme.of(context).textTheme.subtitle1,
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
                rating: this.place['rating'],
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
                    text: '${this.place['rating']}',
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
                        text: '(${this.place['countRate']})',
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
    );
  }
}
