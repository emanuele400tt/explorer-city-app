import 'package:flutter/material.dart';

class City {
  final String cityName;
  final String cityImgPath;
  final String description;
  final AlignmentGeometry alignImg;

  City({
    required this.cityName,
    required this.cityImgPath,
    required this.description,
    this.alignImg = Alignment.center,
  });
}
