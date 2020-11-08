import 'package:flutter/material.dart';
import 'package:link_bit/screens/sections/preview_section.dart';

class SettingsPage extends StatelessWidget {
  const SettingsPage({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Row(
        children: [
          Expanded(
            flex: 3,
            child: Container(
              color: Colors.blueGrey.shade50,
            ),
          ),
          PreviewSection()
        ],
      ),
    );
  }
}
