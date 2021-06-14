import 'package:flutter/material.dart';
import 'package:travel_app/extensions/wigets.dart';



class TabsHomePage extends StatefulWidget {
  final List<String> tabs;
  TabsHomePage({Key? key, required this.tabs}) : super(key: key);

  @override
  _TabsHomePageState createState() => _TabsHomePageState();
}

class _TabsHomePageState extends State<TabsHomePage> {
  int activeIndex = 0;
  @override
  Widget build(BuildContext context) {
    return SliverPadding(
      padding: const EdgeInsets.symmetric(vertical: 16),
      sliver: SliverToBoxAdapter(
        child: Container(
          height: 40,
          child: ListView.builder(
            scrollDirection: Axis.horizontal,
            itemCount: widget.tabs.length,
            itemBuilder: (context, index) {
              bool isActiveted = activeIndex == index;
              return GestureDetector(
                onTap: () => onTapTableBar(index),
                child: Container(
                  margin: const EdgeInsets.only(right: 32),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      Text(
                        widget.tabs[index],
                        style: isActiveted
                            ? Theme.of(context).textTheme.headline4!.copyWith(
                                color: Theme.of(context).primaryColor,
                                fontWeight: FontWeight.w600)
                            : Theme.of(context).textTheme.headline4!,
                      ),
                      isActiveted
                          ? Container(
                              height: 8,
                              width: 8,
                              decoration: BoxDecoration(
                                shape: BoxShape.circle,
                                color: Theme.of(context).primaryColor,
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
    );
  }

  void onTapTableBar(index) {
    setState(() {
      activeIndex = index;
    });
  }
}
