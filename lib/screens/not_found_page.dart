import 'package:flutter/material.dart';

class PageNotFoundPage extends StatelessWidget {
  const PageNotFoundPage({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Material(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text('404', style: Theme.of(context).textTheme.headline1),
          SizedBox(height: 10),
          Text('Page Not Found', style: Theme.of(context).textTheme.headline3)
        ],
      ),
    );
  }
}
