import 'package:flutter/material.dart';
import 'dart:html';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Material(
      child: Column(
        children: [
          SizedBox(height: 35),
          CircleAvatar(
            backgroundColor: Colors.white,
            backgroundImage: NetworkImage(imageURL),
            radius: 48,
          ),
          SizedBox(height: 12),
          Text(
            '@MndTheNerd',
            style: TextStyle(fontSize: 16, color: Colors.grey),
          ),
          SizedBox(height: 8),
          Text(
            'Developer, Content Creator and a Gamer',
            style: TextStyle(fontSize: 16, color: Colors.grey),
          ),
          SizedBox(height: 20),
          for (var document in documents) ButtonLink(title: document['title']),
        ],
      ),
    );
  }
}

class ButtonLink extends StatelessWidget {
  const ButtonLink({
    Key key,
    @required this.title,
  }) : super(key: key);

  final String title;

  @override
  Widget build(BuildContext context) {
    final buttonWidth = MediaQuery.of(context).size.width;
    return Padding(
      padding: const EdgeInsets.only(bottom: 16.0),
      child: SizedBox(
        width: buttonWidth > 680 ? 680 : buttonWidth * 0.90,
        child: FlatButton(
          padding: EdgeInsets.symmetric(vertical: 25),
          onPressed: () {},
          child: Text(
            title,
            style: TextStyle(fontSize: 16, color: Colors.white),
          ),
          color: Colors.blue[400],
        ),
      ),
    );
  }
}

final imageURL =
    'https://pbs.twimg.com/profile_images/1144213714255659010/kA6Jw2Vs_400x400.jpg';
final documents = [
  {'title': 'YouTube'},
  {'title': 'Twitter'},
  {'title': 'Instagram'},
  {'title': 'GitHub'}
];
