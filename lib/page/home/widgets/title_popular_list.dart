import 'package:flutter/material.dart';
import 'package:travel_app/extensions/wigets.dart';



class TitlePopularListHomePage extends StatelessWidget {
  const TitlePopularListHomePage({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SliverPadding(
      padding: const EdgeInsets.symmetric(vertical: 16),
      sliver: SliverToBoxAdapter(
        child: Text(
          'Popular',
          style: Theme.of(context).textTheme.headline2,
        ).paddingHorizontal(16),
      ),
    );
  }
}

