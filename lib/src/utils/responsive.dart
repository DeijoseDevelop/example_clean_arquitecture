import 'dart:math';
import 'package:flutter/material.dart';

class Responsive {
  double? _width, _height, _diagonal;

  double? get width => _width;
  double? get height => _height;
  double? get diagonal => _diagonal;

  static Responsive of(BuildContext context) => Responsive(context);

  Responsive(BuildContext context){
    final Size size = MediaQuery.of(context).size;
    _width = size.width;
    _height = size.height;
    _diagonal = sqrt(pow(_width!, 2) + pow(_height!, 2));
  }

  double widthResponsive(num percent) => width! * percent / 100;
  double heightResponsive(num percent) => height! * percent / 100;
  double diagonalResponsive(num percent) => diagonal! * percent / 100;
}
