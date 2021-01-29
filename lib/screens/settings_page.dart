import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:link_bit/screens/sections/preview_section.dart';
import 'sections/button_settings_section.dart';

class SettingsPage extends StatelessWidget {
  const SettingsPage({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        actions: [
          FlatButton.icon(
              onPressed: () {
                FirebaseAuth.instance.signOut();
              },
              icon: Icon(Icons.logout),
              label: Text('Logout'))
        ],
      ),
      body: Row(
        children: [ButtonSettingsSection(), PreviewSection()],
      ),
    );
  }
}
