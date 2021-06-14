import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:travel_app/page/details/widgets/widgets.dart';

class DetailsPage extends StatefulWidget {
  final Map<String, dynamic> place;
  DetailsPage({Key? key, required this.place}) : super(key: key);

  @override
  _DetailsPageState createState() => _DetailsPageState();
}

class _DetailsPageState extends State<DetailsPage> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Stack(
        children: [
          PhotoDetailsPage(
            place: widget.place,
          ),
          ControlPhotoDetailsPage(
            place: widget.place,
          ),
        ],
      ),
    );
  }
}
