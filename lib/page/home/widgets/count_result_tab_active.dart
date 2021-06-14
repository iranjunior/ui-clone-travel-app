import 'package:flutter/material.dart';
import 'package:travel_app/extensions/wigets.dart';

class CountResultTabsHomePage extends StatelessWidget {
  const CountResultTabsHomePage({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SliverToBoxAdapter(
      child: Text(
        '23 sights',
        style: Theme.of(context).textTheme.headline6,
      ).paddingHorizontal(16),
    );
  }
}