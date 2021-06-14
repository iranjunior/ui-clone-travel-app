import 'package:flutter/material.dart';

class BackgroundHomePage extends StatelessWidget {
  const BackgroundHomePage({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: [Colors.white, Colors.grey.shade400],
          begin: Alignment.topCenter,
          end: Alignment(0, 4),
        ),
      ),
    );
  }
}