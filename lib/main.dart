import 'package:flutter/material.dart';
import 'package:travel_app/page/home_page.dart';

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
            fontFamily: 'Muli',
            fontSize: 24,
            fontWeight: FontWeight.w700
          ),
          headline2: TextStyle(
            fontFamily: 'Muli',
            fontSize: 20,
            fontWeight: FontWeight.w600
          ),
          headline3: TextStyle(
            fontFamily: 'Muli',
            fontSize: 18,
            fontWeight: FontWeight.w600
          ),
          headline6: TextStyle(
            fontFamily: 'Muli',
            color: Colors.grey,
            fontSize: 14,
            fontWeight: FontWeight.w500
          ),
        ),
      ),
      home: HomePage(),
    );
  }
}
