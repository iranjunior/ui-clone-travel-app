import 'package:flutter/material.dart';
import 'package:travel_app/page/pages.dart';

void main() {
  runApp(EntryApp());
}

class EntryApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Travel app',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
        primaryColor: Color(0xff316bff),
        accentColor: Color(0xfffafbff),
        backgroundColor: Color(0xff8e94a3),
        textTheme: TextTheme(
          headline1: TextStyle(
            fontFamily: 'Mulish',
            fontSize: 32,
            color: Colors.black,
            fontWeight: FontWeight.w700,
          ),
          headline2: TextStyle(
            fontFamily: 'Mulish',
            fontSize: 20,
            color: Colors.black,
            fontWeight: FontWeight.w600,
          ),
          headline3: TextStyle(
            fontFamily: 'Mulish',
            fontSize: 18,
            color: Colors.black,
            fontWeight: FontWeight.w600,
          ),
          headline4: TextStyle(
            fontFamily: 'Mulish',
            fontSize: 16,
            color: Colors.black,
            fontWeight: FontWeight.w500,
          ),
          headline6: TextStyle(
            fontFamily: 'Mulish',
            color: Colors.grey.shade600,
            fontSize: 14,
            fontWeight: FontWeight.w500,
          ),
          bodyText2: TextStyle(
            fontFamily: 'Mulish',
            color: Colors.grey.shade600,
            fontSize: 16,
            fontWeight: FontWeight.w500,
          ),
          caption: TextStyle(
            fontFamily: 'Mulish',
            color: Colors.white70,
            fontSize: 18,
          ),
          subtitle1: TextStyle(
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
        ),
      ),
      home: HomePage(),
    );
  }
}
