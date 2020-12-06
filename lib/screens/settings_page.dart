import 'package:flutter/material.dart';
import 'package:link_bit/screens/sections/preview_section.dart';
import 'sections/button_settings_section.dart';

class SettingsPage extends StatelessWidget {
  const SettingsPage({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Row(
        children: [ButtonSettingsSection(), PreviewSection()],
      ),
    );
  }
}
