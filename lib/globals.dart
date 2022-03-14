import 'package:flutter/material.dart';

const kTabletBreakPoint = 768.0;
const kDesktopBreakPoint = 1440.0;
const kMaxWidth = 1180.0;

List<String> imgList = [
  'img/temp/new0.png',
  'img/temp/new1.jpg',
  'img/temp/new2.jpg',
  'img/temp/new3.jpg',
  'img/temp/new4.jpg',
  'img/temp/new5.jpg',
  'img/temp/new6.jpg',
  'img/temp/new7.jpg',
];

List<String> blogList = [
  'img/temp/blog0.jpg',
  'img/temp/blog1.jpg',
];

getHeight(context, multiple) {
  return MediaQuery.of(context).size.height * multiple;
}

getWidth(context, multiple) {
  return MediaQuery.of(context).size.width * multiple;
}
