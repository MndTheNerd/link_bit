import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class ButtonLink extends StatelessWidget {
  const ButtonLink({Key key, @required this.title, @required this.urlString})
      : super(key: key);

  final String title;
  final String urlString;

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        final buttonWidth = constraints.maxWidth;
        return Padding(
          padding: const EdgeInsets.only(bottom: 10.0),
          child: SizedBox(
            width: buttonWidth > 680 ? 680 : buttonWidth * 0.90,
            child: FlatButton(
              padding: EdgeInsets.symmetric(vertical: 20),
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10)),
              onPressed: () => launch(urlString),
              child: Text(
                title,
                style: TextStyle(fontSize: 16, color: Colors.white),
              ),
              color: Colors.blue[400],
            ),
          ),
        );
      },
    );
  }
}
