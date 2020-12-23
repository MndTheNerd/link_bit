import 'package:flutter/material.dart';

class Footer extends StatelessWidget {
  const Footer({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            'Made with Flutter',
            style: TextStyle(fontSize: 12.0),
          ),
          SizedBox(width: 8),
          Image.network(
            'https://cdn4.iconfinder.com/data/icons/logos-brands-5/24/flutter-512.png',
            width: 20,
          )
        ],
      ),
    );
  }
}
