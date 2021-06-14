import 'package:flutter/material.dart';

class AppBarHomePage extends StatelessWidget {
  const AppBarHomePage({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SliverAppBar(
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
    );
  }
}
