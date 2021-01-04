import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:link_bit/models/link_data.dart';
import 'package:link_bit/screens/not_found_page.dart';
import 'package:provider/provider.dart';
import 'screens/settings_page.dart';
import 'screens/links_landing_screen.dart';
import 'screens/not_found_page.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  FirebaseFirestore.instance.settings = Settings(
    host: 'localhost:8080',
    sslEnabled: false,
    persistenceEnabled: false,
  );
  runApp(MyApp());
}

// main page settings
class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return StreamBuilder<QuerySnapshot>(
        stream: FirebaseFirestore.instance.collection('links').snapshots(),
        builder: (context, snapshot) {
          //using a progress indicator while the data loads
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(
              child: CircularProgressIndicator(),
            );
          }
          //grabbing the data from firebase and convert it according to the data type used
          final _documents = snapshot.data.docs.map((doc) {
            return LinkData.fromMap(doc.data());
          }).toList();
          return ProxyProvider0<List<LinkData>>(
            update: (context, linkDataList) => _documents,
            child: MaterialApp(
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
            ),
          );
        });
  }
}
