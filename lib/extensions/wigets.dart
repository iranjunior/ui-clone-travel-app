import 'package:flutter/material.dart';

extension PaddingInWidgets on Widget {
  Widget paddingHorizontal(double value){
    return Padding(padding: EdgeInsets.symmetric(horizontal: value), child: this,);
  }
}