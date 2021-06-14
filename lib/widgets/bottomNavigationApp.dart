import 'package:flutter/material.dart';
import 'package:unicons/unicons.dart';

import 'dart:math' as math;

class BottomNavigationApp extends StatelessWidget {
  const BottomNavigationApp({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
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
      ),
    );
  }
}
