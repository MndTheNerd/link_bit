import 'package:flutter/material.dart';
import 'package:link_bit/screens/links_landing_screen.dart';

class PreviewSection extends StatelessWidget {
  const PreviewSection({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Expanded(
      flex: 2,
      child: Column(
        children: [
          Padding(
              padding: const EdgeInsets.all(10.0),
              child: Text(
                'Preview',
                style: Theme.of(context).textTheme.headline3,
              )),
          SizedBox(height: 20),
          Expanded(
            child: AspectRatio(
              aspectRatio: 1 / 2,
              child: Container(
                  padding: EdgeInsets.all(20),
                  decoration: BoxDecoration(
                      border: Border.all(width: 5),
                      borderRadius: BorderRadius.all(Radius.circular(50))),
                  child: SafeArea(child: LinksLandingPage())),
            ),
          ),
          SizedBox(height: 50),
        ],
      ),
    );
  }
}
