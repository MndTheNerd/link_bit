import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:link_bit/models/link_data.dart';
import 'package:link_bit/screens/links_landing_page.dart';
import 'package:link_bit/screens/not_found_page.dart';
import 'package:provider/provider.dart';
import 'screens/settings_page.dart';
import 'screens/links_landing_page.dart';
import 'screens/not_found_page.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  FirebaseFirestore.instance.settings = Settings(
    //host: 'localhost:8080',
    sslEnabled: false,
    persistenceEnabled: false,
  );
  runApp(MyApp());
}

// main page settings
class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final linksCollection = FirebaseFirestore.instance.collection('links');
    final userLinkDataStream = linksCollection.snapshots().map((snapshot) {
      return snapshot.docs.map((doc) {
        return LinkData.fromDocument(doc);
      }).toList();
    });
    return MultiProvider(
      providers: [
        Provider<CollectionReference>(
          create: (context) => linksCollection,
        ),
        StreamProvider<List<LinkData>>(
          create: (context) => userLinkDataStream,
        ),
      ],
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
  }
}
