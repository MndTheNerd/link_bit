import 'package:flutter/material.dart';
import 'dart:html';
import 'package:url_launcher/url_launcher.dart';

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
          for (var document in documents)
            ButtonLink(
              title: document['title'],
              urlString: document['urlString'],
            ),
        ],
      ),
    );
  }
}

//custom widgets
class ButtonLink extends StatelessWidget {
  const ButtonLink({Key key, @required this.title, @required this.urlString})
      : super(key: key);

  final String title;
  final String urlString;

  @override
  Widget build(BuildContext context) {
    final buttonWidth = MediaQuery.of(context).size.width;
    return Padding(
      padding: const EdgeInsets.only(bottom: 16.0),
      child: SizedBox(
        width: buttonWidth > 680 ? 680 : buttonWidth * 0.90,
        child: FlatButton(
          padding: EdgeInsets.symmetric(vertical: 25),
          onPressed: () => launch(urlString),
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

//funtions

//variables
final imageURL =
    'https://pbs.twimg.com/profile_images/1144213714255659010/kA6Jw2Vs_400x400.jpg';
final documents = [
  {
    'title': 'YouTube',
    'urlString': 'https://www.youtube.com/channel/UCl-ZIqzTGdxF1uAovuGTvFw'
  },
  {'title': 'Twitter', 'urlString': 'https://twitter.com/MndTheNerd?s=09'},
  {'title': 'Instagram', 'urlString': 'https://www.instagram.com/mndthenerd/'},
  {'title': 'GitHub', 'urlString': 'https://github.com/MndTheNerd'}
];
