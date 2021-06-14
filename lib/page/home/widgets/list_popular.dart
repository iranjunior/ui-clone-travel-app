import 'package:flutter/material.dart';
import 'package:travel_app/extensions/wigets.dart';



class ListPopularHomePage extends StatelessWidget {
  const ListPopularHomePage({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SliverPadding(
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
    );
  }
}