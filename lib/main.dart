import 'package:flutter/material.dart';
import 'package:link_bit/screens/not_found_page.dart';
import 'screens/settings_page.dart';
import 'screens/links_landing_screen.dart';
import 'screens/not_found_page.dart';

void main() {
  runApp(MyApp());
}

// main page settings
class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'LinkBite',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      initialRoute: '/settings',
      routes: {
        '/': (context) => LinksLandingPage(),
        '/settings': (context) => SettingsPage()
      },
      onUnknownRoute: (settings) {
        return MaterialPageRoute(
          builder: (context) {
            return PageNotFoundPage();
          },
        );
      },
    );
  }
}
