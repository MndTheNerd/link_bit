import 'package:flutter/material.dart';
import 'package:link_bit/models/link_data.dart';
import 'package:provider/provider.dart';
import '../components/footer.dart';
import '../components/button_link.dart';
import 'package:link_bit/constants.dart';

class LinksLandingPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final _documents = Provider.of<List<LinkData>>(context);
    //using a progress indicator while the data loads
    if (_documents == null) {
      return Center(
        child: CircularProgressIndicator(),
      );
    }
    return Material(
      child: Column(
        children: [
          SizedBox(height: 35),
          CircleAvatar(
            backgroundColor: Colors.white,
            backgroundImage: NetworkImage(imageURL),
            radius: 42,
          ),
          SizedBox(height: 12),
          Text(
            '@MndTheNerd',
            style: TextStyle(fontSize: 14, color: Colors.grey),
          ),
          SizedBox(height: 8),
          Text(
            'Developer, Content Creator and a Gamer',
            style: TextStyle(fontSize: 12, color: Colors.grey),
          ),
          SizedBox(height: 20),
          if (_documents.isEmpty)
            Padding(
              padding: const EdgeInsets.only(top: 50.0),
              child: Text('Whoops, no links here yet.'),
            ),
          //go through a document map and add button for each one
          for (var document in _documents)
            ButtonLink(
              title: document.title,
              urlString: document.url,
            ),
          Spacer(),
          Footer()
        ],
      ),
    );
  }
}
