import 'package:flutter/material.dart';

const kTabletBreakPoint = 768.0;
const kDesktopBreakPoint = 1440.0;
const kMaxWidth = 1800.0;

List<Map> tempProductData = [
  {
    'pid': '6g2D0PT1evae7mAmhYwI',
    'name': 'product 1',
    'category': 'category 1',
    'price': 10.00,
    'image': 'img/temp/new0.png',
    'detail': 'some detail goes here',
  },
  {
    'pid': 'UO6YKqx9L04JXVDxEXB9',
    'name': 'product 2',
    'category': 'category 1',
    'price': 20.00,
    'image': 'img/temp/new1.jpg',
    'detail': 'some detail goes here',
  },
  {
    'pid': 'XCLNcq8POEJP93Hdz5gT',
    'name': 'product 3',
    'category': 'category 1',
    'price': 30.00,
    'image': 'img/temp/new2.jpg',
    'detail': 'some detail goes here',
  },
  {
    'pid': 'YxAtM6WjMWQxwSitOL12',
    'name': 'product 4',
    'category': 'category 2',
    'price': 40.00,
    'image': 'img/temp/new3.jpg',
    'detail': 'some detail goes here',
  },
  {
    'pid': 'dQXgfMkCRDWNVo51wgfP',
    'name': 'product 5',
    'category': 'category 2',
    'price': 50.00,
    'image': 'img/temp/new4.jpg',
    'detail': 'some detail goes here',
  },
  {
    'pid': 'k829ky5VCxbH2HfMstJI',
    'name': 'product 6',
    'category': 'category 3',
    'price': 60.00,
    'image': 'img/temp/new5.jpg',
    'detail': 'some detail goes here',
  },
  {
    'pid': 'k8nmzQ9rGXJdTv5T1d4f',
    'name': 'product 7',
    'category': 'category 3',
    'price': 70.00,
    'image': 'img/temp/new6.jpg',
    'detail': 'some detail goes here',
  },
  {
    'pid': 'uHIwmAlq8Erq0xiyqpG6',
    'name': 'product 8',
    'category': 'category 3',
    'price': 80.00,
    'image': 'img/temp/new7.jpg',
    'detail': 'some detail goes here',
  },
];

List<Map> tempBlogData = [
  {
    'bid': 'bid0',
    'title': 'Blog0 Title',
    'content':
        'Blog Post description here a;sjf;alskjaskja;lskjdflkasjflaksjdfalskjf;asldkfajsd;lkfajs;dlkjas;dlkjfas;ldkjfasd;flkasdfklasjdfl;adjsfl',
    'image': 'img/temp/blog0.jpg',
  },
  {
    'bid': 'bid1',
    'title': 'Blog1 Title',
    'content':
        'Blog Post description here a;sjf;alskjaskja;lskjdflkasjflaksjdfalskjf;asldkfajsd;lkfajs;dlkjas;dlkjfas;ldkjfasd;flkasdfklasjdfl;adjsfl',
    'image': 'img/temp/blog1.jpg',
  },
];

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

Map getProductById(pid) {
  var temp;
  tempProductData.forEach(
    (item) {
      if (item['pid'] == pid) {
        temp = item;
      }
    },
  );
  return temp;
}
