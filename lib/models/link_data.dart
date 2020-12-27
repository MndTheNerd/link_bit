import 'package:flutter/material.dart';
import 'package:url_launcher/link.dart';

class LinkData {
  final String title;
  final String url;

  LinkData({@required this.title, @required this.url});

  factory LinkData.fromMap(Map<String, dynamic> data){
    return LinkData(title: data['title'], url: data['url'],);
  }
}
